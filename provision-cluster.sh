#!/bin/sh

# groups=(infra loadbalancer master node support)

GUID=`hostname | cut -d"." -f2`
backup_path="lab/backup"
host_path="$backup_path/hosts_generated"
ansible_host_path="/etc/ansible/hosts"
vars_path="lab/host_vars/localhost.yml"
smoke_test_param_path="lab/ocp_template/smoketest/param/smoke-param"



mkdir -p $backup_path
## replce the GUID
sed -i "s/sed_guid:.*/sed_guid: $GUID/g" $vars_path
sed -i "s/APPLICATION_DOMAIN=.*/APPLICATION_DOMAIN=nodejs-mongo-persistent-smoke-test.apps.$GUID.example.opentlc.com/g" $smoke_test_param_path

sudo ansible-playbook -v -f 20 "lab/install_ocp.yml"



