#!/sbin/sh

ui_print "- 正在配置安全启动修复模块..."
ui_print "- 作者: XIAN | 交流群: 605389940"
ui_print "- 仓库: https://github.com/Rikka06/lockstate-fix"
ui_print " "

# 1. 立即锁定属性
resetprop -n ro.secureboot.lockstate locked

CURRENT_STATE=$(resetprop ro.secureboot.lockstate)
if [ "$CURRENT_STATE" = "locked" ]; then
    ui_print "- [已生效] ro.secureboot.lockstate -> locked 喵！"
    sed -i "s|^description=.*|description=[已锁定] 自动锁定安全启动状态。仓库: https://github.com/Rikka06/lockstate-fix \| 交流群: 605389940|g" "$MODPATH/module.prop"
else
    ui_print "- [未锁定] 当前属性状态: $CURRENT_STATE 喵"
fi

# 2. 配置权限
set_perm "$MODPATH/action.sh" 0 0 0755
set_perm "$MODPATH/service.sh" 0 0 0755
set_perm "$MODPATH/system.prop" 0 0 0644

rm -f "$MODPATH/disable"
rm -f "$MODPATH/remove"

ui_print " "
ui_print "- 安装完成！已即时生效，无需立即重启喵。"
