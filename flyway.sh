#! /bin/sh

while getopts :s:a: OPTION
do
    case $OPTION in
	s)
	    schema=$OPTARG
	    ;;
	a)
	    actionArg=$OPTARG
	    ;;
	*)
	    echo "invalid option $OPTARG" 1>&2
	    exit 1
    esac
done
    
if [ -z "$schema" -o -z "$actionArg" ]
then
    echo "usage: $(basename $0) -s <schema> -a clean|migrate|baseline" 1>&2
    exit 1
fi

case $actionArg in
    clean)
	action=flywayClean
	;;
    migrate)
	action=flywayMigrate
	;;
    baseline)
	action=flywayBaseline
	;;
    *)
	echo "action is clean, migrate, or baseline, nothing else." 1>&2
	exit 1
esac
    
server=localhost
userID=flyway_user
password=$(pass Database/MySQL/local/$userID)

url="jdbc:mysql://$server:3306/$schema?useSSL=true&verifyServerCertificate=false"

./gradlew -Dflyway.url="$url" -Dflyway.user="$userID" -Dflyway.password="$password" -Dflyway.sqlMigrationPrefix=DBR -Dflyway.locations=filesystem:`pwd` -Dflyway.table=schema_version $action


