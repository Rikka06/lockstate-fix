#!/sbin/sh

ui_print "****************************************"
ui_print "*        Lockstate Fix 安全启动状态修复       *"
ui_print "*        https://github.com/Rikka06/lockstate-fix *"
ui_print "****************************************"
ui_print " "
ui_print "- 运行环境检测:"
ui_print "  • 设备架构: $ARCH"
ui_print "  • 系统版本: API $API"
if [ "$KSU" = "true" ]; then
    ui_print "  • Root 框架: KernelSU / SukiSU"
elif [ "$APATCH" = "true" ]; then
    ui_print "  • Root 框架: APatch"
else
    ui_print "  • Root 框架: Magisk"
fi
ui_print " "

ui_print "- [1/3] 检查并锁定安全启动属性..."
CURRENT_STATE=$(resetprop ro.secureboot.lockstate)
ui_print "  • 当前属性值: [ $CURRENT_STATE ]"

resetprop -n ro.secureboot.lockstate locked
NEW_STATE=$(resetprop ro.secureboot.lockstate)

if [ "$NEW_STATE" = "locked" ]; then
    ui_print "  • [OK] 属性已成功锁定为: locked"
    sed -i "s|^description=.*|description=[已锁定] 自动锁定安全启动状态。仓库: https://github.com/Rikka06/lockstate-fix \| 交流群: 605389940|g" "$MODPATH/module.prop"
else
    ui_print "  • [提示] 当前属性状态为: $NEW_STATE"
fi
ui_print " "

ui_print "- [2/3] 配置开机自启服务与执行权限..."
set_perm "$MODPATH/action.sh" 0 0 0755
set_perm "$MODPATH/service.sh" 0 0 0755
set_perm "$MODPATH/system.prop" 0 0 0644

rm -f "$MODPATH/disable"
rm -f "$MODPATH/remove"
ui_print "  • [OK] 权限及持久化配置完成"
ui_print " "

ui_print "- [3/3] 安装完成"
ui_print "  • 属性已即时生效，无需强制重启手机即可测试。"
ui_print " "
