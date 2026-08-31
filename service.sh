#!/system/bin/sh
######################################################
# 安全启动状态修复 (SecureBoot Fix)
# 作者: XIAN | 交流QQ群: 605389940
######################################################
MODDIR=${0%/*}

# 等待系统开机底层准备好喵
sleep 2

# 锁定属性
resetprop -n ro.secureboot.lockstate locked

LOCKSTATE=$(resetprop ro.secureboot.lockstate)
if [ "$LOCKSTATE" = "locked" ]; then
    STATE_TAG="[🔒 locked]"
else
    STATE_TAG="[🔓 $LOCKSTATE]"
fi

sed -i "s/^description=.*/description=${STATE_TAG} taffy直接把属性锁死啦，证书链报错通通退散喵。交流群: 605389940/g" "$MODDIR/module.prop"
