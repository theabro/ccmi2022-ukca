#!/bin/bash

# submit all the current fields to the lotus queues

sbatch /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_toz_r1.sh 
sbatch /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_toz_r2.sh 
sbatch /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_toz_r3.sh 
sbatch /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_ts_r1.sh 
sbatch /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_ts_r2.sh 
sbatch /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_ts_r3.sh 
sbatch /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_clt_r1.sh 
sbatch /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_clt_r2.sh 
sbatch /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_clt_r3.sh 
sbatch /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_hfls_r1.sh 
sbatch /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_hfls_r2.sh 
sbatch /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_hfls_r3.sh 
sbatch /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_hfss_r1.sh 
sbatch /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_hfss_r2.sh 
sbatch /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_hfss_r3.sh 
sbatch /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_pr_r1.sh 
sbatch /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_pr_r2.sh 
sbatch /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_pr_r3.sh 
sbatch /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_ps_r1.sh 
sbatch /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_ps_r2.sh 
sbatch /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_ps_r3.sh 
sbatch /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_ptp_r1.sh 
sbatch /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_ptp_r2.sh 
sbatch /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_ptp_r3.sh 
sbatch /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_rlut_r1.sh 
sbatch /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_rlut_r2.sh 
sbatch /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_rlut_r3.sh 
sbatch /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_rsut_r1.sh 
sbatch /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_rsut_r2.sh 
sbatch /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_rsut_r3.sh 
sbatch /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_siconca_r1.sh 
sbatch /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_siconca_r2.sh 
sbatch /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_siconca_r3.sh 
sbatch /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_tatp_r1.sh 
sbatch /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_tatp_r2.sh 
sbatch /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_tatp_r3.sh 
sbatch /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_ztp_r1.sh 
sbatch /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_ztp_r2.sh 
sbatch /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_ztp_r3.sh 
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_ch4_r1.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_ch4_r2.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_ch4_r3.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_co_r1.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_co_r2.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_co_r3.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_h2o_r1.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_h2o_r2.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_h2o_r3.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_hcl_r1.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_hcl_r2.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_hcl_r3.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_meanage_r1.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_meanage_r2.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_meanage_r3.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_n2o_r1.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_n2o_r2.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_n2o_r3.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_no2_r1.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_no2_r2.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_no2_r3.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_no_r1.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_no_r2.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_no_r3.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_o3_r1.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_o3_r2.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_o3_r3.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_oh_r1.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_oh_r2.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_oh_r3.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_ta_r1.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_ta_r2.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_ta_r3.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_ua_r1.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_ua_r2.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_ua_r3.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_va_r1.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_va_r2.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_va_r3.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_o3strat_r1.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_o3strat_r2.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_o3strat_r3.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_o3stratloss_r1.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_o3stratloss_r2.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_o3stratloss_r3.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_o3stratdep_r1.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_o3stratdep_r2.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_o3stratdep_r3.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_wa_r1.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_wa_r2.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_wa_r3.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_zg_r1.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_zg_r2.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_zg_r3.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_cl_r1.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_cl_r2.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_cl_r3.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_clc_r1.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_clc_r2.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_clc_r3.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_tntrs_r1.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_tntrs_r2.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i /home/users/nlabraham/git/ccmi2022-ukca/lotus/Amon/submit_tntrs_r3.sh ; done
