#!/bin/csh -f

#set environment for the code
#in particular source the binary to execute on the farm
setenv PATH /u/home/bclary/eg1analysis/SKIMprotocol/analysiscode_v2.2/analysiscode_v2.1:$PATH  
setenv JLAB_VERSION 2.0
setenv JLAB_ROOT /site/12gev_phys
source $JLAB_ROOT/$JLAB_VERSION/ce/jlab.csh
set PID = 'PID'
set DVCS = 'DVCS'
set MC = 'MC'

set runNumber = $1
set analysisTask = $2                                     
#echo $analysisTask

set pid_output_directory = '/lustre/expphy/volatile/halla/sbs/bclary/eg1analysis/eg1dvcs_output/pid_output/testrun/'
set dvcs_input_directory = '/lustre/expphy/volatile/halla/sbs/bclary/eg1analysis/eg1dvcs_output/h_pid_output/tempPID/'
set file_extension = '*.root'

if ($analysisTask =~ *PID) then
echo "--PID Analysis--"
echo "Setting path variables."
set file_prefix = 'root22_'
set input_directory = '/lustre/expphy/work/hallb/claseg1dvcs/pass1/v3/root/'
set output_directory  = '/lustre/expphy/volatile/halla/sbs/bclary/eg1analysis/eg1dvcs_output/pid_output/'

else if($analysisTask =~ *DVCS) then
set dvcs_file_prefix = 'PIDroot22_'
set dvcs_files_to_search = "$dvcs_input_directory$dvcs_file_prefix$runNumber$file_extension"
set dvcs_output_directory = '/lustre/expphy/volatile/halla/sbs/bclary/eg1analysis/eg1dvcs_output/dvcs_output/'

else if($analysisTask =~ *MC) then
set mcprefix = 'dvcs_22'
set mcinput_directory = '/lustre/expphy/volatile/halla/sbs/bclary/eg1analysis/mc_eg1dvcs/'
set mc_output_directory = '/lustre/expphy/volatile/halla/sbs/bclary/eg1analysis/eg1dvcs_output/mcpid_output/'
set mc_files_to_search = "$mcinput_directory$mcprefix$file_extension"
endif
#set dvcs_files_to_search = "$dvcs_input_directory$dvcs_file_prefix$runNumber$file_extension"
set files_to_search = "$input_directory$file_prefix$runNumber$file_extension"

set h_pidoutput = '/lustre/expphy/volatile/halla/sbs/bclary/eg1analysis/eg1dvcs_output/h_pid_output/'


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
#changed input_directory to pid_output_directory
    #echo $dvcs_input_directory $file:t
    stage1PID $input_directory $file:t $analysisTask
#    stage1PID $mcinput_directory $file:t $analysisTask
   # echo "$mcinput_directory $file:t $analysisTask"
    #set outputfile = "*.root"
    #if ( -e $outputfile )
 #   then
    # mv PID*.root $dvcs_output_directory
 #   else
  #  continue
   # endif
    mv PID*.root $pid_output_directory
   # mv h_*.root $h_pidoutput
   #mv mc*.root $mc_output_directory
end

#hadd "h_$runNumber$file_extension" "PIDroot22_$runNumber"*.root 


