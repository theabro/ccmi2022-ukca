#!/bin/bash

# submit all the current fields to the lotus queues

# table
t=AdayZ
x=refD2
# AdayZ fields in the UPR usage stream
u=r

# do zonal mean fields
for v in `echo "ta_z zg_z"`; do
    for e in `seq 1 3`; do
	for i in `seq 1960 10 2010`; do 
		echo ${v} ${e} ${u} ${t} ${x}	
		sbatch --job-name=${v}_r${e}_${u}_${t}_${x}_${i} --export=ALL,VAR=${v},EXPT=${x},ENS=${e},DIR=${u},TAB=${t},DECADE=${i} --output=${t}_${v}_r${e}_${u}_${x}_${i}.out --error=${t}_${v}_r${e}_${u}_${x}_${i}.err /home/users/nlabraham/git/ccmi2022-ukca/lotus/submit_vedt_d_expt.sh
	done
    done
done

