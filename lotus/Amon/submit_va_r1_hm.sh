#!/bin/bash 
#SBATCH --partition=high-mem
#SBATCH -o %j.out 
#SBATCH -e %j.err
#SBATCH --time=24:00:00
#SBATCH --mem=24000

# run python
module load jaspy/3.7
python /home/users/nlabraham/git/ccmi2022-ukca/src/convert_pp2nc.py -f va.json -r refD1_r1i1p1f2_apn4.json -d ${DECADE}
