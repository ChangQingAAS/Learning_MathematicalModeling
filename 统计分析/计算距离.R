x <- c(1, 2, 6, 8, 11)
res <- dist(x, method = "euclidean", diag = FALSE, upper = FALSE, p = 2)
print(res)