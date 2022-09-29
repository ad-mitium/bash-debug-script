#/bin/bash

#echo "Executing..."

#####  Basic parameters  #####
base_dir=~/Documents/Code/bash-debug-script
data_dir=data
start_window=920
stop_window=1630
output_file=bash-debug-script.out
error_file=bash-debug-script.err


#####  EXECUTING SCRIPT  #####
if [ $(date +%k%M) -ge $stop_window ] # Note: executing multiple times after stop_window will continue to write to file
then
  echo 'Testing was completed at' $(date +%a) $(date +%D) $(date +%I:%M:%S) $(date +%p) >> $base_dir/$data_dir/$output_file
  echo 'Testing was completed at'$(date) >> $base_dir/$data_dir/$error_file
elif [ $(date +%k%M) -lt $start_window ] # Don't execute before this time 
  then
    exit 100
  else
  case $(date +%M) in # at certain times, write time to file for debugging
    00)
        echo $(date +%I:%M:%S) $(date +%p) >> $base_dir/$data_dir/$error_file;;
    15)
        echo $(date +%I:%M:%S) $(date +%p) >> $base_dir/$data_dir/$error_file;;
    20)
        echo $(date +%I:%M:%S) $(date +%p) >> $base_dir/$data_dir/$error_file;;
    30)
        echo $(date +%I:%M:%S) $(date +%p) >> $base_dir/$data_dir/$error_file;;
    40)
        echo $(date +%I:%M:%S) $(date +%p) >> $base_dir/$data_dir/$error_file;;
    45)
        echo $(date +%I:%M:%S) $(date +%p) >> $base_dir/$data_dir/$error_file;;
    *)
        ;;
  esac

#####  APPLICATION TO RUN  #####

#    <SOME APPLICATION TO DEBUG> 1>>$base_dir/$data_dir/$output_file 2>>$base_dir/$data_dir/$error_file

# Example:
    date 1>>$base_dir/$data_dir/$output_file 2>>$base_dir/$data_dir/$error_file

fi
