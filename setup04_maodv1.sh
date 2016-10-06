#!/bin/bash
source  /cvmfs/cms.cern.ch/cmsset_default.sh
export SCRAM_ARCH=slc6_amd64_gcc530
if [ -r CMSSW_8_0_3_patch1/src ] ; then 
 echo release CMSSW_8_0_3_patch1 already exists
else
scram p CMSSW CMSSW_8_0_3_patch1
fi
cd CMSSW_8_0_3_patch1/src
eval `scram runtime -sh`



scram b
cd ../../
cmsDriver.py step1 --filein file:HIG-RunIISpring16DR80-00000ND.root --fileout file:HIG-RunIISpring16MiniAODv1-00000ND.root --mc --eventcontent MINIAODSIM --runUnscheduled --datatier MINIAODSIM --conditions 80X_mcRun2_asymptotic_2016_v3 --step PAT --era Run2_25ns --python_filename HIG-RunIISpring16MiniAODv1-00000_1_cfg.py --no_exec --customise Configuration/DataProcessing/Utils.addMonitoring -n 1920 || exit $? ; 

