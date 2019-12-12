#!/bin/bash
set -e;

#DB_SKIP=${DB_SKIP:-${DB_SKIP}}

arguments=''
dumpfile="/backups/$(date +"%G-%m-%d_%H:%M:%S").sql";

if [[ ${ALLSERVER_BACKUP} == true ]]; then
   arguments+='--all-databases ';
fi

if [ [${DEBUG} == true] ]; then
   arguments+='--debug ';
fi

# build mysqldump arguments structure
arguments+="--host=${DB_HOST} --user=${DB_USER} --password=${DB_PASS} ";
arguments+=$*;

# this[--databases] arg MUST be the last
if [${DB_NAME} != null] && [${ALLSERVER_BACKUP} != true]; then
   arguments+="--databases ${DB_NAME} ";
fi

echo -e "Host: ${DB_HOST}";
echo -e "User Info: ${DB_USER}@******";
echo -e "Dump file: $dumpfile";
echo -e "Start backup databases\n";

mysqldump $arguments > $dumpfile;

echo -e "Finish backup";
