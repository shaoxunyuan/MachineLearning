# 生成 04-09 练习页配图（尽量只依赖 base R + MASS）
# 运行方式（建议在本脚本所在目录运行）：
#   setwd("docs/Practice"); source("gen_figures_04_09.R")
# 或命令行：
#   Rscript docs/Practice/gen_figures_04_09.R

options(repos = c(CRAN = "https://mirrors.tuna.tsinghua.edu.cn/CRAN/"))
if (!requireNamespace("MASS", quietly = TRUE)) install.packages("MASS")
library(MASS)

data(Melanoma)
mel <- as.data.frame(Melanoma)

fig_dir <- file.path(getwd(), "figures")
dir.create(fig_dir, showWarnings = FALSE, recursive = TRUE)

# ---------- 04：推断（箱线图） ----------
png(file.path(fig_dir, "p04-boxplot-thickness-ulcer.png"), width = 860, height = 520, res = 120, bg = "white")
par(mar = c(4, 4, 3, 1))
boxplot(thickness ~ factor(ulcer), data = mel,
        xlab = "ulcer (0/1)", ylab = "thickness",
        main = "thickness by ulcer",
        col = c("#93c5fd", "#bbf7d0"), border = "white")
grid(nx = NA, ny = NULL, col = "#eeeeee")
dev.off()

# ---------- 05：线性回归（散点+回归线 & 诊断图） ----------
png(file.path(fig_dir, "p05-scatter-fit1.png"), width = 860, height = 520, res = 120, bg = "white")
par(mar = c(4, 4, 3, 1))
plot(mel$age, mel$thickness,
     xlab = "age", ylab = "thickness",
     main = "thickness ~ age",
     pch = 19, col = rgb(13/255, 148/255, 136/255, 0.35))
abline(lm(thickness ~ age, data = mel), col = "#b91c1c", lwd = 2)
grid(nx = NA, ny = NULL, col = "#eeeeee")
dev.off()

fit2 <- lm(thickness ~ age + factor(sex) + ulcer + year, data = mel)
png(file.path(fig_dir, "p05-diagnostic-fit2.png"), width = 980, height = 760, res = 120, bg = "white")
par(mfrow = c(2, 2), mar = c(4, 4, 3, 1))
plot(fit2, which = 1:4)
par(mfrow = c(1, 1))
dev.off()

# ---------- 06：Logistic（预测概率分布） ----------
mel$death <- ifelse(mel$status == 1, 1, 0)
fit6 <- glm(death ~ age + thickness + ulcer + factor(sex), data = mel, family = binomial)
p <- predict(fit6, type = "response")
png(file.path(fig_dir, "p06-prob-hist.png"), width = 860, height = 520, res = 120, bg = "white")
par(mar = c(4, 4, 3, 1))
hist(p, breaks = 18, col = "#93c5fd", border = "white",
     main = "Predicted probability (glm binomial)", xlab = "p(death=1)")
lines(density(p), col = "#1d4ed8", lwd = 2)
abline(v = 0.5, col = "#b91c1c", lwd = 2, lty = 2)
legend("topright", legend = c("density", "thr=0.5"),
       col = c("#1d4ed8", "#b91c1c"), lwd = 2, lty = c(1, 2), bty = "n")
dev.off()

# ---------- 07：聚类与 PCA ----------
num_cols <- c("time", "age", "thickness", "ulcer", "year")
X <- mel[, num_cols]
Xz <- scale(X)
Xz <- Xz[complete.cases(Xz), , drop = FALSE]

set.seed(123)
wss <- sapply(1:8, function(k) kmeans(Xz, centers = k, nstart = 10)$tot.withinss)
png(file.path(fig_dir, "p07-elbow-wss.png"), width = 860, height = 520, res = 120, bg = "white")
par(mar = c(4, 4, 3, 1))
plot(1:8, wss, type = "b", xlab = "k", ylab = "WSS", main = "Elbow (WSS vs k)",
     pch = 19, col = "#0d9488")
grid(nx = NA, ny = NULL, col = "#eeeeee")
dev.off()

set.seed(123)
km3 <- kmeans(Xz, centers = 3, nstart = 25)
pc <- prcomp(Xz, center = TRUE, scale. = FALSE)
Z <- pc$x[, 1:2]
png(file.path(fig_dir, "p07-pca-k3.png"), width = 860, height = 560, res = 120, bg = "white")
par(mar = c(4, 4, 3, 1))
plot(Z, col = km3$cluster, pch = 19,
     xlab = "PC1", ylab = "PC2",
     main = "PC1-PC2 (colored by kmeans k=3)")
legend("topright", legend = sort(unique(km3$cluster)),
       col = sort(unique(km3$cluster)), pch = 19, bty = "n")
grid(nx = NA, ny = NULL, col = "#eeeeee")
dev.off()

# ---------- 08：关联规则（项目频率示意） ----------
items <- c("二甲双胍", "胰岛素", "血糖", "糖化血红蛋白",
           "ACEI", "利尿剂", "肌酐",
           "他汀", "血脂", "空腹血糖",
           "头孢", "布洛芬", "血常规",
           "阿司匹林", "血钾")

set.seed(42)
visit_n <- 30
prob <- c(0.35, 0.22, 0.28, 0.15, 0.22, 0.18, 0.14, 0.26, 0.30, 0.16, 0.20, 0.18, 0.32, 0.20, 0.14)

Xbin <- sapply(seq_along(items), function(j) rbinom(visit_n, 1, prob[j]))
colnames(Xbin) <- items
freq <- colMeans(Xbin)
ord <- order(freq, decreasing = TRUE)
top <- ord[1:12]

png(file.path(fig_dir, "p08-itemfreq.png"), width = 980, height = 520, res = 120, bg = "white")
par(mar = c(8, 4, 3, 1))
barplot(freq[top], las = 2, col = "#a7f3d0", border = NA,
        main = "Item frequency (relative, simulated)", ylab = "frequency")
grid(nx = NA, ny = NULL, col = "#eeeeee")
dev.off()

message("Figures saved to: ", normalizePath(fig_dir, mustWork = TRUE))

