# Shadowverse Automation

一个用于Shadowverse: Worlds Beyond游戏的自动化脚本工具，提供图形界面操作，支持多服务器配置、换牌策略选择和战斗自动化功能。

## 基础功能

Shadowverse Automation 提供以下核心功能：

- **设备连接**：通过ADB协议连接安卓模拟器或真实设备
- **多服务器支持**：完美适配国服与国际服游戏环境
- **智能战斗系统**：
  - 自动识别战斗场景与卡牌
  - 支持多种换牌策略选择
  - 自动执行攻击、拖拽和回合结束操作
- **实时监控**：显示当前回合、总运行时间、对战次数和总回合数
- **参数自定义**：可调整攻击延迟、拖拽延迟等操作参数
- **自动关闭**：设置挂机时长后自动结束程序
- **日志系统**：记录操作过程与异常信息

## 简易安装与使用

### 安装步骤
1. 下载并解压项目压缩包
2. 双击运行 `ShadowverseAutomation.exe` 启动程序

### 快速上手
1. 在设备连接区域选择服务器并输入ADB端口
2. 点击"开始"按钮连接设备
3. 在策略配置区域选择合适的换牌策略
4. 调整攻击延迟和拖拽延迟参数
5. 点击"恢复"按钮开始自动化流程

## 安装说明

### 环境要求
- Python 3.13+ 
- Windows 10/11 操作系统
- 安卓模拟器或真实设备（开启USB调试）

### 手动安装（高级用户）

1. 创建并激活虚拟环境
```powershell
python -m venv .venv
.venv\Scripts\activate
```

2. 安装依赖
```powershell
pip install -r requirements.txt
```

3. 运行应用
```powershell
python sv-auto.py
```

4. 生成可执行文件
```powershell
pyinstaller sv-auto.spec
```

## 开发者指南

### 打包与发布

1. 确保已完成环境配置和依赖安装
2. 执行打包命令生成可执行文件:
```powershell
pyinstaller sv-auto.spec
```
3. 打包完成后，可执行文件将位于`dist`目录下
4. 发布时需包含以下文件:
   - 可执行文件
   - Image/目录
   - assets/目录
   - 各模板目录(templates/, templates2/, etc.)

### 命令行安装与使用

#### 安装开发环境
```powershell
# 克隆仓库
git clone https://github.com/StarWishLXH/ShadowVerseWB-auto.git
cd ShadowVerseWB-auto

# 创建并激活虚拟环境
python -m venv .venv
.venv\Scripts\activate

# 安装依赖
pip install -r requirements.txt
```

## 使用方法

1. 启动应用程序后，在左侧设备连接区域：
   - 选择服务器（国服/国际服）
   - 输入ADB端口号
   - 点击"开始"按钮连接设备

2. 在策略配置区域：
   - 选择合适的换牌策略
   - 设置攻击延迟和拖拽延迟参数

3. 点击主控制区域的"恢复"按钮开始自动化流程

4. 监控区域将显示实时统计信息：
   - 当前回合数
   - 总运行时间
   - 对战次数
   - 总回合数

## KNOWN ISSUE

1. **字体警告**: 启动时可能出现"qt.qpa.fonts: Unable to enumerate family 'WenYue XinQingNianTi'"警告，不影响功能使用
2. **布局警告**: 部分环境可能出现"QLayout::addChildLayout: layout "" already has a parent"警告，已通过删除空布局修复
3. **ADB连接问题**: 部分模拟器需要手动配置端口映射或使用特定ADB版本
4. **分辨率适配**: 目前仅支持1080p分辨率的游戏窗口，其他分辨率可能导致识别错误

## TODO

1. 添加卡牌识别优化算法
2. 增加更多换牌策略模板
3. 添加多语言支持

## 重要更新

### ShadowverseAutomation-fix14(2025-07-05)
- 初始版本发布，包含基础战斗自动化功能
- 支持国服与国际服双服务器

### ShadowverseAutomation-fix20(2025-07-06)
- 修改UI

### ShadowverseAutomation-fix21(2025-07-30)
- 根据ranran佬重构UI排版
- 新增三种换牌策略
- 新增攻击延迟、拖拽延迟、扫描间隔设置
- 新增挂机时长设置

## 注意事项
- 使用前请确保已安装安卓模拟器并开启USB调试
- 不同电脑配置可能需要调整延迟参数以获得最佳效果
- 请勿过度使用自动化功能，以免影响游戏公平性(如被封禁，本脚本不负责)

## 许可证
本项目采用MIT许可证 - 详见LICENSE文件
