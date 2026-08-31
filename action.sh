#!/system/bin/sh
MODDIR=${0%/*}

echo "- 安全启动状态修复 · 状态自检"
echo "- 作者: XIAN | 交流QQ群: 605389940"
echo "- 仓库: https://github.com/Rikka06/lockstate-fix"
echo " "

echo "- [1/2] taffy正在检查当前系统属性..."
CURRENT_STATE=$(resetprop ro.secureboot.lockstate)
echo "  • ro.secureboot.lockstate: [ $CURRENT_STATE ]"

if [ "$CURRENT_STATE" = "locked" ]; then
    echo "  • [OK] 状态正常，安全启动已锁定，证书链检测通过喵！"
    STATE_TAG="[已锁定]"
else
    echo "  • 发现未锁定，taffy正在执行即时锁定修复..."
    resetprop -n ro.secureboot.lockstate locked
    NEW_STATE=$(resetprop ro.secureboot.lockstate)
    echo "  • [OK] 修复完成，当前状态已切换为: [ $NEW_STATE ] 喵！"
    STATE_TAG="[已锁定: $NEW_STATE]"
fi

sed -i "s|^description=.*|description=${STATE_TAG} 自动锁定安全启动状态。仓库: https://github.com/Rikka06/lockstate-fix \| 交流群: 605389940|g" "$MODDIR/module.prop"
echo " "
echo "- [2/2] 状态自检完成，后续正常重启也会自动保持锁定喵。"
