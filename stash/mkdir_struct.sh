#!/bin/bash

# cope with suite-id in either u-ab123 OR ab123 formats
sid=u-`echo $1 | awk -F\- '{print $NF}'`

# make all current required directories for processing
# - see README for details of what STASH select file to use 
mkdir -p $sid/apn.pp
mkdir -p $sid/apn2.pp
mkdir -p $sid/apn3.pp
mkdir -p $sid/apn4.pp
mkdir -p $sid/apn5.pp
mkdir -p $sid/apo.pp
mkdir -p $sid/apr.pp
mkdir -p $sid/ap4.pp
