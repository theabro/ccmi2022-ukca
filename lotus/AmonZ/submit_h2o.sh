#!/bin/bash

# submit all the current fields to the lotus queues
# ls -1 *_z.json | awk -F\_ '{print $1}' | awk '{printf("%s "), $1}END{printf("\n")}'

t=AmonZ

# h2o needs to be done by decade and is from apn5.pp
d=o
for v in `echo "h2o"`; do
    for e in `seq 1 3`; do
	echo ${v} ${e} ${d} ${t}
	ostr=${v}_r${e}_${t}
	sbatch --job-name=${ostr} --export=ALL,VAR=${v},ENS=${e},DIR=${d},TAB=${t} --output=${ostr}.out --error=${ostr}.err /home/users/nlabraham/git/ccmi2022-ukca/lotus/AmonZ/submit_vedt.sh
    done
done
