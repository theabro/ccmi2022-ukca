#!/bin/bash 
#SBATCH --partition=short-serial
#SBATCH --time=12:00:00

# run python
module load jaspy/3.7
python /home/users/nlabraham/git/ccmi2022-ukca/src/convert_pp2nc.py -f ${VAR}_z.json -r refD1_r${ENS}i1p1f2_apo.json -s AmonZ
