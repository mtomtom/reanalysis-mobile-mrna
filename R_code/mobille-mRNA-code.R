
# generate data for Suppl. Figure S1

# Compute the probability of more than nmin reads occurring by chance for 
# a range of read-depth (from Nstart to Nstop) and for different 
# error rates, here from 0.0001 to 0.0016
# for n>=4 use nmin=3, eg mobilemRNAs(3,100,10000,100)
mobilemRNAs<-function(nmin,Nstart,Nstop,Nincr){
  for (N in seq(Nstart,Nstop,Nincr)) { 
    temp<-c(N,1.0-pbinom(nmin,N,0.0016), 1.0-pbinom(nmin,N,0.0008),1.0-pbinom(nmin,N,0.0004),1.0-pbinom(nmin,N,0.0002),1.0-pbinom(nmin,N,0.0001)) 
    print(temp)
  }
}

# Data for Suppl Figure S1 Plot 1
sink("random-mobile.data")
mobilemRNAs(3,100,10000,100)
sink()

# Replicates
# Compute the probability of more than nmin reads occurring by chance for 
# a range of read-depth (from Nstart to Nstop) and for different 
# error rates, here from 0.0001 to 0.0016
# for multiple replicates, requiring replmin out of repl
# for n>=2 use nmin=1
# replMobilemRNAs(1,1,3,100,1000,100)
replMobilemRNAs<-function(nmin,replmin,repl,Nstart,Nstop,Nincr){
  for (N in seq(Nstart,Nstop,Nincr)) { 
    a1<-pbinom(replmin,repl,pbinom(nmin,N,0.0016,lower.tail = FALSE),lower.tail = FALSE)
    a2<-pbinom(replmin,repl,pbinom(nmin,N,0.0008,lower.tail = FALSE),lower.tail = FALSE)
    a3<-pbinom(replmin,repl,pbinom(nmin,N,0.0004,lower.tail = FALSE),lower.tail = FALSE)
    a4<-pbinom(replmin,repl,pbinom(nmin,N,0.0002,lower.tail = FALSE),lower.tail = FALSE)
    a5<-pbinom(replmin,repl,pbinom(nmin,N,0.0001,lower.tail = FALSE),lower.tail = FALSE)
    # temp<-c(N,1.0-pbinom(nmin,N,0.0016), 1.0-pbinom(nmin,N,0.0008),1.0-pbinom(nmin,N,0.0004),1.0-pbinom(nmin,N,0.0002),1.0-pbinom(nmin,N,0.0001)) 
    temp<-c(N,a1,a2,a3,a4,a5)
    print(temp)
  }
}

# Data for Suppl Figure S1 Plot 2
sink("random-mobile-repl.data")
replMobilemRNAs(1,1,3,100,10000,100)
sink()

# Two co-curring SNPs
# Compute the probability of more than nmin reads occurring by chance for 
# a range of read-depth (from Nstart to Nstop) and for different 
# error rates, here from 0.0001 to 0.0016
# for multiple replicates, requiring replmin out of repl
# for n>=2 use nmin=1
# corrMobilemRNAs(1,1,3,100,1000,100)
corrMobilemRNAs<-function(nmin,Nstart,Nstop,Nincr){
  for (N in seq(Nstart,Nstop,Nincr)) { 
    a1<-pbinom(nmin,N,0.0016^2,lower.tail = FALSE)
    a2<-pbinom(nmin,N,0.0008^2,lower.tail = FALSE)
    a3<-pbinom(nmin,N,0.0004^2,lower.tail = FALSE)
    a4<-pbinom(nmin,N,0.0002^2,lower.tail = FALSE)
    a5<-pbinom(nmin,N,0.0001^2,lower.tail = FALSE)
    temp<-c(N,a1,a2,a3,a4,a5)   
    print(temp)
  }
}

# Data for Suppl Figure S1 Plot 3
sink("random-mobile-corr.data")
corrMobilemRNAs(0,100,10000,100)
sink()

