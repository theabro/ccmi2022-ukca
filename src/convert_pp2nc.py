#!/usr/bin/env python

import iris
import json
import os
import global_attrs
import numpy as np

# define directories containing things
# output directory
odir='/gws/nopw/j04/ukca_vol2/nlabraham/CCMI2022/upload'
# JSON directories:
#  Tables directory for CCMI-2022 - provided from https://github.com/cedadev/ccmi-2022
json_dir='/home/users/nlabraham/git/ccmi-2022/Tables'
#  definitions of ensemble members
ens_dir='/home/users/nlabraham/git/ccmi2022-ukca/ens'
#  UKESM1 variables
var_dir='/home/users/nlabraham/git/ccmi2022-ukca/vars'


# variable to consider - test with ozone column (toz) at the moment
# will move this to an input file at some point
suiteid=['u-cb159','u-cd315']
var='toz'
in_units='DU'
conversion_factor=1.0e-5
ens_member=1
ppdir='/gws/nopw/j04/ukca_vol2/nlabraham/CCMI2022'
ppstream='apn.pp'
ppfiles='*.pp'
STASHcode='m01s50i219'

stream='Amon'


# read-in JSON information
json_file='CCMI2022_'+stream+'.json'
with open(json_dir+'/'+json_file) as json_file:
    variables=json.load(json_file)

# develop callback for use when reading fils from pp
def CCMI2022_callback(cube, field, filename):
    # define input units to be used in conversion routine
    cube.attributes['in_units']=in_units
    cube.attributes['conversion_factor']=conversion_factor
    # The following should apply to all cubes read-in, take values from json
    cube.rename(name=str(variables['variable_entry'][var]['out_name']))
    cube.units=str(variables['variable_entry'][var]['units'])
    cube.standard_name=str(variables['variable_entry'][var]['standard_name'])
    cube.long_name=str(variables['variable_entry'][var]['long_name'])
    cube.var_name=str(variables['variable_entry'][var]['out_name'])
    #cube.cell_methods=variables['variable_entry'][var]['cell_methods']
    # these set as attributes
    cube.attributes['frequency']=str(variables['variable_entry'][var]['frequency'])
    cube.attributes['modeling_realm']=str(variables['variable_entry'][var]['modeling_realm'])
#    #cube.attributes['cell_measures']=str(variables['variable_entry'][var]['cell_measures'])
    cube.attributes['comment']=str(variables['variable_entry'][var]['comment'])
    cube.attributes['dimensions']=str(variables['variable_entry'][var]['dimensions'])
    cube.attributes['type']=str(variables['variable_entry'][var]['type'])
    cube.attributes['positive']=str(variables['variable_entry'][var]['positive'])
    # valid_min/max need to be set to None if they don't have a value
    if variables['variable_entry'][var]['valid_min'] is not '':
        cube.valid_min = variables['variable_entry'][var]['valid_min']
    else:
        cube.valid_min = None
    if variables['variable_entry'][var]['valid_max'] is not '':
        cube.valid_max = variables['variable_entry'][var]['valid_max']
    else:
        cube.valid_max = None


# function to save to NetCDF
def save_field(cube, ga, start_time, end_time):
    # will need to update name to correct conventions
    opath=odir+'/'+ga.gen_dirname()
    try:
        os.makedirs(opath, exist_ok=True)
    except OSError:
        print ('Creation of the directory %s failed' % opath)
    else:
        print ('Successfully created the directory %s' % opath)

    ofile=opath+'/'+ga.gen_filename(start_time,end_time)
    # check if file exists, if so, remove it so it can be saved
    if os.path.exists(ofile):
        os.remove(ofile)

    # set-up saver
    saver = iris.fileformats.netcdf.Saver(filename=ofile, netcdf_format='NETCDF4_CLASSIC')
    # add global attributes as required
    saver.update_global_attributes(Conventions=iris.fileformats.netcdf.CF_CONVENTIONS_VERSION, attributes=ga.attrs)

    # actually save the field, including local attributes as required
    # not sure if `deflate=1` is equivalent to `complevel=1`. This is the 
    # lowest compression level (default is 4, 9 is highest)
    saver.write(cube, zlib=True, shuffle=True, complevel=1, unlimited_dimensions=['time'], local_keys=['comment', 'dimensions', 'cell_measures', 'frequency', 'modeling_realm', 'type', 'positive', 'valid_min', 'valid_max'])

    print('File saved to %s' % opath+'/'+ofile)

def convert_units(cube):
    if ((cube.attributes['in_units'] == str(cube.units)) or 
        (cube.attributes['conversion_factor'] == 1)):
        # do nothing, input units are the same as required
        return cube

    cube.data=( cube.data / np.float64(cube.attributes['conversion_factor']) )
    return cube
    

plist=[]
for i in suiteid:
    plist.append(ppdir+'/'+i+'/'+ppstream+'/'+ppfiles)

# test reading-in
field=iris.load_cube(plist,iris.AttributeConstraint(STASH=STASHcode),callback=CCMI2022_callback)

start_time=str(field.coord('time').units.num2date(field.coord('time').bounds[0,0])).split(' ')[0].replace('-','')
end_time=str(field.coord('time').units.num2date(field.coord('time').bounds[-1,-1])).split(' ')[0].replace('-','')

iris_version=str(iris.__version__)

ga=global_attrs.global_attrs(suiteid,str(field.var_name),iris_version,member=ens_member)

field=convert_units(field)

# save variable to NetCDF in correct directory
save_field(field, ga, start_time, end_time)

