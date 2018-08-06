#!/bin/sh

GUID=`hostname | cut -d"." -f2`
host_path="lab/hosts"
nodes=( $(ansible all --list-hosts) ) 
processed=${nodes[@]:2}

echo "[bastion]" > $host_path
echo  "bastion.$GUID.example.opentlc.com" >> $host_path




for i in ${processed[@]}
do
  echo "nodes : ${i}"
done

