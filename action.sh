#!/system/bin/sh
MODDIR=${0%/*}

echo "========================================"
echo "  Lockstate Fix · 状态自检与修复"
echo "  仓库: https://github.com/Rikka06/lockstate-fix"
echo "========================================"
echo " "

echo "- [1/2] 正在检测当前安全启动属性..."
CURRENT_STATE=$(resetprop ro.secureboot.lockstate)
echo "  • ro.secureboot.lockstate = [ $CURRENT_STATE ]"

if [ "$CURRENT_STATE" = "locked" ]; then
    echo "  • [OK] 状态正常：属性已处于 locked 锁定状态。"
    STATE_TAG="[已锁定]"
else
    echo "  • [提示] 检测到未锁定，正在执行即时锁定修复..."
    resetprop -n ro.secureboot.lockstate locked
    NEW_STATE=$(resetprop ro.secureboot.lockstate)
    echo "  • [OK] 修复完成，当前属性已更新为: [ $NEW_STATE ]"
    STATE_TAG="[已锁定: $NEW_STATE]"
fi

sed -i "s|^description=.*|description=${STATE_TAG} 自动锁定 ro.secureboot.lockstate 为 locked。仓库: https://github.com/Rikka06/lockstate-fix \| 交流群: 605389940|g" "$MODDIR/module.prop"
echo " "
echo "- [2/2] 自检完成，开机自启服务会在每次重启后自动保持锁定。"
