#!/sbin/sh

ui_print "- 正在初始化模块配置..."
ui_print "- 作者: XIAN | 交流群: 605389940"
ui_print "- 关注: 酷安 / 哔哩哔哩 / 抖音"
ui_print " "

# 1. 立即锁定属性
ui_print "- taffy正在处理安全启动属性..."
resetprop -n ro.secureboot.lockstate locked

CURRENT_STATE=$(resetprop ro.secureboot.lockstate)
if [ "$CURRENT_STATE" = "locked" ]; then
    ui_print "- [🔒 已锁定] ro.secureboot.lockstate -> locked 喵！"
    sed -i "s/^description=.*/description=[🔒 locked] taffy直接把属性锁死啦，证书链报错通通退散喵。交流群: 605389940/g" "$MODPATH/module.prop"
else
    ui_print "- [🔓 未锁定] 当前属性状态: $CURRENT_STATE 喵"
    sed -i "s/^description=.*/description=[🔓 $CURRENT_STATE] 属性未完全锁定，请检查设备状态喵。交流群: 605389940/g" "$MODPATH/module.prop"
fi

# 2. 配置权限与环境
ui_print "- 正在准备开机持久化与自检接口..."
set_perm "$MODPATH/action.sh" 0 0 0755
set_perm "$MODPATH/service.sh" 0 0 0755
set_perm "$MODPATH/system.prop" 0 0 0644

rm -f "$MODPATH/disable"
rm -f "$MODPATH/remove"

ui_print " "
ui_print "- 搞定啦！已即时生效，不用急着重启喵。"
