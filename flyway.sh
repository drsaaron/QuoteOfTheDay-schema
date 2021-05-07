#! /bin/sh

if [ $# != 1 ]
then
    echo "usage: $(basename $0) clean|migrate" 1>&2
    exit 1
fi

case $1 in
    clean)
	action=flywayClean
	;;
    migrate)
	action=flywayMigrate
	;;
    *)
	echo "action is clean or migrate, nothing else." 1>&2
	exit 1
esac
    
server=localhost
userID=flyway_user
schema=flywaytest
password=$(pass Database/MySQL/local/$userID)

url="jdbc:mysql://$server:3306/$schema?useSSL=true&verifyServerCertificate=false"

./gradlew -Dflyway.url="$url" -Dflyway.user="$userID" -Dflyway.password="$password" -Dflyway.sqlMigrationPrefix=DBR -Dflyway.locations=filesystem:`pwd` -Dflyway.table=schema_version $action


