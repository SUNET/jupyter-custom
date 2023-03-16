#!/bin/bash
config='/home/jovyan/.rclone.conf'
workdir='/home/jovyan/drive'

if ! [[ -f ${config} ]]; then

  template="
[drive]
type = webdav
url = https://sunet.drive.sunet.se/remote.php/webdav/
vendor = nextcloud
user = ${JUPYTERHUB_USER}
pass = This_is_a_dummy_password 
"
  echo "${template}" > "${config}"

  read -rsp 'Password: ' password 
  rclone config password drive pass "${password}"
fi

mkdir -p ${workdir}
rclone --config "${config}" mkdir drive:jupyter
rclone --config "${config}" mount drive:jupyter "${workdir}" --daemon
