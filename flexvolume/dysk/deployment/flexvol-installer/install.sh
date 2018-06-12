#!/bin/bash

set -eo pipefail

target_dir="${TARGET_DIR}"

if [[ -z "${target_dir}" ]];then
  target_dir="/etc/kubernetes/volumeplugins"
  echo "target dir is not set, use default: $TARGET_DIR"
fi

dysk_vol_dir="${target_dir}/azure~dysk"
mkdir -p ${dysk_vol_dir}

#copy
cp /bin/dyskctl ${dysk_vol_dir}/dyskctl #cli
cp /bin/dysk ${dysk_vol_dir}/dysk #script

#https://github.com/kubernetes/kubernetes/issues/17182
# if we are running on kubernetes cluster as a daemon set we should
# not exit otherwise, container will restart and goes into crashloop (even if exit code is 0)
while true; do echo "install done, daemonset sleeping" && sleep 300; done

