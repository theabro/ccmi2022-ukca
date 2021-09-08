#!/bin/bash

# submit all the current fields to the lotus queues

sbatch ~/git/ccmi2022-ukca/lotus/submit_toz_r1.sh 
sbatch ~/git/ccmi2022-ukca/lotus/submit_toz_r2.sh 
sbatch ~/git/ccmi2022-ukca/lotus/submit_toz_r3.sh 
sbatch ~/git/ccmi2022-ukca/lotus/submit_ts_r1.sh 
sbatch ~/git/ccmi2022-ukca/lotus/submit_ts_r2.sh 
sbatch ~/git/ccmi2022-ukca/lotus/submit_ts_r3.sh 
sbatch ~/git/ccmi2022-ukca/lotus/submit_clt_r1.sh 
sbatch ~/git/ccmi2022-ukca/lotus/submit_clt_r2.sh 
sbatch ~/git/ccmi2022-ukca/lotus/submit_clt_r3.sh 
sbatch ~/git/ccmi2022-ukca/lotus/submit_hfls_r1.sh 
sbatch ~/git/ccmi2022-ukca/lotus/submit_hfls_r2.sh 
sbatch ~/git/ccmi2022-ukca/lotus/submit_hfls_r3.sh 
sbatch ~/git/ccmi2022-ukca/lotus/submit_hfss_r1.sh 
sbatch ~/git/ccmi2022-ukca/lotus/submit_hfss_r2.sh 
sbatch ~/git/ccmi2022-ukca/lotus/submit_hfss_r3.sh 
sbatch ~/git/ccmi2022-ukca/lotus/submit_pr_r1.sh 
sbatch ~/git/ccmi2022-ukca/lotus/submit_pr_r2.sh 
sbatch ~/git/ccmi2022-ukca/lotus/submit_pr_r3.sh 
sbatch ~/git/ccmi2022-ukca/lotus/submit_ps_r1.sh 
sbatch ~/git/ccmi2022-ukca/lotus/submit_ps_r2.sh 
sbatch ~/git/ccmi2022-ukca/lotus/submit_ps_r3.sh 
sbatch ~/git/ccmi2022-ukca/lotus/submit_ptp_r1.sh 
sbatch ~/git/ccmi2022-ukca/lotus/submit_ptp_r2.sh 
sbatch ~/git/ccmi2022-ukca/lotus/submit_ptp_r3.sh 
sbatch ~/git/ccmi2022-ukca/lotus/submit_rlut_r1.sh 
sbatch ~/git/ccmi2022-ukca/lotus/submit_rlut_r2.sh 
sbatch ~/git/ccmi2022-ukca/lotus/submit_rlut_r3.sh 
sbatch ~/git/ccmi2022-ukca/lotus/submit_rsut_r1.sh 
sbatch ~/git/ccmi2022-ukca/lotus/submit_rsut_r2.sh 
sbatch ~/git/ccmi2022-ukca/lotus/submit_rsut_r3.sh 
sbatch ~/git/ccmi2022-ukca/lotus/submit_siconca_r1.sh 
sbatch ~/git/ccmi2022-ukca/lotus/submit_siconca_r2.sh 
sbatch ~/git/ccmi2022-ukca/lotus/submit_siconca_r3.sh 
sbatch ~/git/ccmi2022-ukca/lotus/submit_tatp_r1.sh 
sbatch ~/git/ccmi2022-ukca/lotus/submit_tatp_r2.sh 
sbatch ~/git/ccmi2022-ukca/lotus/submit_tatp_r3.sh 
sbatch ~/git/ccmi2022-ukca/lotus/submit_ztp_r1.sh 
sbatch ~/git/ccmi2022-ukca/lotus/submit_ztp_r2.sh 
sbatch ~/git/ccmi2022-ukca/lotus/submit_ztp_r3.sh 
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i ~/git/ccmi2022-ukca/lotus/submit_ch4_r1.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i ~/git/ccmi2022-ukca/lotus/submit_ch4_r2.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i ~/git/ccmi2022-ukca/lotus/submit_ch4_r3.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i ~/git/ccmi2022-ukca/lotus/submit_co_r1.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i ~/git/ccmi2022-ukca/lotus/submit_co_r2.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i ~/git/ccmi2022-ukca/lotus/submit_co_r3.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i ~/git/ccmi2022-ukca/lotus/submit_h2o_r1.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i ~/git/ccmi2022-ukca/lotus/submit_h2o_r2.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i ~/git/ccmi2022-ukca/lotus/submit_h2o_r3.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i ~/git/ccmi2022-ukca/lotus/submit_hcl_r1.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i ~/git/ccmi2022-ukca/lotus/submit_hcl_r2.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i ~/git/ccmi2022-ukca/lotus/submit_hcl_r3.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i ~/git/ccmi2022-ukca/lotus/submit_meanage_r1.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i ~/git/ccmi2022-ukca/lotus/submit_meanage_r2.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i ~/git/ccmi2022-ukca/lotus/submit_meanage_r3.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i ~/git/ccmi2022-ukca/lotus/submit_n2o_r1.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i ~/git/ccmi2022-ukca/lotus/submit_n2o_r2.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i ~/git/ccmi2022-ukca/lotus/submit_n2o_r3.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i ~/git/ccmi2022-ukca/lotus/submit_no2_r1.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i ~/git/ccmi2022-ukca/lotus/submit_no2_r2.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i ~/git/ccmi2022-ukca/lotus/submit_no2_r3.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i ~/git/ccmi2022-ukca/lotus/submit_no_r1.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i ~/git/ccmi2022-ukca/lotus/submit_no_r2.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i ~/git/ccmi2022-ukca/lotus/submit_no_r3.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i ~/git/ccmi2022-ukca/lotus/submit_o3_r1.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i ~/git/ccmi2022-ukca/lotus/submit_o3_r2.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i ~/git/ccmi2022-ukca/lotus/submit_o3_r3.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i ~/git/ccmi2022-ukca/lotus/submit_oh_r1.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i ~/git/ccmi2022-ukca/lotus/submit_oh_r2.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i ~/git/ccmi2022-ukca/lotus/submit_oh_r3.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i ~/git/ccmi2022-ukca/lotus/submit_ta_r1.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i ~/git/ccmi2022-ukca/lotus/submit_ta_r2.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i ~/git/ccmi2022-ukca/lotus/submit_ta_r3.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i ~/git/ccmi2022-ukca/lotus/submit_ua_r1.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i ~/git/ccmi2022-ukca/lotus/submit_ua_r2.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i ~/git/ccmi2022-ukca/lotus/submit_ua_r3.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i ~/git/ccmi2022-ukca/lotus/submit_va_r1.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i ~/git/ccmi2022-ukca/lotus/submit_va_r2.sh ; done
for i in `seq 1960 10 2010`; do echo $i; sbatch --export=ALL,DECADE=$i ~/git/ccmi2022-ukca/lotus/submit_va_r3.sh ; done
