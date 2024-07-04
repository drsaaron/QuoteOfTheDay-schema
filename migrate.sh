#! /bin/sh

while getopts :s: OPTION
do
    case $OPTION in
	s)
	    schemaArg="-s $OPTARG"
	    ;;
    esac
done

$(dirname $0)/flyway.sh -a migrate $schemaArg


