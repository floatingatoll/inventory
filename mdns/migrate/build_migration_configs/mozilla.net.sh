#!/bin/bash

MC=$REL_PATH/inventory/mdns/migrate/make_config.py

echo "SYSADMIN_REPO = ''"
echo "$1 = ["

for file in $(ls $2)
do
    if [ ! -d $2/$file ]
    then
        continue
    fi

    if [[ $file == "build" ]]
    then
        continue
    fi

    python $MC $file.mozilla.net $REL_PATH/sysadmins/dnsconfig/zones/mozilla.net/$file/public f public False
    python $MC $file.mozilla.net $REL_PATH/sysadmins/dnsconfig/zones/mozilla.net/$file/private f private False

done
echo "]"
