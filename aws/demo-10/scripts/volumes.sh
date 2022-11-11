#!/bin/bash 

set -ex

# LVM 볼륨 check
vgchange -ay 

# 파일시스템 출력 {xvdh}
DEVICE_FS=`blkid -o value -s TYPE ${DEVICE} || echo ""`

# 파일 시스템이 없을 경우 실행 
if [ "`echo -n $DEVICE_FS`" == "" ] ; then 
  DEVICENAME=`echo "${DEVICE}" | awk -F '/' '{print $3}'`
  DEVICEEXISTS=''
  while [[ -z $DEVICEEXISTS ]]; do
    echo "checking $DEVICENAME"
    DEVICEEXISTS=`lsblk |grep "$DEVICENAME" |wc -l`
    if [[ $DEVICEEXISTS != "1" ]]; then
      sleep 15
    fi
  done

  # make sure the device file in /dev/ exists
  count=0
  until [[ -e ${DEVICE} || "$count" == "60" ]]; do
   sleep 5
   count=$(expr $count + 1)
  done
  # /dev/data/volume1 생성 
  pvcreate ${DEVICE}
  vgcreate data ${DEVICE}
  lvcreate --name volume1 -l 100%FREE data
  # xvdh 대신 /dev/data/volume1 사용
  mkfs.ext4 /dev/data/volume1
fi 

# 디렉토리가 존재하지 않을 경우 생성 
mkdir -p /data 

echo '/dev/data/volume1 /data ext4 defaults 0 0' >> /etc/fstab
mount /data 

# install docker 
curl https://get.docker.com | bash