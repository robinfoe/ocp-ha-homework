# ocp-ha-homework
Advance OCP HA Homework 

# How to use the playbook
run the below command

```sh
$ sh provision-cluster.sh
```
provision-cluster.sh will automatically detect GUID within the bastion host environment and trigger playbook at lab/install_ocp.yml

# Playbook Structure
```sh

lab/
├── ansible.cfg.backup
├── host_vars
│   └── localhost.yml  :   variable configuration 
├── install_ocp.yml
├── ocp_template
│   ├── app_pipeline   :  Generate  openshift task projects with jenkins pipeline
│   ├── multitenant    :  Create  new project request tempalte with limit and network policy
│   ├── pvs           
│   └── smoketest      :  Create nodejs mongodb project for smoke testing
├── precheck_cluster.yml
├── provision_cluster.yml
└── roles
    ├── bastion              : generate host file from jinja
    ├── make-applier-projects-unique
    ├── multitenant          : Create multitenant structure with  node selector
    ├── openshift-applier
    ├── openshift-labels
    ├── openshift-replicas-ready
    ├── openshift-route-status
    ├── postinstall          : create PV
    ├── smoked               : run smoketest
```
