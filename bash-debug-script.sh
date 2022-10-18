#/bin/bash

echo "Executing..."

#####  Basic parameters  #####
base_dir=~/Documents/Code/bash-debug-script
data_dir=data
start_window=750
stop_window=1630
output_file=bash-debug-script.out
error_file=bash-debug-script.err

cwd=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

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
        if [ $(date +%k) -gt 9 ] # Don't execute before 0900
        then
            echo $(date +%I:%M:%S) $(date +%p) >> $base_dir/$data_dir/$error_file
        else
            play -q $cwd/media/beep.wav -t alsa
            sleep 0.25s
            play -q $cwd/media/beep.wav -t alsa
            sleep 0.875s
        fi    
        ;;
    15)
        echo $(date +%I:%M:%S) $(date +%p) >> $base_dir/$data_dir/$error_file;;
    30|40)
        echo $(date +%I:%M:%S) $(date +%p) >> $base_dir/$data_dir/$error_file;;
    *0)
        echo $(date +%I:%M:%S) $(date +%p) >> $base_dir/$data_dir/$error_file;;
        sleep 0.875s
        play -q $cwd/media/beep.wav -t alsa
    *5)
        echo $(date +:%M:%S) $(date +%p) >> $base_dir/$data_dir/$error_file;;
    *)
        echo -e "    \033[1;33m\033[43  Nothing to do at "$(date +%I:%M:%S)"    \033[0m"
        ;;
  esac

#####  APPLICATION TO RUN  #####

#    <SOME APPLICATION TO DEBUG> 1>>$base_dir/$data_dir/$output_file 2>>$base_dir/$data_dir/$error_file

# Example:
#    date 1>>$base_dir/$data_dir/$output_file 2>>$base_dir/$data_dir/$error_file
    play -q $cwd/media/beep.wav -t alsa
fi
