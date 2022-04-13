#!/bin/bash 
#SBATCH --partition=high-mem
#SBATCH --time=48:00:00
#SBATCH --mem=24000

# run python - need to use an older version of cftime & numpy until issues with these can be debugged
module load jaspy/3.7/r20181219
python /home/users/nlabraham/git/ccmi2022-ukca/src/convert_pp2nc.py -f ${VAR}.json -r refD1_r${ENS}i1p1f2_ap${DIR}.json -s ${TAB} -d ${DECADE}
