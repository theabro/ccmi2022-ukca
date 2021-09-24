#!/bin/bash

# submit all the current fields to the lotus queues
# ls -1 *_z.json | awk -F\_ '{print $1}' | awk '{printf("%s "), $1}END{printf("\n")}'

t=AmonZ

# h2o needs to be done by decade and is from apn5.pp
d=n5
for v in `echo "h2o"`; do
    for e in `seq 1 3`; do
	for i in `seq 1960 10 2010`; do 
	    echo ${v} ${e} ${d} ${t} ${i}
	    sbatch --job-name=${v}_r${e}_${t}_${i} --export=ALL,VAR=${v},ENS=${e},DIR=${d},TAB=${t},DECADE=${i} --output=${t}_${v}_r${e}_${i}.out --error=${t}_${v}_r${e}_${i}.err /home/users/nlabraham/git/ccmi2022-ukca/lotus/AmonZ/submit_vedt_d.sh
	done
    done
done
