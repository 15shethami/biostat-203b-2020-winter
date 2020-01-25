# autoSim.R

## Parsing command arguments
for (arg in commandArgs(TRUE)) {
  eval(parse(text = arg))
}

## Combinations of sample size and distribution
nVals <- seq(100, 500, by = 100)
distTypes <- c("gaussian", "t1", "t5")

## Create files from the runSim.R output
for (dist in distTypes) {
  for (n in nVals) {
    oFile <- paste("n", n, "_dist_", dist, ".txt", sep = "")
    arg <- paste("n=", n, " dist=", shQuote(shQuote(dist)),
      " seed=", seed, " rep=", rep,
      sep = ""
    )
    sysCall <- paste("nohup Rscript runSim.R ", arg, " > ", oFile, sep = "")
    system(sysCall)
    print(paste("sysCall=", sysCall, sep = ""))
  }
}
