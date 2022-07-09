#!/bin/bash

BACKUP_DIR="{{backup_dir}}/sites/$(date +%y-%m-%d)"
ROTATE="7"

SITES="{{backup_site_list}}"
SITE_DIR="/www"

function create_backup {
  nice -n 19 ionice -c3 tar czf "${BACKUP_DIR}/${1}.tgz" {%- for exclude in pillar['backup_exclude_from_sites'] -%}{{' '}}--exclude="{{exclude}}"{% endfor %} -C "${SITE_DIR}" "${1}"/htdocs
}

mkdir -p "${BACKUP_DIR}"

for site in ${SITES};
do
  create_backup "${site}"
done

find "${BACKUP_DIR}"/ -maxdepth 1 -type d -mtime +"${ROTATE}" -exec rm -rf {} \;
