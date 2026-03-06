# Medical Data Analysis & Data Mining Course

## 医学数据分析与数据挖掘课程

[![GitHub Pages](https://img.shields.io/badge/Course%20Website-Live-brightgreen?style=for-the-badge&logo=github)](https://shaoxunyuan.github.io/MachineLearning/)

本仓库包含《医学数据分析与数据挖掘》课程的所有教学材料、代码和数据集。课程旨在通过 R 语言教授学生如何处理、分析和挖掘医学数据（临床数据、高维医学数据、中药与方剂数据等）。

## 环境要求

建议安装最新版本的 [R](https://cran.r-project.org/) 和 [RStudio Desktop](https://posit.co/download/rstudio-desktop/)。

核心依赖包:

```r
install.packages(c("tidyverse", "survival", "survminer", "arules", "arulesViz", "pheatmap", "ggpubr"))
# Bioconductor 包 (用于高维医学数据分析与富集)
if (!require("BiocManager", quietly = TRUE))
    install.packages("BiocManager")
BiocManager::install(c("limma", "edgeR", "clusterProfiler", "org.Hs.eg.db"))
```

## 任课教师

袁少勋
