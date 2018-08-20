#!/bin/sh

groups=(infra loadbalancer master node support)


GUID=`hostname | cut -d"." -f2`
mkdir -p lab/backup/
host_path="lab/hosts_generated"
ansible_host_path="/etc/ansible/hosts"


nodes=( $(ansible all --list-hosts) ) 
processed=${nodes[@]:2}

echo "[bastion]" > $host_path
echo  "bastion.$GUID.internal" >> $host_path

processed=($(for each in ${processed[@]}; do echo $each; done | sort))
CURR_NODE=''
HEADER=false
for i in ${processed[@]}
do
  for x in ${groups[@]}
  do
   if [[ $i == $x* ]] && [[ $CURR_NODE != $x ]] ;
   then
   
    CURR_NODE=$x
    HEADER=true
   fi
  done

 if [[ $i == "support1"* ]] ;
 then
  echo "" >> $host_path
  echo "[nfs]" >> $host_path
  echo "${i}" >> $host_path
 fi
 
 if $HEADER ; 
 then
  echo "" >> $host_path
  echo "[$CURR_NODE]" >> $host_path
  HEADER=false
 fi  
 echo "${i}" >> $host_path
  #echo "nodes : ${i}"
done




