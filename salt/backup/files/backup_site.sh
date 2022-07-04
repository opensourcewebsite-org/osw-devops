#!/bin/bash

BACKUP_DIR="{{backup_dir}}/sites/"`date +%y-%m-%d`
ROTATE="7"

SITES="{{backup_site_list}}"
SITE_DIR="www"

CONFIGS="{{backup_config_list}}"

function create_backup {
  nice -n 19 ionice -c3 tar {%- for exclude in pillar['backup_exclude_from_sites'] -%}{{' '}}--exclude="{{exclude}}"{% endfor %} -cfz ${BACKUP_DIR}/${1}.tgz -C / ${SITE_DIR}/${1}/htdocs
}

mkdir -p ${BACKUP_DIR}

for site in ${SITES};
do
  create_backup ${site}
done

tar czf ${BACKUP_DIR}/configs.tgz -C / `echo ${CONFIGS} | paste`

find ${BACKUP_DIR}/ -maxdepth 1 -type d -ctime +${ROTATE} -exec rm -rf {} \;
