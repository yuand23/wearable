mag <- read.csv("mag.csv",header=T,stringsAsFactors = F)
grava <- read.csv("grava.csv",header=T,stringsAsFactors = F)
angv <- read.csv("angv.csv",header=T,stringsAsFactors = F)
pres <- read.csv("pressure.csv",header=T,stringsAsFactors = F)

mag$deviceId <- NULL
grava$deviceId <- NULL
angv$deviceId <- NULL
pres$deviceId <- NULL

library(dplyr)

colnames(angv) <- c("time","x","y","z")
colnames(mag) <- c("time","x","y","z")
colnames(grava) <- c("time","x","y","z")
colnames(pres) <- c("time","pressure")

rownames(mag) <- 1:nrow(mag)
rownames(angv) <- 1:nrow(angv)
rownames(grava) <- 1:nrow(grava)
rownames(pres) <- 1:nrow(pres)

library(sqldf)

mag <- sqldf("SELECT * FROM mag WHERE time >= '2017-07-03 17:00:53:900' AND time <= '2017-07-03 17:43:41:200' ORDER BY time ASC",row.names=T)
grava <- sqldf("SELECT * FROM grava WHERE time >= '2017-07-03 17:00:53:900' AND time <= '2017-07-03 17:43:41:200' ORDER BY time ASC",row.names=T)
angv<- sqldf("SELECT * FROM angv WHERE time >= '2017-07-03 17:00:53:900' AND time <= '2017-07-03 17:43:41:200' ORDER BY time ASC",row.names=T)
pres <- sqldf("SELECT * FROM pres WHERE time >= '2017-07-03 17:00:53:900' AND time <= '2017-07-03 17:43:41:200' ORDER BY time ASC",row.names=T)


for(i in 1:length(mag$time)){
  mag$time[i] <- sub('\\:([0-9]+)$','.\\1',mag$time[i])
}
for(i in 1:length(grava$time)){
  grava$time[i] <- sub('\\:([0-9]+)$','.\\1',grava$time[i])
}
for(i in 1:length(angv$time)){
  angv$time[i] <- sub('\\:([0-9]+)$','.\\1',angv$time[i])
}
for(i in 1:length(pres$time)){
  pres$time[i] <- sub('\\:([0-9]+)$','.\\1',pres$time[i])
}

mag$time <- format(as.POSIXct(mag$time) ,format = "%H:%M:%OS3")
mag <- mag[!duplicated(mag),]
grava$time <- format(as.POSIXct(grava$time) ,format = "%H:%M:%OS3")
grava <- grava[!duplicated(grava),]
angv$time <- format(as.POSIXct(angv$time) ,format = "%H:%M:%OS3")
angv <- angv[!duplicated(angv),]
pres$time <- format(as.POSIXct(pres$time), format = "%H:%M:%OS3")
pres <- pres[!duplicated(pres),]


nf <- function(df) {
  n <- norm(df,"2")
  n <- round(n,2)
  return (n)
}

mag$norm  <- apply(mag[c("x","y","z")],1,nf)
angv$norm  <- apply(angv[c("x","y","z")],1,nf)
#y-1000
#grava$y <- grava$y-1000
grava$norm  <- apply(grava[c("x","y","z")],1,nf)


mag <- sqldf("SELECT * FROM mag WHERE (time >= '10:46:12.299' AND time <= '10:50:51.099') OR (time >= '10:52:00.599' AND time <= '10:57:09.599') OR (time >= '10:58:25.099' AND time <= '11:03:05.700') OR (time >= '11:03:53.500' AND time <= '11:11:30.000') ORDER BY time ASC",row.names=T)
angv <- sqldf("SELECT * FROM angv WHERE (time >= '10:46:12.299' AND time <= '10:50:51.099') OR (time >= '10:52:00.599' AND time <= '10:57:09.599') OR (time >= '10:58:25.099' AND time <= '11:03:05.700') OR (time >= '11:03:53.500' AND time <= '11:11:30.000') ORDER BY time ASC",row.names=T)
grava <- sqldf("SELECT * FROM grava WHERE (time >= '10:46:12.299' AND time <= '10:50:51.099') OR (time >= '10:52:00.599' AND time <= '10:57:09.599') OR (time >= '10:58:25.099' AND time <= '11:03:05.700') OR (time >= '11:03:53.500' AND time <= '11:11:30.000') ORDER BY time ASC",row.names=T)
angv <- angv[which(angv$norm < 7000),]

mag_b7 <- sqldf("SELECT * FROM mag_b7 WHERE (time >= '10:46:12.299' AND time <= '10:50:51.099') OR (time >= '10:52:00.599' AND time <= '10:57:09.599') OR (time >= '10:58:25.099' AND time <= '11:03:05.700') OR (time >= '11:03:53.500' AND time <= '11:11:30.000') ORDER BY time ASC",row.names=T)
angv_b7 <- sqldf("SELECT * FROM angv_b7 WHERE (time >= '10:46:12.299' AND time <= '10:50:51.099') OR (time >= '10:52:00.599' AND time <= '10:57:09.599') OR (time >= '10:58:25.099' AND time <= '11:03:05.700') OR (time >= '11:03:53.500' AND time <= '11:11:30.000') ORDER BY time ASC",row.names=T)
grava_b7 <- sqldf("SELECT * FROM grava_b7 WHERE (time >= '10:46:12.299' AND time <= '10:50:51.099') OR (time >= '10:52:00.599' AND time <= '10:57:09.599') OR (time >= '10:58:25.099' AND time <= '11:03:05.700') OR (time >= '11:03:53.500' AND time <= '11:11:30.000') ORDER BY time ASC",row.names=T)
angv_b7 <- angv_b7[which(angv_b7$norm < 7000),]

write.csv(mag,'mag_clean.csv',row.names=F, na="", quote=F)
write.csv(angv,'angv_clean.csv',row.names=F, na="", quote=F)
write.csv(grava,'grava_clean.csv',row.names=F, na="", quote=F)
write.csv(pres,'pres_clean.csv',row.names=F, na="", quote=F)

write.csv(mag_b7,'mag_b7_clean.csv',row.names=F, na="", quote=F)
write.csv(angv_b7,'angv_b7_clean.csv',row.names=F, na="", quote=F)
write.csv(grava_b7,'grava_b7_clean.csv',row.names=F, na="", quote=F)
write.csv(pres_b7,'pres_b7_clean.csv',row.names=F, na="", quote=F)
