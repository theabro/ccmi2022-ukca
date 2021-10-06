#!/usr/bin/env python

import iris
import json
import os
import global_attrs
import convert_pp2nc
import numpy as np
import argparse
import datetime
import glob
import cf_units

global entries
global var

# construct input filename
def construct_filename(ens_member,spec):
    sfile=indir+'/r'+ens_member+'i1p1f2/v'+global_attrs.data_version+'/'+spec+'/'+spec+'_AmonZ_UKESM1-StratTrop_refD1_r'+ens_member+'i1p1f2_grz_19600101-20190101.nc'
    print("reading from "+sfile)
    return sfile


ens_member_list=['1','2','3']

var_list=['cly','bry']

stream='AmonZ'

indir='/gws/nopw/j04/ukca_vol2/nlabraham/CCMI2022/upload/CCMI2022/model-output/NCAS-CAMBRIDGE/UKESM1-StratTrop/refD1/mon/atmos/monthly'
odir='/gws/nopw/j04/ukca_vol2/nlabraham/CCMI2022/upload'
json_dir='/home/users/nlabraham/git/ccmi-2022/Tables'

# delete existing attributes to be filled from here
keys=['activity_id','contact','creation_date','data_specs_version','data_version','experiment','experiment_id','forcing_index','frequency','grid','grid_label','initialization_index','institution_id','institution','license','mip_era','nominal_resolution','physics_index','product','realization_index','realm','source','source_id','source_type','sub_experiment','sub_experiment_id','table_id','tracking_id','history','variable_id','variant_label']


# read-in JSON information
json_file='CCMI2022_'+stream+'.json'
with open(json_dir+'/'+json_file) as json_file:
    entries=json.load(json_file)
    

# read-in JSON CV information
json_file='CCMI2022_CV.json'
with open(json_dir+'/'+json_file) as json_file:
    CV=json.load(json_file)


for var in var_list:
    
    species=[]
    if var == 'cly':
        # Cly: do cl2o2 twice as contains 2x Cl
        species=['cl','clo','cl2o2','cl2o2','oclo','brcl','hocl','clono2','hcl']
        history=' cly='
    elif var == 'bry':
        # Bry: 
        species=['br','brcl','brono2','hbr','hobr','bro']
        history=' bry='


    for ens_member in ens_member_list:
        
        # read-in initial cube
        spec=species[0]
        print(spec)
        cube=iris.load_cube(construct_filename(ens_member,spec))
        history=history+spec
        cube.attributes['STASH']=str(cube.attributes['STASH'])
        
        for spec in species[1:]:
            print(spec)
            tcube=iris.load_cube(construct_filename(ens_member,spec))
            cube.data=cube.data + tcube.data
            history=history+'+'+spec
            cube.attributes['STASH']=cube.attributes['STASH']+', '+str(tcube.attributes['STASH'])
        
        # construct suite-id from history attribute
        suiteid=[]
        for x in cube.attributes['history'].split():
            if "u-" in x:
                x = [''.join(c for c in s if c not in ",.") for s in x]
                x = [s for s in x if s]
                x = ''.join(x)
                suiteid.append(str(x))


        # rename cube information for the required summed field
        cube.attributes['in_units']=str(cube.units)
        cube.attributes['conversion_factor']=1
        # The following should apply to all cubes read-in, take values from json
        cube.rename(name=str(entries['variable_entry'][var]['out_name']))
        cube.units=str(entries['variable_entry'][var]['units'])
        # set standard name, but cope if this won't work so just set long name
        try:
            cube.standard_name=str(entries['variable_entry'][var]['standard_name'])
        except:
            pass
        cube.long_name=str(entries['variable_entry'][var]['long_name'])
        cube.var_name=str(entries['variable_entry'][var]['out_name'])
        cube.attributes['missing_value']=cube.data.fill_value

        # determine start and end time of data in easy to read format
        start_time=str(cube.coord('time').units.num2date(cube.coord('time').bounds[0,0])).split(' ')[0].replace('-','')
        end_time=str(cube.coord('time').units.num2date(cube.coord('time').bounds[-1,-1])).split(' ')[0].replace('-','')

        # required for metadata
        iris_version=str(iris.__version__)

        # define global attributes for output file
        ga=global_attrs.global_attrs(suiteid, str(cube.var_name), iris_version, CV, member=int(ens_member), table=stream, expt_id=cube.attributes['experiment_id'], grid_label=cube.attributes['grid_label'], source_type=cube.attributes['source_type'], model_name=cube.attributes['source_id'])

        # comment that we've summed-up fields and which ones
        ga.attrs['history']=ga.attrs['history']+history

        for key in keys:
            del cube.attributes[key]

        # save variable to NetCDF in correct directory
        convert_pp2nc.save_field(cube, ga, odir, start_time, end_time)

