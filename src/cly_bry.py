#!/usr/bin/env python

import iris
import json

ens='1'

var='cly'

indir='/gws/nopw/j04/ukca_vol2/ccmi-2022/v20210920'
comment='cly='


species=[]
if var == 'cly':
    # Cly: do cl2o2 twice as contains 2x Cl
    species=['cl','clo','cl2o2','cl2o2','oclo','brcl','hocl','clono2','hcl']
else if var == 'bry':
    # Bry: 
    species=['br','brcl','brono2','hbr','hobr','bro']


# construct input filename
def construct_filename(spec):
    sfile=indir+'/'+spec+'_AmonZ_UKESM1-StratTrop_refD1_r'+ens+'i1p1f2_grz_19600101-20190101.nc'


# read-in initial cube
print(species[0])
cube=iris.load_cube(construct_filename(species[0]))

for spec in species[1:]:
    print(spec)
    tcube=iris.load_cube(construct_filename(spec))
    cube.data=cube.data + tcube.data
    comment=comment+'+'+spec

