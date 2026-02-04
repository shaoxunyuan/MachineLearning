# Medical Data Mining & Bioinformatics Course

## 医学数据挖掘与生物信息学课程

[![GitHub Pages](https://img.shields.io/badge/Course%20Website-Live-brightgreen?style=for-the-badge&logo=github)](https://shaoxunyuan.github.io/MachineLearning/)

本仓库包含《医学数据挖掘与生物信息学》课程的所有教学材料、代码和数据集。课程旨在通过 R 语言教授学生如何处理、分析和挖掘医学数据（临床数据、组学数据、中药与方剂数据）。

## 课程安排 (Syllabus)

本课程共 14 周，结合理论讲授与机房实验。

| 序号 | 周次 | 内容 | 类型 |
| :--- | :--- | :--- | :--- |
| 1 | 1 | **R语言基础与医学应用** | 理论 |
| 2 | 2 | **质量评估与数据清洗** | 理论 |
| 3 | 3 | **医学统计建模实战** | 理论 |
| 4 | 4 | **关联规则与配伍挖掘** | 理论 |
| 5 | 5 | **差异分析与功能富集** | 理论 |
| 6 | 6 | [实验] **R语言医学数据操作入门** | 实验 |
| 7 | 7 | [实验] **数据质量评估可视化** | 实验 |
| 8 | 8 | [实验] **数据清洗与 Batch 处理实战** | 实验 |
| 9 | 9 | [实验] **Logistic 回归：构建疾病诊断模型** | 实验 |
| 10 | 10 | [实验] **模型评估与预测可视化** | 实验 |
| 11 | 11 | [实验] **关联规则实战：中药配伍规律** | 实验 |
| 12 | 12 | [实验] **医学差异特征筛选** | 实验 |
| 13 | 13 | [实验] **差异结果可视化** | 实验 |
| 14 | 14 | [实验] **功能富集分析实战** | 实验 |

## 目录结构

- `lectures/`: 理论课课件与参考代码 (Weeks 1-5)
- `labs/`: 实验课 R Markdown 练习文件 (Weeks 6-14)
- `data/`: 课程所需数据集
  - `clinical/`: 模拟电子病例数据
  - `tcm/`: 中药处方数据
  - `omics/`: 基因表达矩阵与分组信息
- `R/`: 辅助 R 函数

## 环境要求

建议安装最新版本的 [R](https://cran.r-project.org/) 和 [RStudio Desktop](https://posit.co/download/rstudio-desktop/)。

核心依赖包:

```r
install.packages(c("tidyverse", "survival", "survminer", "arules", "arulesViz", "pheatmap", "ggpubr"))
# Bioconductor 包 (用于生信分析)
if (!require("BiocManager", quietly = TRUE))
    install.packages("BiocManager")
BiocManager::install(c("limma", "edgeR", "clusterProfiler", "org.Hs.eg.db"))
```

## 任课教师

袁少勋
