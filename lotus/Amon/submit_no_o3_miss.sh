#!/bin/bash

# submit ta, ua, va, & wa to the lotus queues. The script uses high-mem for 48hrs.

t=Amon

# wa is from apn.pp
d=n
for v in `echo "ta"`; do
    for e in `seq 1 3`; do
	for i in `seq 1960 10 2010`; do 
	    echo ${v} ${e} ${d} ${t} ${i}
	    ostr=${v}_r${e}_${t}_${i}
	    sbatch --job-name=${ostr} --export=ALL,VAR=${v},ENS=${e},DIR=${d},TAB=${t},DECADE=${i} --output=${ostr}.out --error=${ostr}.err /home/users/nlabraham/git/ccmi2022-ukca/lotus/submit_vedt_d.sh
	done
    done
done

# ua, va, & wa are from apn4.pp
d=n4
for v in `echo "ua va wa"`; do
    for e in `seq 1 3`; do
	for i in `seq 1960 10 2010`; do 
	    echo ${v} ${e} ${d} ${t} ${i}
	    ostr=${v}_r${e}_${t}_${i}
	    sbatch --job-name=${ostr} --export=ALL,VAR=${v},ENS=${e},DIR=${d},TAB=${t},DECADE=${i} --output=${ostr}.out --error=${ostr}.err /home/users/nlabraham/git/ccmi2022-ukca/lotus/submit_vedt_d.sh
	done
    done
done
