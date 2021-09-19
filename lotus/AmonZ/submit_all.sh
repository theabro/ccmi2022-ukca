#!/bin/bash

# submit all the current fields to the lotus queues
# ls -1 *_z.json | awk -F\_ '{print $1}' | awk '{printf("%s "), $1}END{printf("\n")}'

# note hono2 is in the ap4 files so do separately
for v in `echo "brcl brono2 bro br cf2cl2 cfcl3 ch4 cl2o2 clono2 clo cl cos co epfz h2o2 h2 hbr hcho hcl ho2no2 ho2 hobr hocl meanage mebr meooh n2o5 n2o no2 noy no n o3strat o3 oclo oh sadsulf so2 ta ua utendepfd va vtem wtem zg"`; do
    for e in `seq 1 3`; do
	echo ${v} ${e}
	sbatch --job-name=${v}_r${e} --export=ALL,VAR=${v},ENS=${e} --output=AmonZ_${v}_r${e}.out --error=AmonZ_${v}_r${e}.err /home/users/nlabraham/git/ccmi2022-ukca/lotus/AmonZ/submit_var_ens.sh
    done
done
