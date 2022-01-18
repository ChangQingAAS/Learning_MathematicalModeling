# 1.数据的中心化和标准化处理
x <- c(1, 2, 3, 4, 5, 6, 7, 8, 9)
res <- scale(x, center = TRUE, scale = TRUE)
print(res)
# x:样本数据矩阵，
# center=TRUE表示对数据作中心化变换，
# scale=TRUE表示对数据作标准化变换。

# 2.数据作极差标准化处理
x <- data.frame(
    points = c(99, 97, 104, 79, 84, 88, 91, 99),
    rebounds = c(34, 40, 41, 38, 29, 30, 22, 25),
    blocks = c(12, 8, 8, 7, 8, 11, 6, 7)
)
center <- sweep(x, 2, apply(x, 2, mean))
R <- apply(x, 2, max) - apply(x, 2, min)
x_star <- sweep(center, 2, R, "/")
print("----------------------------------------")
print(x_star)
# 若x_star<-sweep(center, 2, sd(x), "/"), 则得到（普通）标准化变换后的数据