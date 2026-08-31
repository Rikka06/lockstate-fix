#!/system/bin/sh
MODDIR=${0%/*}

echo "- 安全启动状态修复 · 状态自检"
echo "- 仓库: https://github.com/Rikka06/lockstate-fix"
echo "- 交流QQ群: 605389940"
echo " "

CURRENT_STATE=$(resetprop ro.secureboot.lockstate)
echo "- 当前 ro.secureboot.lockstate: [ $CURRENT_STATE ]"

if [ "$CURRENT_STATE" = "locked" ]; then
    echo "- 检查结果: 锁定状态正常 (locked) 喵！"
    STATE_TAG="[已锁定]"
else
    echo "- 正在重新执行锁定..."
    resetprop -n ro.secureboot.lockstate locked
    NEW_STATE=$(resetprop ro.secureboot.lockstate)
    echo "- 锁定完成: 当前状态为 [ $NEW_STATE ] 喵！"
    STATE_TAG="[已锁定: $NEW_STATE]"
fi

sed -i "s|^description=.*|description=${STATE_TAG} 自动锁定安全启动状态。仓库: https://github.com/Rikka06/lockstate-fix \| 交流群: 605389940|g" "$MODDIR/module.prop"
