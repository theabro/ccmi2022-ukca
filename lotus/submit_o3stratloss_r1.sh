#!/bin/bash 
#SBATCH --partition=high-mem
#SBATCH -o %j.out 
#SBATCH -e %j.err
#SBATCH --time=1:00:00
#SBATCH --mem=24000

# run python
module load jaspy/3.7
python /home/users/nlabraham/git/ccmi2022-ukca/src/convert_pp2nc.py -f o3stratloss.json -r refD1_r1i1p1f2_apn3.json -d ${DECADE}
