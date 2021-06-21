#!/bin/bash 
#SBATCH --partition=short-serial
#SBATCH -o %j.out 
#SBATCH -e %j.err
#SBATCH --time=1:30:00

# run python
module load jaspy/3.7
python /home/users/nlabraham/git/ccmi2022-ukca/src/convert_pp2nc.py -f meanage.json -r refD1_r2i1p1f2_apn2.json -d ${DECADE}
