#!/bin/csh -f

#Setting appropriate Environment Variables for the code to run.
#This is done by sourcing the binary to exectute on the farm.
setenv PATH /u/home/bclary/eg1analysis/SKIMprotocol/analysiscode_v2.2/analysiscode_v2.1:$PATH  
setenv JLAB_VERSION 2.0
setenv JLAB_ROOT /site/12gev_phys
source $JLAB_ROOT/$JLAB_VERSION/ce/jlab.csh
set PID = 'PID'

##
##
##  THIS IS FOR PID ANALYSIS
##
##

#Inputs for the code 
set runNumber = $1
set analysisTask = $2

set pid_output_directory = '/lustre/expphy/volatile/halla/sbs/bclary/eg1analysis/eg1dvcs_output/pid_output/testrun/'
set file_extension = '*.root'

echo "--PID Analysis--"
echo "Setting path variables."
set file_prefix = 'root22_'
set input_directory = '/lustre/expphy/work/hallb/claseg1dvcs/pass1/v3/root/'
set output_directory  = '/lustre/expphy/volatile/halla/sbs/bclary/eg1analysis/eg1dvcs_output/pid_output/'

set files_to_search = "$input_directory$file_prefix$runNumber$file_extension"

foreach file ($files_to_search)

    stage1PID $input_directory $file:t $analysisTask
    mv PID*.root $output_directory

end

