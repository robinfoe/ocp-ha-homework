#!/bin/sh

nodes=( $(ansible all --list-hosts) ) 
#echo ${#nodes[@]}
processed=${nodes[@]:2}
for i in ${processed[@]}
do
  echo "nodes : ${i}"
done

