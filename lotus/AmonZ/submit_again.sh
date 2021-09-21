#!/bin/bash

# submit all the current fields to the lotus queues
# ls -1 *_z.json | awk -F\_ '{print $1}' | awk '{printf("%s "), $1}END{printf("\n")}'

# redo as originally done incorrectly
for v in `echo "cf2cl2 cfcl3 ch4 cl2o2 so2"`; do
    for e in `seq 1 3`; do
	echo ${v} ${e}
	sbatch --job-name=${v}_r${e} --export=ALL,VAR=${v},ENS=${e} --output=AmonZ_${v}_r${e}.out --error=AmonZ_${v}_r${e}.err /home/users/nlabraham/git/ccmi2022-ukca/lotus/AmonZ/submit_var_ens.sh
    done
done
