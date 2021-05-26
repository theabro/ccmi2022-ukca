#!/bin/bash 
#SBATCH --partition=long-serial
#SBATCH -o %j.out 
#SBATCH -e %j.err
#SBATCH --time=72:00:00

# run python
module load jaspy/3.7
python /home/users/nlabraham/git/ccmi2022-ukca/src/convert_pp2nc.py -f ta.json -r refD1_r1i1p1f2_apn.json
