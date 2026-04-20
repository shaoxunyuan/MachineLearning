# 生成 03 数据集成与变换练习的配图（基于 MASS::Melanoma）
# 运行方式（建议在本脚本所在目录运行）：
#   setwd("docs/Practice"); source("gen_figures_03.R")
# 或命令行：
#   Rscript docs/Practice/gen_figures_03.R

options(repos = c(CRAN = "https://mirrors.tuna.tsinghua.edu.cn/CRAN/"))
if (!requireNamespace("MASS", quietly = TRUE)) install.packages("MASS")
library(MASS)

data(Melanoma)
mel <- as.data.frame(Melanoma)

fig_dir <- file.path(getwd(), "figures")
dir.create(fig_dir, showWarnings = FALSE, recursive = TRUE)

# ---------- 图1：thickness 原始 vs log1p ----------
png(file.path(fig_dir, "transform-log-thickness.png"), width = 980, height = 380, res = 120, bg = "white")
par(mar = c(4, 4, 3, 1))
par(mfrow = c(1, 2))

th <- mel$thickness[!is.na(mel$thickness)]
hist(th, breaks = 20, col = "#93c5fd", border = "white",
     main = "thickness (raw)", xlab = "thickness")
lines(density(th), col = "#1d4ed8", lwd = 2)

lt <- log1p(th)
hist(lt, breaks = 20, col = "#bbf7d0", border = "white",
     main = "log1p(thickness)", xlab = "log1p(thickness)")
lines(density(lt), col = "#15803d", lwd = 2)
dev.off()

# ---------- 图2：age 原始 vs Z-score ----------
png(file.path(fig_dir, "transform-zscore-age.png"), width = 980, height = 380, res = 120, bg = "white")
par(mar = c(4, 4, 3, 1))
par(mfrow = c(1, 2))

ag <- mel$age[!is.na(mel$age)]
hist(ag, breaks = 18, col = "#fde68a", border = "white",
     main = "age (raw)", xlab = "age")
lines(density(ag), col = "#b45309", lwd = 2)

age_z <- as.numeric(scale(ag))
hist(age_z, breaks = 18, col = "#fecaca", border = "white",
     main = "age (Z-score)", xlab = "age_z")
lines(density(age_z), col = "#b91c1c", lwd = 2)
dev.off()

# ---------- 图3：分箱后的频数（age_grp） ----------
png(file.path(fig_dir, "transform-binning-age.png"), width = 720, height = 360, res = 120, bg = "white")
par(mar = c(4, 4, 3, 1))
age_grp <- cut(
  ag,
  breaks = c(0, 40, 60, 100),
  labels = c("<40", "40-60", ">60"),
  include.lowest = TRUE
)
tab <- table(age_grp)
barplot(tab, col = "#a7f3d0", border = NA,
        main = "age bins (counts)", ylab = "n", xlab = "age_grp")
dev.off()

message("Figures saved to: ", normalizePath(fig_dir, mustWork = TRUE))

