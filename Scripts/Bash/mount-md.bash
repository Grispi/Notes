#!/bin/bash

action="$1"
md0_uid="1c9472df-621b-488f-8480-65eae855ae09"
md1_uid="7153776b-b3aa-4607-b40c-b774d2203ed6"

if [ $action == 'mount' ]; then
  veracrypt --mount "/dev/disk/by-partuuid/$md0_uid" "/mnt/MD0" --slot=20
  veracrypt --mount "/dev/disk/by-partuuid/$md1_uid" "/mnt/MD1" --slot=21
fi

if [ $action == 'umount' ]; then
  veracrypt -t -d "/dev/disk/by-partuuid/$md0_uid"
  veracrypt -t -d "/dev/disk/by-partuuid/$md1_uid"
fi

