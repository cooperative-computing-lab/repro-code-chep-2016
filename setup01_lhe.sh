#!/bin/bash
source  /cvmfs/cms.cern.ch/cmsset_default.sh
export SCRAM_ARCH=slc6_amd64_gcc481
if [ -r CMSSW_7_1_16_patch1/src ] ; then 
 echo release CMSSW_7_1_16_patch1 already exists
else
scram p CMSSW CMSSW_7_1_16_patch1
fi
cd CMSSW_7_1_16_patch1/src
eval `scram runtime -sh`

curl -s --insecure https://cms-pdmv.cern.ch/mcm/public/restapi/requests/get_fragment/HIG-RunIIWinter15wmLHE-00195 --retry 2 --create-dirs -o Configuration/GenProduction/python/HIG-RunIIWinter15wmLHE-00195-fragment.py 
[ -s Configuration/GenProduction/python/HIG-RunIIWinter15wmLHE-00195-fragment.py ] || exit $?;

scram b
cd ../../
cmsDriver.py Configuration/GenProduction/python/HIG-RunIIWinter15wmLHE-00195-fragment.py --fileout file:HIG-RunIIWinter15wmLHE-00195ND.root --mc --eventcontent LHE --datatier LHE --conditions MCRUN2_71_V1::All --step LHE --python_filename HIG-RunIIWinter15wmLHE-00195_1_cfg.py --no_exec --customise Configuration/DataProcessing/Utils.addMonitoring -n 1649 || exit $? ; 

