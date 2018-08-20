#!/bin/sh

# groups=(infra loadbalancer master node support)

GUID=`hostname | cut -d"." -f2`
backup_path="lab/backup"
host_path="$backup_path/hosts_generated"
ansible_host_path="/etc/ansible/hosts"
vars_path="lab/host_vars/localhost.yml"

mkdir -p $backup_path
## replce the GUID
sed -i "s/sed_guid:.*/sed_guid: $GUID/g" $vars_path

sudo ansible-playbook -v -f 20 "lab/install_ocp.yml"



