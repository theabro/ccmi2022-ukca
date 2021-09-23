#!/usr/bin/env python

import iris
import json
import os
import global_attrs
import numpy as np
import argparse
import datetime
import glob
import cf_units


# model name - used as a lookup
model_name='UKESM1-StratTrop'

# read-in command-line arguments, if required
def get_opts():
    parser = argparse.ArgumentParser(description='Convert UKESM1-StratTrop2 PP files to NETCDF4 for CCMI-2022')
    parser.add_argument('-o', '--odir', type=str, default='/gws/nopw/j04/ukca_vol2/nlabraham/CCMI2022/upload', help='Name of output directory')
    parser.add_argument('-s', '--stream', type=str, default='Amon', choices=['A10dayPt', 'Aday', 'AdayZ', 'Amon', 'AmonZ'], help='Output frequency stream')
    parser.add_argument('-j', '--json_dir', type=str, default='/home/users/nlabraham/git/ccmi-2022/Tables', help='Name of CCMI-2022 JSON Tables directory')
    parser.add_argument('-e', '--ens_dir', type=str, default='/home/users/nlabraham/git/ccmi2022-ukca/ens', help='Name of UKESM1-StratTrop2 JSON ensemble members directory')
    parser.add_argument('-r', '--ens_file', type=str, default='refD1_r1i1p1f2_apn.json', help='Name of UKESM1-StratTrop2 JSON ensemble member file (e.g. refD1_r1i1p1f2_apn.json)')
    parser.add_argument('-v', '--var_dir', type=str, default='/home/users/nlabraham/git/ccmi2022-ukca/vars', help='Name of UKESM1-StratTrop2 JSON variables directory')
    parser.add_argument('-f', '--var_file', type=str, default='toz.json', help='Name of UKESM1-StratTrop2 JSON variable file (e.g. toz.json)')
    parser.add_argument('-d', '--decade', type=int, default=0, help='Decade to start taking data from (e.g. 1960). Use 0 to output all times.')
    return parser.parse_args()


# develop callback for use when reading fils from pp
def CCMI2022_callback(cube, field, filename):
    # define input units to be used in conversion routine
    cube.attributes['in_units']=in_units
    cube.attributes['conversion_factor']=conversion_factor
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
    # deal with cell_methods below
    #cube.cell_methods=entries['variable_entry'][var]['cell_methods']
    # these set as attributes
    cube.attributes['cell_measures']=str(entries['variable_entry'][var]['cell_measures'])
    cube.attributes['frequency']=str(entries['variable_entry'][var]['frequency'])
    cube.attributes['modeling_realm']=str(entries['variable_entry'][var]['modeling_realm'])
    cube.attributes['comment']=str(entries['variable_entry'][var]['comment'])
    cube.attributes['dimensions']=str(entries['variable_entry'][var]['dimensions'])
    cube.attributes['type']=str(entries['variable_entry'][var]['type'])
    cube.attributes['positive']=str(entries['variable_entry'][var]['positive'])
    # valid_min/max need to be set to None if they don't have a value
    #  - for some reason these are of the format 'X.y r' etc., so split and just take the number part
    if entries['variable_entry'][var]['valid_min'] is not '':
        cube.attributes['valid_min'] = np.float64(entries['variable_entry'][var]['valid_min'].split()[0])
        cube.attributes['missing_value'] = np.float64(entries['Header']['missing_value'])
    if entries['variable_entry'][var]['valid_max'] is not '':
        cube.attributes['valid_max'] = np.float64(entries['variable_entry'][var]['valid_max'].split()[0])
        cube.attributes['missing_value'] = np.float64(entries['Header']['missing_value'])
    try:
        cube.attributes['heaviside']=str(variable['VARS']['heaviside'])
    except:
        pass
    try:
        cube.attributes['pressure_field']=str(variable['VARS']['pressure'])
    except:
        pass
    

# function to save to NetCDF
def save_field(cube, ga, odir, start_time, end_time):
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

    # set default fill value (i.e. no value as not masked) - may be altered below
    cube_fill_value=None

    # set-up saver
    saver = iris.fileformats.netcdf.Saver(filename=ofile, netcdf_format='NETCDF4_CLASSIC')
    # add global attributes as required
    saver.update_global_attributes(Conventions=iris.fileformats.netcdf.CF_CONVENTIONS_VERSION, attributes=ga.attrs)

    # actually save the field, including local attributes as required
    # not sure if `deflate=1` is equivalent to `complevel=1`. This is the 
    # lowest compression level (default is 4, 9 is highest)
    # set local keys - need to add-in valid ranges & missing data if these are required
    local_keys=['comment', 'dimensions', 'cell_measures', 'frequency', 'modeling_realm', 'type', 'positive']
    try:
        if (cube.attributes['missing_value'] is not None):
            local_keys.append('missing_value')
            # set fill value as necessary
            #  - will appear as _FillValue in NetCDF file
            cube_fill_value = cube.attributes['missing_value']
    except KeyError:
        pass
    # may NOT have valid_min/max values set
    try:
        if (cube.attributes['valid_min'] is not None):
            local_keys.append('valid_min')
    except KeyError:
        pass
    try:
        if (cube.attributes['valid_max'] is not None):
            local_keys.append('valid_max')
    except KeyError:
        pass
    # add information about heaviside function used
    try:
        if (cube.attributes['heaviside'] is not None):
            local_keys.append('heaviside')
    except KeyError:
        pass
    # add information about heaviside function used
    try:
        if (cube.attributes['pressure_field'] is not None):
            local_keys.append('pressure_field')
    except KeyError:
        pass

    # now save
    saver.write(cube, zlib=True, shuffle=True, complevel=1, unlimited_dimensions=['time'], local_keys=local_keys, fill_value=cube_fill_value)

    print('File saved to %s' % ofile)


def convert_units(cube):
    # do this first as needs to be done for all fields
    # convert time units - must be a "days since..." format
    new_time_unit = cf_units.Unit('days since 1960-01-01', calendar=cube.coord('time').units.calendar)
    cube.coord('time').convert_units(new_time_unit)
    # also do for forecast reference time
    new_time_unit = cf_units.Unit('days since 1960-01-01', calendar=cube.coord('forecast_reference_time').units.calendar)
    cube.coord('forecast_reference_time').convert_units(new_time_unit)
    # also do for forecast period
    new_time_unit = cf_units.Unit('days')
    cube.coord('forecast_period').convert_units(new_time_unit)

    # check whether field units actually need to be converted
    if ((cube.attributes['conversion_factor'] != 1)):
        # divide by conversion factor
        cube.data=( cube.data / np.float64(cube.attributes['conversion_factor']) )

    # check if we need to divide by surface area. Check if in units are already m-2
    if (('m-2' in str(cube.units)) and ('m-2' not in cube.attributes['in_units'])):
        # calculate surface area - need to have bounds
        try:
            cube.coord(axis='X').guess_bounds()
        except:
            pass
        try:
            cube.coord(axis='Y').guess_bounds()
        except:
            pass
        surf_area=iris.analysis.cartography.area_weights(cube, normalize=False)
        # divide by surface area
        cube.data=( cube.data / surf_area )

    # convert units for epfy & epfz
    if ((str(cube.var_name) == 'epfy') or (str(cube.var_name) == 'epfz')):
        if ((str(cube.units) == 'm3 s-2') and (cube.attributes['in_units'] == 'kg s-2')):
            rho0 = 1.212    # kg m-3
            p0 = 1000.0     # hPa
            press = cube.coord('pressure')
            density = rho0 * press / p0
            divcube = cube / density
            cube.data = divcube.data

    return cube
    
def mask_outside_valid_range(cube):
    # If we have a valid range, mask things outside it.
    try:
        cube.data=np.ma.masked_outside(cube.data, cube.attributes['valid_min'], cube.attributes['valid_max'])
        np.ma.set_fill_value(cube.data, cube.attributes['missing_value'])
    except KeyError:
        pass

    return cube

def create_indir(ppdir, suiteid, ppstream, ppfiles):
    # create list of files to read, might be in several directories
    plist=[]
    for i in suiteid:
        test_path=ppdir+'/'+i+'/'+ppstream+'/'+ppfiles
        # check that there are actually files in the path
        if glob.glob(test_path):
            plist.append(test_path)
            
    return plist

def convert_to_pressure(cube,pcube,plevs,punit):

    # make a new cube with 39 levels
    newcube=cube.extract(iris.Constraint(model_level_number=lambda cell: 0 < cell < 40))

    # define pressure coordinate
    pressure=iris.coords.DimCoord(plevels,standard_name=None,long_name="pressure",var_name="pressure",units=cf_units.Unit(punit),attributes={"positive":"down"})

    print(newcube)

    return cube


def main(args):
    # global variables (used in Callback)
    global in_units
    global conversion_factor
    global entries
    global var
    
    # define directories containing things
    # output directory
    odir=args.odir
    # JSON directories:
    #  Tables directory for CCMI-2022 - provided from https://github.com/cedadev/ccmi-2022
    json_dir=args.json_dir
    #  definitions of ensemble members
    ens_dir=args.ens_dir
    #  UKESM1 variables
    var_dir=args.var_dir
    
    # other variables needed for files/filenames
    stream=args.stream
    var_file=args.var_file
    ens_file=args.ens_file

    
    # read-in variable information from JSON file
    with open(var_dir+'/'+var_file) as json_file:
        variable=json.load(json_file)
    # populate variable-specific variables required
    var=str(variable['VARS']['var'])
    in_units=str(variable['VARS']['in_units'])
    conversion_factor=np.float(variable['VARS']['conversion_factor'])
    STASHcode=str(variable['VARS']['STASHcode'])
    grid_label=str(variable['VARS']['grid_label'])
    heaviside=None
    try:
        heaviside=str(variable['VARS']['heaviside'])
    except:
        pass
    plevels=None
    try:
        plevels=np.array(variable['VARS']['plevels'],dtype=np.float64)
    except:
        pass
    pressure=None
    try:
        pressure=str(variable['VARS']['pressure'])
    except:
        pass
    p_units=None
    try:
        p_units=str(variable['VARS']['p_units'])
    except:
        pass
    if (plevels is not None):
        if (pressure is None):
            print("Require a pressure field for regridding")
            raise
        if (p_units is None):
            print("Require units for pressure")
            raise
            

    # read-in ensemble member information from JSON file
    with open(ens_dir+'/'+ens_file) as json_file:
        ens=json.load(json_file)
    # populate variable-specific variables required
    ens_member=np.int_(ens['EM']['ens_member'])
    suiteid=ens['EM']['suiteid']
    ppdir=str(ens['EM']['ppdir'])
    ppstream=str(ens['EM']['ppstream'])
    # alternative directory containing e.g. heaviside function
    alt_ppstream=None
    try:
        alt_ppstream=str(ens['EM']['alt_ppstream'])
    except:
        pass
    expt_id=str(ens['EM']['expt_id'])
    source_type=str(ens['EM']['source_type'])
    
    
    # read-in JSON information
    json_file='CCMI2022_'+stream+'.json'
    with open(json_dir+'/'+json_file) as json_file:
        entries=json.load(json_file)
    
    # need this for later
    cell_methods=str(entries['variable_entry'][var]['cell_methods'])


    # read-in JSON CV information
    json_file='CCMI2022_CV.json'
    with open(json_dir+'/'+json_file) as json_file:
        CV=json.load(json_file)
    
    # define start and number of ppfiles to take
    decade=np.int(args.decade/10)
    if decade > 0:
        ppfiles='*'+str(decade)+'*.pp'
    else:
        ppfiles='*201[45]*.pp'
        

    # get listing of files to read-in
    plist=create_indir(ppdir, suiteid, ppstream, ppfiles)

    print("reading field")
    
    # read-in
    field=iris.load_cube(plist,iris.AttributeConstraint(STASH=STASHcode),callback=CCMI2022_callback)

    mask_data=False
    try:
        if (cube.attributes['missing_value'] is not None):
            mask_data=True
    except:
        pass        

    # have provided a Heaviside function, i.e. field contains masked data.
    if (heaviside is not None):

        # take from a different location if necessary
        if (alt_ppstream is not None):
            plist=create_indir(ppdir, suiteid, alt_ppstream, ppfiles)

        # read-in
        heaviside=iris.load_cube(plist,iris.AttributeConstraint(STASH=heaviside))
        # divide by Heaviside function - will create masked_array
        field.data=np.ma.masked_invalid(field.data/heaviside.data)
        # now need to set missing data attributes
        field.attributes['missing_value'] = np.float64(entries['Header']['missing_value'])
        # already masked so don't do again
        mask_data=False

    # have provided a Heaviside function, i.e. field contains masked data.
    if (pressure is not None):

        # take from a different location if necessary
        if (alt_ppstream is not None):
            plist=create_indir(ppdir, suiteid, alt_ppstream, ppfiles)

        print("reading pressure")
        # read-in
        pressure=iris.load_cube(plist,iris.AttributeConstraint(STASH=pressure))

    print("converting")
        
    field=convert_to_pressure(field,pressure,plevels,p_units)

    exit()
        
    # set positive direction for pressure levels
    try:
        field.coord('pressure').attributes['positive']='down'
    except:
        pass

    # determine start and end time of data in easy to read format
    start_time=str(field.coord('time').units.num2date(field.coord('time').bounds[0,0])).split(' ')[0].replace('-','')
    end_time=str(field.coord('time').units.num2date(field.coord('time').bounds[-1,-1])).split(' ')[0].replace('-','')
    # required for metadata
    iris_version=str(iris.__version__)
    # define global attributes for output file
    ga=global_attrs.global_attrs(suiteid, str(field.var_name), iris_version, CV, member=ens_member, table=stream, expt_id=expt_id, grid_label=grid_label, source_type=source_type, model_name=model_name)
    # convert units of data if required
    field=convert_units(field)

    # set a valid min/max & mask outside this if required
    if (mask_data):
        field=mask_outside_valid_range(field)

    # deal with cell_methods - needs to be a tuple
    if (stream == 'Amon'):
        field.cell_methods=(iris.coords.CellMethod(method='mean', coords=['area','time']),)
    else:
        cm_t=()
        for s in cell_methods.split():
            if (':' in s):
                dcoord=s.rsplit(':',1)[0]
                cm_t=cm_t+(iris.coords.CellMethod(method='mean', coords=dcoord),)
        field.cell_methods=cm_t

    # save variable to NetCDF in correct directory
    save_field(field, ga, odir, start_time, end_time)
    
# read-in arguments and process file
if __name__ == "__main__":
    args = get_opts()
    print("Started %s at %s" % (args.var_file, datetime.datetime.now()))
    main(args)
    print("Finished %s at %s" % (args.var_file, datetime.datetime.now()))
