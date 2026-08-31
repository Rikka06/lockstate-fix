#!/sbin/sh

ui_print "- 正在准备安装环境喵..."
ui_print "  • 设备架构: $ARCH (Android API $API)"
if [ "$KSU" = "true" ]; then
    ui_print "  • Root 运行环境: KernelSU / SukiSU"
else
    ui_print "  • Root 运行环境: Magisk / APatch"
fi
ui_print " "

ui_print "- [1/3] taffy正在检查并锁定安全启动属性..."
CURRENT_STATE=$(resetprop ro.secureboot.lockstate)
ui_print "  • 当前属性值: [ $CURRENT_STATE ]"

resetprop -n ro.secureboot.lockstate locked
NEW_STATE=$(resetprop ro.secureboot.lockstate)

if [ "$NEW_STATE" = "locked" ]; then
    ui_print "  • [OK] 属性已成功锁定为 locked 喵！"
    sed -i "s|^description=.*|description=[已锁定] 自动锁定安全启动状态。仓库: https://github.com/Rikka06/lockstate-fix \| 交流群: 605389940|g" "$MODPATH/module.prop"
else
    ui_print "  • [提示] 属性状态已更新为: $NEW_STATE 喵"
fi
ui_print " "

ui_print "- [2/3] 正在配置开机持久化与脚本权限..."
set_perm "$MODPATH/action.sh" 0 0 0755
set_perm "$MODPATH/service.sh" 0 0 0755
set_perm "$MODPATH/system.prop" 0 0 0644

rm -f "$MODPATH/disable"
rm -f "$MODPATH/remove"
ui_print "  • [OK] 开机自启服务与权限配置完成喵"
ui_print " "

ui_print "- [3/3] 模块信息与项目来源"
ui_print "  • 作者: XIAN | 交流群: 605389940"
ui_print "  • 仓库: https://github.com/Rikka06/lockstate-fix"
ui_print " "

ui_print "- 搞定啦！属性已经即时生效，不用急着重启手机喵~"
