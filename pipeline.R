library(SCENIC)
library(GENIE3)
library(RcisTarget)
library(AUCell)
library(tidyverse, warn.conflicts = FALSE)

set.seed(123)

exp_matrix <- read.csv('GSE60361_C1-3005-Expression.txt', sep='\t')[-c(1261, 4665),]

rownames(exp_matrix) <- exp_matrix[,1]
exp_matrix[,1] <- NULL

transcripts <- exp_matrix[,1]
cell_samples <- colnames(exp_matrix[2:ncol(exp_matrix)])


exp_matrix_data <- as.matrix(exp_matrix)


exp_matrix_backup <- exp_matrix
exp_matrix <- as.matrix(exp_matrix)

cell_samples <- colnames(exp_matrix)
transcripts <- rownames(exp_matrix)


#colnames(exp_matrix) <- cell_samples
#rownames(exp_matrix) <- transcripts


weightMat <- GENIE3(exp_matrix_data)
