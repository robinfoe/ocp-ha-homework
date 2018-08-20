NFS_NODE=$1
TEMPLATE_DIR_PATH=$2
FROM=$3
TO=$4
SIZE=$5
MODE=$6


mkdir -p $TEMPLATE_DIR_PATH/pvs


for volume in $(eval echo "pv{$FROM..$TO}") ; do
cat << EOF > $TEMPLATE_DIR_PATH/pvs/${volume}.yml
{
  "apiVersion": "v1",
  "kind": "PersistentVolume",
  "metadata": {
    "name": "${volume}"
  },
  "spec": {
    "capacity": {
        "storage": "${SIZE}"
    },
    "accessModes": [ "${MODE}" ],
    "nfs": {
        "path": "/srv/nfs/user-vols/${volume}",
        "server": "${NFS_NODE}"
    },
    "persistentVolumeReclaimPolicy": "Recycle"
  }
}
EOF
echo "Created def file for ${volume}";
done;
