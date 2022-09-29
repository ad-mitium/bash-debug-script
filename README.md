# Bash Debug Script
Basic bash script template for debugging while running another script via cron.  

It is intended to output time to a text file so that unwatched, long running scripts can be debugged for issues reported by STDERR closer to when the error occurred.

## Usage: 
Run this script using cron.  Inside the script, invoke the actual application to debug.

## Example: 

In cron:
```
     0,10,20,30,40,50 10-15 * * 1-5 bash-debug-script.sh 
```

## To Do

- TBD
