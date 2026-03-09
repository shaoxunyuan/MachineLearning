# 生成 02 讲义中的箱线图并保存到 figures/
# 运行方式：在 R 或 RStudio 中 source("gen_figures.R")，或命令行：Rscript gen_figures.R

options(repos = c(CRAN = "https://mirrors.tuna.tsinghua.edu.cn/CRAN/"))
if (!requireNamespace("MASS", quietly = TRUE)) install.packages("MASS")
if (!requireNamespace("dplyr", quietly = TRUE)) install.packages("dplyr")

library(MASS)
library(dplyr)

# 创建 figures 目录（请在本脚本所在目录运行，如：setwd("docs/02") 后 source("gen_figures.R")）
fig_dir <- file.path(getwd(), "figures")
dir.create(fig_dir, showWarnings = FALSE, recursive = TRUE)

# ---------- 构造脏数据（与讲义一致） ----------
Melanoma_dirty <- as.data.frame(Melanoma)
n <- nrow(Melanoma_dirty)
set.seed(123)
Melanoma_dirty$age[sample(n, 8)] <- NA
Melanoma_dirty$thickness[sample(n, 6)] <- NA
Melanoma_dirty$age[3] <- -1
Melanoma_dirty$age[10] <- 200
Melanoma_dirty$thickness[5] <- 999
dup_rows <- Melanoma_dirty[c(1, 1, 15, 15, 15), ]
Melanoma_dirty <- rbind(Melanoma_dirty, dup_rows)
Melanoma_dirty$sex <- as.character(Melanoma_dirty$sex)
Melanoma_dirty$sex[Melanoma_dirty$sex == "0"] <- "女"
Melanoma_dirty$sex[Melanoma_dirty$sex == "1"] <- "男"
Melanoma_dirty$sex[sample(which(Melanoma_dirty$sex == "男"), 3)] <- "1"
Melanoma_dirty$sex[sample(which(Melanoma_dirty$sex == "女"), 2)] <- "0"

# ---------- 清洗到 clean_outlier（与讲义一致） ----------
clean_missing <- as.data.frame(Melanoma_dirty)
clean_missing$age[is.na(clean_missing$age)] <- median(clean_missing$age, na.rm = TRUE)
clean_missing$thickness[is.na(clean_missing$thickness)] <- median(clean_missing$thickness, na.rm = TRUE)
d <- as.data.frame(clean_missing)
d$age[d$age < 0 | d$age > 120] <- NA
d$thickness[d$thickness > 50] <- NA
th <- d$thickness[!is.na(d$thickness)]
q1 <- quantile(th, 0.25); q3 <- quantile(th, 0.75); iqr <- q3 - q1
out_iqr <- (d$thickness < (q1 - 1.5*iqr)) | (d$thickness > (q3 + 1.5*iqr))
d$thickness[out_iqr & !is.na(d$thickness)] <- NA
clean_outlier <- d

# ---------- 图1：age 箱线图 ----------
png(file.path(fig_dir, "boxplot-age.png"), width = 480, height = 360, res = 120, bg = "white")
par(mar = c(4, 4, 3, 2))
boxplot(Melanoma_dirty$age, main = "age 箱线图", ylab = "age")
dev.off()

# ---------- 图2：thickness 箱线图 ----------
png(file.path(fig_dir, "boxplot-thickness.png"), width = 480, height = 360, res = 120, bg = "white")
par(mar = c(4, 4, 3, 2))
boxplot(Melanoma_dirty$thickness, main = "thickness 箱线图", ylab = "thickness")
dev.off()

# ---------- 图3：异常值处理后的分布 ----------
png(file.path(fig_dir, "boxplot-after-clean.png"), width = 560, height = 360, res = 120, bg = "white")
par(mar = c(4, 4, 3, 2))
boxplot(clean_outlier$age, clean_outlier$thickness, names = c("age", "thickness"), main = "异常值处理后的分布")
dev.off()

message("Figures saved to: ", normalizePath(fig_dir, mustWork = TRUE))
