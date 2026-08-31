#!/system/bin/sh
MODDIR=${0%/*}

echo "- 安全启动状态修复 · 状态自检"
echo "- 作者: XIAN | 交流群: 605389940"
echo " "

echo "- taffy正在检查当前属性状态..."
CURRENT_STATE=$(resetprop ro.secureboot.lockstate)
echo "- 当前 ro.secureboot.lockstate: [ $CURRENT_STATE ]"

if [ "$CURRENT_STATE" = "locked" ]; then
    echo "- 检查通过: [🔒 locked] 锁定状态正常，不用担心被抓到喵！"
    STATE_TAG="[🔒 locked]"
else
    echo "- 发现状态为 [🔓 $CURRENT_STATE]，taffy现在就帮你锁死喵..."
    resetprop -n ro.secureboot.lockstate locked
    NEW_STATE=$(resetprop ro.secureboot.lockstate)
    echo "- 锁定完成: 当前状态已切换为 [🔒 $NEW_STATE ] 喵！"
    STATE_TAG="[🔒 $NEW_STATE]"
fi

sed -i "s/^description=.*/description=${STATE_TAG} taffy直接把属性锁死啦，证书链报错通通退散喵。交流群: 605389940/g" "$MODDIR/module.prop"

echo " "
echo "【交流与关注】"
echo "- 交流QQ群: 605389940"
echo "- 酷安主页: https://www.coolapk.com/u/3564176"
echo "- 哔哩哔哩: https://b23.tv/Zks8L7W"
echo "- 抖音主页: https://v.douyin.com/oFVtoEuk6yQ/"
