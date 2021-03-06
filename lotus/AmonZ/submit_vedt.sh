#!/bin/bash 
#SBATCH --partition=high-mem
#SBATCH --time=12:00:00
#SBATCH --mem=24000

# run python
module load jaspy/3.7
python /home/users/nlabraham/git/ccmi2022-ukca/src/convert_pp2nc.py -f ${VAR}_z.json -r refD1_r${ENS}i1p1f2_ap${DIR}.json -s ${TAB}
