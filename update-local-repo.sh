#!/bin/bash

PROJECT_DIR=$HOME/projects
LOG_DIR=$HOME/.local/var/ulr
TRACK_FILE=$LOG_DIR/update-local-repo.track
LOG_FILE=$LOG_DIR/update-local-repo.log
LOCK_FILE=$LOG_DIR/update-local-repo.lock

# List all 'git' directories
GIT_DIR_LIST=$(find $PROJECT_DIR -mindepth 2 -maxdepth 2 -type d -name .git | sort)

# Given the complete list of Git dir to check
# and the last directory processes
# return the next directory in line
find_next_git() {
    current=$(cat $TRACK_FILE)
    # If there is no last dir processed, start from the beginning
    if [ -z "${current}" ]; then
        echo $GIT_DIR_LIST | awk '{print $1}'
    # Else return the next dir to process
    # Cycle through the complete list
    else
        echo "$GIT_DIR_LIST" | awk -F/ -v var=$current '
                                    BEGIN { found=0; clear=0 }
                                    {
                                      if (NR==1)
                                         first=$0
                                      if (found==1 && clear==0) {
                                         print $0;
                                         clear=1
                                      };
                                      if ($(NF-1)==var)
                                         found=1
                                    }
                                    END {
                                        if (clear==0)
                                           print first
                                    }'
    fi
}

usage() {
    cat <<EOF
Usage: $(basename $0) <command>
List all Git directories under $PROJECT_DIR and, one by one,
fetch all its remotes.
Only one dir is processed at each call of this script.
Script designed to work called by a CRON job.

Commands:
  help                   Print this help message
  start                  Execute normal behavior
  clean                  Clean the log file
  lock [reason]          Lock the surgery (register the "reason" if given)
  release                Release the lock (and display the locking "reason")
  cron                   Output the content to add in CRON tab
EOF
}

display_cron() {
    # Run 'start' every 15 minutes, from Monday to Friday
    # Run 'clean' each Saturday at 00:01
    cat <<EOF
*/15 * * * 4-0 $0 start
1 0 * * 5 $0 clean
EOF
}

# Clean the log file
clean_log() {
    rm -rf $LOG_FILE
}

# Lock the process
lock() {
    reason="$@"
    echo $reason > $LOCK_FILE
}

# Display the locking reason if it exists
info_lock() {
    if [ -r $LOCK_FILE ]; then
        reason=$(cat $LOCK_FILE)
        echo -n "Lock reason: "
        if [ -z "$reason" ]; then
            echo "no reason"
        else
            echo $reason
        fi
    else
        echo "No lock present"
    fi
}

# Release the lock
release() {
    info_lock
    rm -f $LOCK_FILE
}

# Prepare the field for operation
prepare_update() {
    # Prepare log dir
    mkdir -p $LOG_DIR
    # Create mandatory file if non-existent
    touch $TRACK_FILE
    touch $LOG_FILE
}

do_update() {
    repo=$1
    # check lock
    if [ ! -r $LOCK_FILE ]; then
        # update tracking file
        basename $repo > $TRACK_FILE
        # update
        echo "Processing $repo"
        cd $repo
        git fetch --all --multiple -p
    else
        echo "Surgery is locked!"
        info_lock
    fi
}

start() {
    prepare_update
    # Get next Git directory to process
    next=$(dirname $(find_next_git))
    # Here we go: update
    do_update $next 2>&1 | tee -a $LOG_FILE
}

command=$1
shift
case $command in
    clean)
        clean_log
        ;;
    start)
        start
        ;;
    lock)
        lock $@
        ;;
    release)
        release
        ;;
    help)
        usage; exit 0
        ;;
    cron)
        display_cron
        ;;
    *)
        echo "Unknown command $command"; exit 1
        ;;
esac
