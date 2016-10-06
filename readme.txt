The scripts in this folder create folders with the CMSSW software and create a conf file to run for each step,
but the conf file must be invoked in order to generate results at each step before moving on to the next step. 

Be sure to set up the HTTP_PROXY environment variable,
and if CVMFS is not already mounted on the execution machine,
install parrot_run and use to following command to map CVMFS:
parrot_run -M /cvmfs/cms.cern.ch/SITECONF/local=/cvmfs/cms.cern.ch/SITECONF/T3_US_NotreDame wrapper.sh

An example wrapper script for the first step is:
#!/bin/bash

export CMS_VERSION=CMSSW_7_1_16_patch1
export SCRAM_ARCH=slc6_amd64_gcc481

rm -rf cmsjob
mkdir cmsjob
cd cmsjob

. /cvmfs/cms.cern.ch/cmsset_default.sh
scramv1 project CMSSW ${CMS_VERSION}
cd ${CMS_VERSION}
eval `scram runtime -sh`
cd ../../

cmsRun HIG-RunIIWinter15wmLHE-00195_1_cfg.py > cms.log 2>&1


Executing this script will generate the intermediate file needed by step2.
