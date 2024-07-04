#! /bin/sh

while getopts :a:s: OPTION
do
    case $OPTION in
	a)
	    case $OPTARG in
		clean)
		    action=flyway:clean
		    ;;
		migrate)
		    action=flyway:migrate
		    ;;
		*)
		    echo "action is clean or migrate, nothing else." 1>&2
		    exit 1
	    esac
	    ;;
	s)
	    schema=$OPTARG
	    ;;
	*)
	    echo "usage: $(basename $0) -a clean|migrate [-s schema]" 1>&2
	    exit 1
	    ;;
    esac
done
    
server=localhost
userID=flyway_user
[ "$server" = "localhost" ] && key="MySQL/local" || key=$server
password=$(pass Database/$key/$userID)

url="jdbc:mysql://$server:3306/${schema:-QuoteOfTheDay}?useSSL=true"

mvn -Dflyway.url="$url" -Dflyway.user="$userID" -Dflyway.password="$password" -Dflyway.sqlMigrationPrefix=DBR -Dflyway.locations=filesystem:`pwd` -Dflyway.cleanDisabled=false -Dflyway.table=schema_version $action

