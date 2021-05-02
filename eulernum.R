nsamples <- 5000          # Number of sample
nexper <- 1000            # Number of experiments per sample
vmeans <- c()             # Vector to store the mean of each experiment
for (j in 1:nsamples){    # Iterate nsamples times
  vnums <- c()            
  for (i in 1:nexper){
    nterm <- 1
    rand_vector <- runif(100,0,1)       # We pick 100 random numbers
    while(sum(rand_vector[1:nterm])<=1) # Sum until result is bigger than 1
      nterm <- nterm + 1               
    vnums <- c(vnums,nterm)             # Store the number of terms
  }
vmeans <- c(vmeans,mean(vnums))         # Store the experiment average
}
hist(vmeans,main = sprintf("Samples: %d  Mean: %.8f  |Mean-e|: %.8f",
                           nsamples,mean(vmeans),abs(mean(vmeans)-exp(1))))