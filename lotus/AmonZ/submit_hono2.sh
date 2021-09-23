#!/bin/bash

# submit all the current fields to the lotus queues
# ls -1 *_z.json | awk -F\_ '{print $1}' | awk '{printf("%s "), $1}END{printf("\n")}'

d=4
t=AmonZ

# hono2 (hno3) needs to be using the ap4 location
for v in `echo "hono2"`; do
    for e in `seq 1 3`; do
	echo ${v} ${e} ${d} ${t}
	sbatch --job-name=${v}_r${e}_${t} --export=ALL,VAR=${v},ENS=${e},DIR=${d},TAB=${t} --output=${t}_${v}_r${e}.out --error=${t}_${v}_r${e}.err /home/users/nlabraham/git/ccmi2022-ukca/lotus/AmonZ/submit_vedt.sh
    done
done
