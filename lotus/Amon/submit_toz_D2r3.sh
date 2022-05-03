#!/bin/bash 
#SBATCH --partition=short-serial
#SBATCH -o %j.out 
#SBATCH -e %j.err
#SBATCH --time=03:00:00

# run python
module load jaspy/3.7/r20181219
python /home/users/nlabraham/git/ccmi2022-ukca/src/convert_pp2nc.py -f toz.json -r refD2_r3i1p1f2_apn.json
