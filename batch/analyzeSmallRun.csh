#!/bin/csh -f

#set environment for the code
#in particular source the binary to execute on the farm
setenv PATH /u/home/bclary/eg1analysis/SKIMprotocol/analysiscode_v2.2/analysiscode_v2.1:$PATH  
setenv JLAB_VERSION 2.0
setenv JLAB_ROOT /site/12gev_phys
source $JLAB_ROOT/$JLAB_VERSION/ce/jlab.csh

set input_directory = '/lustre/expphy/work/hallb/claseg1dvcs/pass1/v3/root/'
set mcinput_directory = '/lustre/expphy/volatile/halla/sbs/bclary/eg1analysis/mc_eg1dvcs/'
set output_directory  = '/lustre/expphy/volatile/halla/sbs/bclary/eg1analysis/eg1dvcs_output/pid_output/'
set file_prefix = 'root22_'
set file_extension = '*.root'
set runNumber = $1
set analysisTask = $2                                     

set mcprefix = 'dvcs_22'

set files_to_search = "$input_directory$file_prefix$runNumber$file_extension"

set pid_output_directory = '/lustre/expphy/volatile/halla/sbs/bclary/eg1analysis/eg1dvcs_output/pid_output/smallrun/'
set dvcs_output_directory = '/lustre/expphy/volatile/halla/sbs/bclary/eg1analysis/eg1dvcs_output/dvcs_output/'
set mc_output_directory = '/lustre/expphy/volatile/halla/sbs/bclary/eg1analysis/eg1dvcs_output/mcpid_output/'
set pid_prefix = 'PIDroot22_'
set dvcs_files_to_search = "$pid_output_directory$pid_prefix$runNumber$file_extension"
set h_pidoutput = '/lustre/expphy/volatile/halla/sbs/bclary/eg1analysis/eg1dvcs_output/h_pid_output/'
set mc_files_to_search = "$mcinput_directory$mcprefix$file_extension"
#executable program that will create PIDroot22 files 

#echo "$dvcs_files_to_search"
#echo "$mcinput_directory"
# change $files_to_search with mc in front for MC events
foreach file ($files_to_search)
    #if (! -e $file:t)
    #then
    #echo "File $file does not exist"
    #continue
    #endif
    #hadd -T -a h_testme.root 
   stage1PID $input_directory $file:t $analysisTask
#    stage1PID $mcinput_directory $file:t $analysisTask
   # echo "$mcinput_directory $file:t $analysisTask"
    #set outputfile = "*.root"
    #if ( -e $outputfile )
 #   then
    mv PID*.root $pid_output_directory
 #   else
  #  continue
   # endif
    #mv h_*.root $dvcs_output_directory
   # mv h_*.root $h_pidoutput
   #mv mc*.root $mc_output_directory
end

#hadd "h_$runNumber$file_extension" "PIDroot22_$runNumber"*.root 


