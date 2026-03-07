# Medical Data Analysis & Data Mining Course

## 医学数据分析与数据挖掘课程

[![Course Website](https://img.shields.io/badge/课程网站-在线浏览-0d9488?style=for-the-badge&logo=github)](https://shaoxunyuan.github.io/MedDataAnalysisMining/)

**课程网站**（讲义） · **演示文稿**（reveal.js）：[点击进入](https://shaoxunyuan.github.io/MedDataAnalysisMining/demos/)

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

安装与验证流程：

```mermaid
flowchart LR
  A[安装 R] --> B[安装 RStudio]
  B --> C[启动 RStudio]
  C --> D[控制台输入 R.version.string]
  D --> E[看到版本号即正常]
```

| 步骤 | 说明 |
|------|------|
| 1 | 先安装 **R**，再安装 **RStudio**（RStudio 依赖本机已安装的 R）。 |
| 2 | 安装完成后，**先启动 RStudio**；RStudio 会自动找到已安装的 R。 |
| 3 | 在 RStudio 控制台输入 `R.version.string` 回车，若显示 R 版本号则说明环境正常。 |

若使用本仓库中的 R 脚本或 R Markdown，在 RStudio 中 **File → Open File** 打开对应文件即可运行。

如需在教程中加截图，可在仓库根目录下新建 `images/` 文件夹，放入截图后按下面方式引用（取消注释并改成你的文件名即可）：

<!-- 示例：![R 安装完成](images/install-r-windows.png) -->
<!-- 示例：![RStudio 界面](images/rstudio-first-open.png) -->
<!-- 示例：![新建项目](images/new-project.png) -->

---

## RStudio 项目：是什么 & 怎么用

### 项目是什么？

**RStudio 项目（Project）** 是一个“工作目录 + 配置”的集合，用来把一次分析相关的所有东西放在一起：

- **工作目录固定**：所有脚本、数据文件、结果都默认以项目文件夹为根目录，写路径更简单（如 `read.csv("data/xxx.csv")`）。
- **环境独立**：每个项目可以有独立的 R 环境、已加载的包和变量，关掉 RStudio 再打开项目会恢复工作区。
- **便于管理**：一个课程作业或一个课题用一个项目，文件夹清晰，也方便用 Git 做版本管理。

可以理解为：**一个项目 = 一个分析任务对应的文件夹 + RStudio 记住的设定**。

---

### 启动 RStudio 后如何新建项目？

1. **打开菜单**
   - 在 RStudio 顶部菜单栏点击 **File（文件）**。
   - 选择 **New Project…（新建项目）**。

2. **选择项目类型**
   - **New Directory（新目录）**：在电脑上新建一个空文件夹作为项目（最常用）。
   - **Existing Directory（现有目录）**：把已有的文件夹当作项目打开（例如本课程克隆下来的仓库文件夹）。
   - **Version Control（版本控制）**：从 Git 等拉取代码并作为项目打开。

3. **以“新目录”为例：创建全新项目**
   - 选 **New Directory** → **New Project**。
   - **Directory name**：填项目名称（如 `my_course_work`）。
   - **Create project as subdirectory of**：选一个父文件夹（如桌面或“文档”），项目会在这个路径下新建一个同名子文件夹。
   - 点击 **Create Project**，RStudio 会打开新项目（标题栏会显示项目名，右下角 **Files** 面板显示该文件夹）。

4. **之后在该项目里**
   - **File → New File → R Script** 可新建 R 脚本；保存时默认会存到项目目录下。
   - 数据文件建议放在项目下的 `data` 等子文件夹里，代码里用相对路径（如 `"data/xxx.csv"`）即可。

---

---

## 任课教师

袁少勋
