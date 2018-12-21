strp1 <- "http://www2.census.gov/acs2009_5yr/summaryfile/"
strp2 <- "2005-2009_ACSSF_By_State_By_Sequence_Table_Subset/"
strp3 <- Sys.getenv("StateStr2")
strp4 <- "/Tracts_Block_Groups_Only/"

floc <- paste(strp1,strp2,strp3,strp4,sep="")

fnp1 <- "20095"
fnp2 <- Sys.getenv("StateStr")
fnp3 <- "0011000.zip"
 
fnm <- paste(fnp1,fnp2,fnp3,sep="")

download.file(paste(floc,fnm,sep=""),fnm)
unzip(fnm)

##READ IN DATA

##e20095mn0011000.txt

tfnp1 <- "e20095"
tfnp2 <- Sys.getenv("StateStr")
tfnp3 <- "0011000.txt"

textfile <- paste(tfnp1,tfnp2,tfnp3,sep="")

testdata <- read.csv(textfile,header = F)

##Sys.setenv(StateStr="mn")

testdata.filt <-(testdata[,c(6,192)])
colnames(testdata.filt) <- c("logrecno","pop")

##m20095mn0011000.txt

tfnp1 <- "m20095"
tfnp2 <- Sys.getenv("StateStr")
tfnp3 <- "0011000.txt"

textfile <- paste(tfnp1,tfnp2,tfnp3,sep="")

testdata.err <- read.csv(textfile,header = F)

##Sys.setenv(StateStr="mn")

testdata.err.filt <-(testdata.err[,c(6,192)])
colnames(testdata.err.filt) <- c("logrecno","poperr")

acspop <- merge(testdata.filt,testdata.err.filt)

summary(acspop)

save.image()
