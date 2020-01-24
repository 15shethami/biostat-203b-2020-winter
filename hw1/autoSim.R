# autoSim.R

for (arg in commandArgs(TRUE)) {
  eval(parse(text = arg))
}

nVals <- seq(100, 500, by=100)
distTypes <- c("gaussian", "t1", "t5")

for (dist in distTypes){
  for (n in nVals) {
    oFile <- paste("n", n, "_dist_", dist, ".txt", sep="")
    arg <- paste("n=", n, " dist=", shQuote(shQuote(dist)),
                " seed=", seed, " rep=", rep, sep="")
    sysCall <- paste("nohup Rscript runSim.R ", arg, " > ", oFile, sep="")
    system(sysCall)
    print(paste("sysCall=", sysCall, sep=""))
  }
}



