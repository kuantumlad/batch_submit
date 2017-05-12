#!bin/csh -f

setenv PATH /u/home/bclary/eg1analysis/SKIMprotocol/analysiscode_v2.2/analysiscode_v2.1:$PATH  
setenv JLAB_VERSION 2.0
setenv JLAB_ROOT /site/12gev_phys
source $JLAB_ROOT/$JLAB_VERSION/ce/jlab.csh

set runNumber = $1
set analysisTask = $2

##
##
## THIS IS FOR DVCS 
##
##

set dvcs_file_prefix = 'PIDroot22_'
set dvcs_files_to_search = "$dvcs_input_directory$dvcs_file_prefix$runNumber$file_extension"
set dvcs_output_directory = '/lustre/expphy/volatile/halla/sbs/bclary/eg1analysis/eg1dvcs_output/dvcs_output/'

foreach f ($dvcs_files_to_search)

    stage1PID $dvcs_input_directory $file:t $analysisTask
    mv h_*.root $dvcs_output_directory

end


