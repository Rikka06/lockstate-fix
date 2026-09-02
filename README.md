# 安全启动状态修复 (Lockstate Fix)

<p align="left">
  <a href="https://github.com/Rikka06/lockstate-fix/releases"><img src="https://img.shields.io/github/v/release/Rikka06/lockstate-fix?style=flat-square&color=blue" alt="GitHub Release"></a>
  <a href="LICENSE"><img src="https://img.shields.io/badge/License-GPL%20v3-green.svg?style=flat-square" alt="License"></a>
  <a href="https://kernelsu.org"><img src="https://img.shields.io/badge/KernelSU-Supported-brightgreen?style=flat-square" alt="KernelSU"></a>
  <a href="https://github.com/tiann/KernelSU"><img src="https://img.shields.io/badge/SukiSU-Supported-blueviolet?style=flat-square" alt="SukiSU"></a>
  <a href="https://github.com/bmax121/APatch"><img src="https://img.shields.io/badge/APatch-Supported-purple?style=flat-square" alt="APatch"></a>
  <a href="https://github.com/topjohnwu/Magisk"><img src="https://img.shields.io/badge/Magisk-Supported-orange?style=flat-square" alt="Magisk"></a>
</p>

专为解决 Android 环境检测（如春秋检测等）中 **“证书链篡改”** 异常而设计的轻量级 Root 模块。通过锁定 `ro.secureboot.lockstate` 为 `locked`，实现免重启即时生效与开机持久化保持。

---

## 📥 快速下载

| 发布版本 | 模块包下载 | 文件大小 | SHA-256 校验和 |
| :--- | :--- | :--- | :--- |
| **最新发布版** | [Releases 下载](https://github.com/Rikka06/lockstate-fix/releases/latest) | ~2.9 KB | `6602d8ec5289d7af0b09e1b06de93b5f5a5aa3cb727fd4df1d165c724b12fae3` |
| **仓库直链** | [LockstateFix-v1.0.0.zip](https://github.com/Rikka06/lockstate-fix/raw/main/LockstateFix-v1.0.0.zip) | ~2.9 KB | `6602d8ec5289d7af0b09e1b06de93b5f5a5aa3cb727fd4df1d165c724b12fae3` |

---

## 🎯 效果对比

| 修复前（证书链篡改报错） | 修复后（证书链正常锁定） |
| :---: | :---: |
| ![修复前](assets/problem_cert_chain.jpg) | ![修复后](assets/solution_fixed.jpg) |

---

## ✨ 核心特性

- ⚡ **即刷即用**：安装脚本在刷入阶段直接重写属性，无需强制重启手机即可通过检测。
- 🔄 **开机自持**：开机自启服务（`service.sh`）自动补全锁定，彻底防止系统重启后属性重置。
- 🩺 **状态感知与自检**：
  - 模块列表中动态显示 `[已锁定]` 状态标签；
  - 支持在管理器中点击「执行 / Action」脚本一键自检与快速修复。
- 🪶 **极简纯净**：无多余守护进程、无常驻后台，零性能消耗与电量开销。

---

## 📱 兼容性

| 维度 | 支持范围 |
| :--- | :--- |
| **Root 方案** | KernelSU / SukiSU / APatch / Magisk |
| **系统版本** | Android 9.0 ~ Android 15+ |
| **CPU 架构** | ARM64 / ARM / x86_64 |

---

## ⚙️ 工作原理

环境检测工具（如春秋检测）会读取系统属性 `ro.secureboot.lockstate`，若该值非 `locked` 则判定证书链异常。

本模块通过调用 `resetprop` 将属性锁定为安全状态：
```bash
resetprop -n ro.secureboot.lockstate locked
```

并在模块管理器的生命周期（`customize.sh` 安装期、`service.sh` 开机期、`action.sh` 自检期）进行全周期维护。

---

## 🚀 安装与使用

1. 下载最新版模块文件 `LockstateFix-v1.0.0.zip`；
2. 打开手机上的 **KernelSU / SukiSU / Magisk / APatch** 管理器；
3. 进入「模块」页面，选择「从本地安装」并刷入该 ZIP 文件；
4. 刷入完成后即可直接打开检测应用测试，后续重启设备也会自动保持锁定。

---

## 🙏 致谢与参考

- 核心方案思路：酷安 [@JeTeeZnTmaxQwQ](https://www.coolapk.com/feed/73437573?s=MWM0NTlmY2MzNjYyOTBnNmE5NTkxZmF6a1651)
- 检测参考文档：[Chunqiu-Detector-Problem-solution](https://github.com/mingzun09/Chunqiu-Detector-Problem-solution)
- 构建辅助：Gemini 3.7 Flash

---

## 💬 交流与关注

- **开发者**: XIAN
- **交流 QQ 群**: 605389940
- **酷安主页**: [访问酷安 @XIAN](https://www.coolapk.com/u/3564176)
- **哔哩哔哩**: [访问 B 站个人空间](https://b23.tv/Zks8L7W)
- **抖音主页**: [访问抖音](https://v.douyin.com/oFVtoEuk6yQ/)

---

## 📄 License

本项目基于 [GPL-3.0 License](LICENSE) 开源。

