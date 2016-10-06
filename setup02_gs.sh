#!/bin/bash
source  /cvmfs/cms.cern.ch/cmsset_default.sh
export SCRAM_ARCH=slc6_amd64_gcc481
if [ -r CMSSW_7_1_18/src ] ; then 
 echo release CMSSW_7_1_18 already exists
else
scram p CMSSW CMSSW_7_1_18
fi
cd CMSSW_7_1_18/src
eval `scram runtime -sh`
curl  -s https://raw.githubusercontent.com/cms-sw/genproductions/2f28097e385e7a217a839f59e180fa9b38d89e15/python/ThirteenTeV/Higgs/Hadronizer_TuneCUETP8M1_13TeV_powhegEmissionVeto_3p_ttHToNonbb_M125_LHE_pythia8_cff.py --retry 2 --create-dirs -o  Configuration/GenProduction/python/ThirteenTeV/Higgs/Hadronizer_TuneCUETP8M1_13TeV_powhegEmissionVeto_3p_ttHToNonbb_M125_LHE_pythia8_cff.py 
[ -s Configuration/GenProduction/python/ThirteenTeV/Higgs/Hadronizer_TuneCUETP8M1_13TeV_powhegEmissionVeto_3p_ttHToNonbb_M125_LHE_pythia8_cff.py ] || exit $?;

scram b
cd ../../
cmsDriver.py Configuration/GenProduction/python/ThirteenTeV/Higgs/Hadronizer_TuneCUETP8M1_13TeV_powhegEmissionVeto_3p_ttHToNonbb_M125_LHE_pythia8_cff.py --filein file:HIG-RunIIWinter15wmLHE-00195ND.root --fileout file:HIG-RunIISummer15GS-00176ND.root --mc --eventcontent RAWSIM --customise SLHCUpgradeSimulations/Configuration/postLS1Customs.customisePostLS1,Configuration/DataProcessing/Utils.addMonitoring --customise_commands "process.generator.PythiaParameters.processParameters.append('SpaceShower:alphaSvalue=  0.1273')" --datatier GEN-SIM --conditions MCRUN2_71_V1::All --beamspot Realistic50ns13TeVCollision --step GEN,SIM --magField 38T_PostLS1 --python_filename HIG-RunIISummer15GS-00176_1_cfg.py --no_exec -n 20 || exit $? ; 

