# Medical Data Analysis & Data Mining Course

## 医学数据分析与数据挖掘课程

[![GitHub Pages](https://img.shields.io/badge/Course%20Website-Live-brightgreen?style=for-the-badge&logo=github)](https://shaoxunyuan.github.io/MedDataAnalysisMining/)

包含《医学数据分析与数据挖掘》课程的所有教学材料、代码和数据集。
课程旨在通过 R 语言教授学生如何处理、分析和挖掘医学数据（临床数据、高维医学数据、中药与方剂数据等）。

## 环境要求

建议安装最新版本的 [R](https://cran.r-project.org/) 和 [RStudio Desktop](https://posit.co/download/rstudio-desktop/)。

---

## 安装教程

### 一、安装 R 语言

R 是运行本课程代码的基础环境，需要先安装 R，再安装 RStudio。

#### Windows 系统

1. **下载 R**
   - 打开 [CRAN 官网](https://cran.r-project.org/)（或国内镜像如 [清华镜像](https://mirrors.tuna.tsinghua.edu.cn/CRAN/)）。
   - 点击左侧 **“Download R for Windows”**。
   - 点击 **“install R for the first time”**。
   - 下载 **`R-x.x.x-win.exe`**（例如 `R-4.4.2-win.exe`），这是 Windows 的安装程序。

2. **安装 R**
   - 双击 `R-x.x.x-win.exe` 运行安装程序。
   - 按提示选择语言、同意许可，安装路径可保持默认（如 `C:\Program Files\R\R-x.x.x`）。
   - 组件选择默认即可，一路 **“下一步”** 完成安装。

3. **启动 R**
   - 从开始菜单找到 **“R”** 或 **“R x.x.x”**，点击即可打开 R 控制台（黑色窗口）。
   - 课程中建议通过 RStudio 使用 R，不必单独打开 R 控制台。

---

#### macOS 系统

1. **下载 R**
   - 打开 [CRAN 官网](https://cran.r-project.org/)（或 [清华镜像](https://mirrors.tuna.tsinghua.edu.cn/CRAN/)）。
   - 点击左侧 **“Download R for (mac) OS”**。
   - 根据你的 Mac 芯片选择：
     - **Apple Silicon (M1/M2/M3)**：下载 **`R-x.x.x-arm64.pkg`**（或标注为 “for Apple Silicon” 的 .pkg 文件）。
     - **Intel 芯片**：下载 **`R-x.x.x-x86_64.pkg`**（或标注为 “for Intel” 的 .pkg 文件）。

2. **安装 R**
   - 双击下载的 **`.pkg`** 文件。
   - 按安装向导提示操作，同意许可、选择安装位置（默认即可），完成安装。

3. **启动 R**
   - 打开 **“终端”（Terminal）**，输入 `R` 回车，即可进入 R 控制台。
   - 课程中建议通过 RStudio 使用 R。

---

### 二、安装 RStudio Desktop

RStudio 是 R 的集成开发环境，写代码、运行脚本、看图、管理项目更方便。

#### Windows 系统

1. **下载 RStudio**
   - 打开 [RStudio 下载页](https://posit.co/download/rstudio-desktop/)。
   - 在 **“Installers”** 区域选择 **Windows**，下载 **`RStudio-xxxx.x.xxx-x.exe`**（例如 `RStudio-2024.09.0-548.exe`）。

2. **安装 RStudio**
   - 双击 **`.exe`** 安装程序。
   - 按提示下一步，安装路径可保持默认，完成安装。

3. **启动 RStudio**
   - 从开始菜单搜索 **“RStudio”** 并点击，或双击桌面/任务栏的 RStudio 图标。
   - 首次打开会看到 RStudio 窗口，可直接在控制台输入 R 代码，或 **File → New File → R Script** 新建脚本。

---

#### macOS 系统

1. **下载 RStudio**
   - 打开 [RStudio 下载页](https://posit.co/download/rstudio-desktop/)。
   - 在 **“Installers”** 区域选择 **macOS**，下载 **`.dmg`** 文件（例如 `RStudio-2024.09.0-548.dmg`）。

2. **安装 RStudio**
   - 双击 **`.dmg`** 打开磁盘映像。
   - 将 **RStudio** 图标拖到 **Applications（应用程序）** 文件夹中，完成安装。

3. **启动 RStudio**
   - 打开 **“启动台”** 或 **“应用程序”** 文件夹，点击 **RStudio** 图标。
   - 首次打开若提示“来自未识别的开发者”，可到 **系统设置 → 隐私与安全性** 中允许打开。

---

### 三、安装顺序与验证

| 步骤 | 说明 |
|------|------|
| 1 | 先安装 **R**，再安装 **RStudio**（RStudio 依赖本机已安装的 R）。 |
| 2 | 安装完成后，**先启动 RStudio**；RStudio 会自动找到已安装的 R。 |
| 3 | 在 RStudio 控制台输入 `R.version.string` 回车，若显示 R 版本号则说明环境正常。 |

若使用本仓库中的 R 脚本或 R Markdown，在 RStudio 中 **File → Open File** 打开对应文件即可运行。

---

## 任课教师

袁少勋
