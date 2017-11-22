library("energy");
p_value <- 0.01;
libs <- c("Hmisc");
lapply(libs, require, character.only=T);

input <- function(inputfile) {
  pc <<- read.csv(inputfile, header = TRUE);
}



run <- function() {
  cn <<- colnames(pc);
  cn <<- cn[2:length(cn)];
  pc <<- pc[,-1];
  pc <<- apply(pc, 1, as.numeric);
  pc <<- t(pc);
  correlations <- matrix(, nrow=ncol(pc), ncol=ncol(pc));
  pvalues <- matrix(, nrow=ncol(pc), ncol=ncol(pc));
  for (i in 1:ncol(pc)) {
     for (j in 1:ncol(pc)) {
        dcov = dcov.test(x=pc[,i], y=pc[,j], index=1.0, R=199)
        correlations[i, j] <- dcov$estimates[2]
        pvalues[i, j] <- dcov$p.value
        if (pvalues[i, j] < p_value) correlations[i, j] <- 0
        #correlations[i, j] <- dcor(x=pc[,i], y=pc[,j], index=1.0)
     }
  }
  #print(correlations);
  pc <<- as.matrix(correlations);
  #pc <<- as.matrix(correlations$r);
  pc[is.na(pc)] <<- 0;
  empty <- c("");
  #pc[which(correlations$P>p_value)] <<- 0;
}

output <- function(outputfile) {
   write.table(pc, file=outputfile, sep=",", append=FALSE, row.names=unlist(cn), col.names=unlist(cn), na="");
}


