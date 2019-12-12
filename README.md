## docker-mysqldump
a simple mysqldump image for cron job | dockerhub: uuz233/mysqldump

## Arguments
|   Key    |  Accept value   | Description                   |  Required  |
|----------|-----------------|------------                   |------------|
| DB_USER  | String    | The user for mysql connection       | True       |
| DB_PASS  | String    | The password for connect db         |True        |
| DB_NAME  | String    | Name of database that want to backup|True [if missing ALLSERVER_BACKUP arg]|
| ALLSERVER_BACKUP  | True/False    | backup the hole mysql server|True [if missing DB_NAME arg]      |
| OTHER_ARG | String | other argument that you want to add | false |

## example

#### Backup a single database
```bash
docker run --rm \
  -e DB_HOST=mariadb-master-1 \
  -e DB_USER=root \
  -e DB_PASS=pass \
  -e DB_NAME=db1 \ 
  -v ./backups:/backups
uuz233/mysqldump
```
> Connect to DB _root@mariadb-master-1_ using password _pass_ for backup db __db1__ and save the SQL file to __./backups__

#### backup the hole server
```bash
docker run --rm \
  -e DB_HOST=mariadb-master-1 \
  -e DB_USER=root \
  -e DB_PASS=pass \
  -e ALLSERVER_BACKUP=true \ 
  -v ./backups:/backups
uuz233/mysqldump
```

> Connect to DB _root@mariadb-master-1_ using password _pass_ for backup __the hole server__ and save the SQL file to __./backups__

#### backup with other arguments
```bash
docker run --rm \
  -e DB_HOST=mariadb-master-1 \
  -e DB_USER=root \
  -e DB_PASS=pass \
  -e ALLSERVER_BACKUP=true \ 
  -e OTHER_ARG=--lock-tables=0 \
  -v ./backups:/backups
uuz233/mysqldump
```
> Connect to DB _root@mariadb-master-1_ using password _pass_ for backup __the hole server__ and save the SQL file to __./backups__. Using the arg __--lock-tables=0__

## Contribute 
Welcome to contribute to this project in any way(pr,issues,etc.)

## Licence
This project is under GPLv3
