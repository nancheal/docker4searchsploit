#!/bin/sh
# Updated by: nancheal <nancheal@gmail.com>
export TOP_PID=$$
trap 'exit 1' TERM
exit_script(){
        echo "USAGE:"
        echo "      docker run -it --rm nancheal/docker4searchsploit -E \"searchsploit\""
        echo "      docker run -it --rm nancheal/docker4searchsploit -E \"cat xxx\""
        kill -s TERM $TOP_PID
}
if [ $# -gt 0 ];then 
    while getopts "E:" OPT;do
            case $OPT in
                    E)
                            COMMAND=$OPTARG
                            ;;
                    \?)
                            :|exit_script
                            ;;
            esac
    done
    $COMMAND
else
    :|exit_script
fi