#!/bin/bash 

# run python
module load jaspy/3.7
python /home/users/nlabraham/git/ccmi2022-ukca/src/convert_pp2nc.py -f h2o_z.json -r refD1_r2i1p1f2_apo.json -s AmonZ
