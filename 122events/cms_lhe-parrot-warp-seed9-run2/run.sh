#!/bin/bash

export HTTP_PROXY=http://cache01.hep.wisc.edu:3128

date

parrot_run  -M /cvmfs/cms.cern.ch/SITECONF/local=/cvmfs/cms.cern.ch/SITECONF/T3_US_NotreDame --time-warp  ./cms.sh

date
