library(SCENIC)
library(GENIE3)
library(RcisTarget)
library(AUCell)
library(tidyverse, warn.conflicts = FALSE)

set.seed(123)

exp_matrix <- exp_matrix_backup
#exp_data <- matrix('GSE60361_series_matrix.txt')
#write.table(exp_data$exp_data,file="GSE60361_series_matrix.txt",sep="\t", quote=F,append=F)

#exp_data <- read.csv('GSE60361_series_matrix.txt', sep='\t')
exp_matrix <- read.csv('GSE60361_C1-3005-Expression.txt', sep='\t', row.names = 1)

exp_matrix_backup <- exp_matrix
exp_matrix <- as.matrix(exp_matrix)

cell_samples <- colnames(exp_matrix)
transcripts <- rownames(exp_matrix)


colnames(exp_matrix) <- cell_samples
rownames(exp_matrix) <- transcripts

nCellsPerGene <- apply(exp_matrix, 1, function(x) sum(x>0))
nCountsPerGene <- apply(exp_matrix, 1, sum)


exprMatr <- matrix(sample(1:10, 100, replace=TRUE), nrow=20)
rownames(exprMatr) <- paste("Gene", 1:20, sep="")
colnames(exprMatr) <- paste("Sample", 1:5, sep="")
head(exprMatr)

weightMat <- GENIE3(exp_matrix)
