#!/bin/bash

ARG=$1

date=`date +%y-%m-%d`
dhour=`date +%H`
MYSQL=/usr/bin/mysql
DUMP=/usr/bin/mysqldump
DUMPOPTIONS="-ceqQ --single-transaction --add-drop-table --allow-keywords"
DBASES_DIR="{{backup_dir}}/mysql/$date/db"
TABLES_DIR="{{backup_dir}}/mysql/$date/tables"

if [ -z "$ARG" ]; then
    DATABASES=`$MYSQL $ACCOUNT -Bse 'show databases'|grep -vP 'information_schema|performance_schema|sys'`
    dminute=""
else
    DATABASES="$ARG"
    dminute=`date +%H-%M`
fi

mkdir -p $DBASES_DIR

for ii in $DATABASES;do
    schem="\`$ii\`"
    i="$ii$dminute"
    [ ! -d $TABLES_DIR/$i ] && mkdir -p $TABLES_DIR/$i
    TABLES=`$MYSQL $ACCOUNT -Bse "show tables from $schem"`
    rm -f $DBASES_DIR/$i.sql.bz2
    for j in $TABLES;do
      $DUMP $ACCOUNT $DUMPOPTIONS $ii $j | gzip -1 > $TABLES_DIR/$i/$j.sql.gz
      zcat $TABLES_DIR/$i/$j.sql.gz | bzip2 -c | tee -a $DBASES_DIR/$i.sql.bz2 > $TABLES_DIR/$i/$j.sql.bz2 && rm -f $TABLES_DIR/$i/$j.sql.gz
    done
done

DIR="{{backup_dir}}/mysql"
arh=7

for cusr in `ls $DIR --full-time -t | awk '{print $9}'`;
do
   if (("$arh" < 1))
   then
       `rm -fr $DIR/$cusr`
   fi
   let "arh -= 1"
done
