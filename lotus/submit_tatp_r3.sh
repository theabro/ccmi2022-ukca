#!/bin/bash 
#SBATCH --partition=short-serial
#SBATCH -o %j.out 
#SBATCH -e %j.err
#SBATCH --time=01:00:00

# run python
module load jaspy/3.7
python /home/users/nlabraham/git/ccmi2022-ukca/src/convert_pp2nc.py -f tatp.json -r refD1_r3i1p1f2_apn2.json