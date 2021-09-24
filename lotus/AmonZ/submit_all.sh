#!/bin/bash

# submit all the current fields to the lotus queues
# ls -1 *_z.json | awk -F\_ '{print $1}' | awk '{printf("%s "), $1}END{printf("\n")}'

t=AmonZ

# note hono2 is in the ap4 files so do separately
d=o
for v in `echo "brcl brono2 bro br cf2cl2 cfcl3 ch4 cl2o2 clono2 clo cl cos co epfy epfz h2o2 h2 hbr hcho hcl ho2no2 ho2 hobr hocl meanage mebr meooh n2o5 n2o no2 noy no n o3strat o3 oclo oh sadsulf so2 ta ua utendepfd va vtem wtem zg"`; do
    for e in `seq 1 3`; do
	echo ${v} ${e} ${d} ${t}
	sbatch --job-name=${v}_r${e}_${t} --export=ALL,VAR=${v},ENS=${e},DIR=${d},TAB=${t} --output=${t}_${v}_r${e}.out --error=${t}_${v}_r${e}.err /home/users/nlabraham/git/ccmi2022-ukca/lotus/AmonZ/submit_vedt.sh
    done
done


# hono2 (hno3) needs to be using the ap4 location
d=4
for v in `echo "hono2"`; do
    for e in `seq 1 3`; do
	echo ${v} ${e} ${d} ${t}
	sbatch --job-name=${v}_r${e}_${t} --export=ALL,VAR=${v},ENS=${e},DIR=${d},TAB=${t} --output=${t}_${v}_r${e}.out --error=${t}_${v}_r${e}.err /home/users/nlabraham/git/ccmi2022-ukca/lotus/AmonZ/submit_vedt.sh
    done
done


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
