#!/system/bin/sh
MODDIR=${0%/*}

sleep 2
resetprop -n ro.secureboot.lockstate locked

LOCKSTATE=$(resetprop ro.secureboot.lockstate)
if [ "$LOCKSTATE" = "locked" ]; then
    STATE_TAG="[已锁定]"
else
    STATE_TAG="[未锁定: $LOCKSTATE]"
fi

sed -i "s|^description=.*|description=${STATE_TAG} 自动锁定安全启动状态。仓库: https://github.com/Rikka06/lockstate-fix \| 交流群: 605389940|g" "$MODDIR/module.prop"
