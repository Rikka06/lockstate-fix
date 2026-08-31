# 🔒 安全启动状态修复模块 (SecureBoot Lockstate Fix)

[![GitHub Release](https://img.shields.io/github/v/release/Rikka06/secureboot_lockstate_fix?style=flat-square&color=blue)](https://github.com/Rikka06/secureboot_lockstate_fix/releases)
[![License](https://img.shields.io/badge/License-GPL%20v3-green.svg?style=flat-square)](LICENSE)
[![KernelSU](https://img.shields.io/badge/KernelSU-Supported-brightgreen?style=flat-square)](https://kernelsu.org)
[![SukiSU](https://img.shields.io/badge/SukiSU-Supported-blueviolet?style=flat-square)](https://github.com/tiann/KernelSU)
[![Magisk](https://img.shields.io/badge/Magisk-Supported-orange?style=flat-square)](https://github.com/topjohnwu/Magisk)

专为解决 Android 环境检测中 **“证书链篡改”** 异常而设计的轻量级 Root 模块。支持 SukiSU、KernelSU 及 Magisk，刷入即刻生效，无需强制立即重启，开机全自动持久化锁定。

---

## 📥 模块直接下载

* 📦 **最新发布版 (GitHub Releases)**：[点击前往下载 Release ZIP 包](https://github.com/Rikka06/secureboot_lockstate_fix/releases/latest)
* 🚀 **仓库文件直链下载**：[安全启动状态修复_v1.0.0.zip](https://github.com/Rikka06/secureboot_lockstate_fix/raw/main/安全启动状态修复_v1.0.0.zip)

---

## 📖 背景与起因

在使用 **春秋检测 (Chunqiu-Detector)** 等环境检测工具时，设备在重启后频繁被提示 **“证书链篡改”** 异常（如下图 1 所示）。

查阅 [春秋检测问题解决方案文档](https://github.com/mingzun09/Chunqiu-Detector-Problem-solution/tree/main) 未找到对应直接解法，随后在酷安社区找到了由酷安用户 **[@JeTeeZnTmaxQwQ](https://www.coolapk.com/feed/73437573?s=MWM0NTlmY2MzNjYyOTBnNmE5NTkxZmF6a1651)** 分享的关键思路：

> 在终端中通过 `su` 权限执行以下命令即可解决证书链报错：
> ```bash
> resetprop ro.secureboot.lockstate locked
> ```

该方案确实能够完美解决证书链异常，但**每次手机重启后该属性会被系统重置，导致重新报毒失效**。

为了免去每次开机手动输命令的繁琐，本项目利用 **Gemini 3.7 Flash** 编写封装成了标准的 KernelSU / SukiSU / Magisk 模块：
1. **即刻生效**：刷入瞬间自动执行，无需立即重启。
2. **开机持久化**：开机后自动保底检测并锁定属性，彻底告别重复失效。
3. **状态自检**：提供 Action 动作脚本，随时随地在管理器中一键自检锁定状态。

---

## 📸 效果对比

| 修复前（证书链篡改报错） | 修复后（证书链正常锁定） |
| :---: | :---: |
| ![修复前](assets/problem_cert_chain.jpg) | ![修复后](assets/solution_fixed.jpg) |

---

## ⚙️ 模块特性

- **轻量纯净**：无多余守护进程与耗电后台，仅在刷入与开机初期执行属性锁定。
- **免重启即时生效**：`customize.sh` 在模块安装阶段即时触发属性重写。
- **状态感知卡片**：支持在 SukiSU / KernelSU 管理器卡片上动态显示 `[🔒 locked]` 状态徽章。
- **一键自检**：在 Root 管理器中点击「执行 / Action」按钮即可调用 `action.sh` 快速核验当前安全启动状态。

---

## 🛠️ 安装与使用指南

1. 从上方链接下载最新版本的模块 ZIP 包；
2. 打开手机上的 **SukiSU / KernelSU / Magisk Manager**；
3. 进入「模块」界面，点击「从本地安装」选择该 ZIP 文件；
4. 刷入完成后，属性已立即生效；之后正常使用与重启手机均可保持锁定状态。

---

## 🤝 致谢与声明

- 感谢 **[@JeTeeZnTmaxQwQ](https://www.coolapk.com/feed/73437573?s=MWM0NTlmY2MzNjYyOTBnNmE5NTkxZmF6a1651)** 提供的核心属性解决方案。
- 参考项目：[Chunqiu-Detector-Problem-solution](https://github.com/mingzun09/Chunqiu-Detector-Problem-solution/tree/main)
- 模块生成与优化：由 **Gemini 3.7 Flash** 辅助完成架构构建与调优。

---

## 📬 交流与关注

- **开发者 / 作者**：XIAN
- **交流 QQ 群**：`605389940`
- **酷安主页**：[访问酷安](https://www.coolapk.com/u/3564176)
- **哔哩哔哩**：[访问 B 站个人空间](https://b23.tv/Zks8L7W)
- **抖音主页**：[访问抖音](https://v.douyin.com/oFVtoEuk6yQ/)

---

## 📄 License

本项目基于 [GPL-3.0 License](LICENSE) 开源。
