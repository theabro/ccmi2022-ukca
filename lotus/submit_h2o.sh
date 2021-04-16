#!/bin/bash 
#SBATCH --partition=high-mem
#SBATCH -o %j.out 
#SBATCH -e %j.err
#SBATCH --time=48:00:00

# run python
module load jaspy/3.7/r20200606
python /home/users/nlabraham/git/ccmi2022-ukca/src/convert_pp2nc.py -f h2o.json -r refD1_r1i1p1f2_apn.json
