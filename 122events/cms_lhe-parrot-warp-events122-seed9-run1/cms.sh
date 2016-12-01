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

