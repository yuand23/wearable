angv$smoothx <- smooth(angv$x)
angv$smoothy <- smooth(angv$y)
angv$smoothz <- smooth(angv$z)

dev.new()
par(mfrow=c(2,1))
par(mar=c(2,2,2,2))
plot(as.factor(angv$time),angv$x,ylim=c(-5000,5000))
title("angv")
lines(as.factor(angv$time),angv$x,col="black")
lines(as.factor(angv$time),angv$y,col="red")
lines(as.factor(angv$time),angv$z,col="blue")
grid(nx=20)
plot(as.factor(angv$time),angv$smoothx,ylim=c(-5000,5000))
title("angv")
lines(as.factor(angv$time),angv$smoothx,col="black")
lines(as.factor(angv$time),angv$smoothy,col="red")
lines(as.factor(angv$time),angv$smoothz,col="blue")
grid(nx=20)

#######################################################
# check mean and std plot
mag <- read.csv("mag_b7_analysis.csv",header=T,stringsAsFactors = F)
angv <- read.csv("angv_b7_analysis.csv",header=T,stringsAsFactors = F)
grava <- read.csv("grava_b7_analysis.csv",header=T,stringsAsFactors = F)

mag <- read.csv("mag_9f_analysis.csv",header=T,stringsAsFactors = F)
angv <- read.csv("angv_9f_analysis.csv",header=T,stringsAsFactors = F)
grava <- read.csv("grava_9f_analysis.csv",header=T,stringsAsFactors = F)

mag <- mag[!is.na(mag$xmean),]
angv <- angv[!is.na(angv$xmean),]
grava <- grava[!is.na(grava$xmean),]

library(sqldf)

angv <- sqldf("SELECT time,xmean,ymean,zmean,norm_mean,xstd,ystd,zstd,norm_std FROM angv ORDER BY time ASC",row.names=T)
grava <- sqldf("SELECT time,xmean,ymean,zmean,norm_mean,xstd,ystd,zstd,norm_std FROM grava ORDER BY time ASC",row.names=T)

ana_all <- merge(angv,grava,by="time")

ana_all$time <- NULL

colnames(ana_all) <- c("angv_meanx","angv_meany","angv_meanz","angv_meannorm","angv_stdx","angv_stdy","angv_stdz","angv_stdnorm",
                       "grava_meanx","grava_meany","grava_meanz","grava_meannorm","grava_stdx","grava_stdy","grava_stdz","grava_stdnorm")

#add type column type=2 for walk
ana_all$type <- rep(2,nrow(ana_all))

write.csv(ana_all,'train2_5.csv',row.names=F, na="", quote=F)
write.csv(ana_all,'train2_6.csv',row.names=F, na="", quote=F)

#--------------------------------------
dev.new()
par(mfrow=c(3,2))
par(mar=c(2,2,2,2))

plot(as.factor(mag$time),mag$x,ylim=c(-200,200))
title("mag")
lines(as.factor(mag$time),mag$x,col="black")
lines(as.factor(mag$time),mag$y,col="red")
lines(as.factor(mag$time),mag$z,col="blue")
grid(nx=20)
plot(as.factor(mag$time),mag$norm,ylim=c(0,300))
title("norm mag")
lines(as.factor(mag$time),mag$norm,col="black")
grid(nx=20)

plot(as.factor(mag$time),mag$xmean,ylim=c(-200,200))
title("mag mean")
lines(as.factor(mag$time),mag$xmean,col="black")
lines(as.factor(mag$time),mag$ymean,col="red")
lines(as.factor(mag$time),mag$zmean,col="blue")
grid(nx=20)
plot(as.factor(mag$time),mag$norm_mean,ylim=c(0,300))
title("norm mag mean")
lines(as.factor(mag$time),mag$norm_mean,col="black")
grid(nx=20)

plot(as.factor(mag$time),mag$xstd,ylim=c(-200,200))
title("mag std")
lines(as.factor(mag$time),mag$xstd,col="black")
lines(as.factor(mag$time),mag$ystd,col="red")
lines(as.factor(mag$time),mag$zstd,col="blue")
grid(nx=20)
plot(as.factor(mag$time),mag$norm_std,ylim=c(0,300))
title("norm mag std")
lines(as.factor(mag$time),mag$norm_std,col="black")
grid(nx=20)

# plot angv
dev.new()
par(mfrow=c(3,2))
par(mar=c(2,2,2,2))

plot(as.factor(angv$time),angv$x,ylim=c(-2000,2000))
title("angv")
lines(as.factor(angv$time),angv$x,col="black")
lines(as.factor(angv$time),angv$y,col="red")
lines(as.factor(angv$time),angv$z,col="blue")
grid(nx=20)
plot(as.factor(angv$time),angv$norm,ylim=c(0,3000))
title("norm angv")
lines(as.factor(angv$time),angv$norm,col="black")
grid(nx=20)

plot(as.factor(angv$time),angv$xmean,ylim=c(-2000,2000))
title("angv mean")
lines(as.factor(angv$time),angv$xmean,col="black")
lines(as.factor(angv$time),angv$ymean,col="red")
lines(as.factor(angv$time),angv$zmean,col="blue")
grid(nx=20)
plot(as.factor(angv$time),angv$norm_mean,ylim=c(0,3000))
title("norm angv mean")
lines(as.factor(angv$time),angv$norm_mean,col="black")
grid(nx=20)

plot(as.factor(angv$time),angv$xstd,ylim=c(-2000,2000))
title("angv std")
lines(as.factor(angv$time),angv$xstd,col="black")
lines(as.factor(angv$time),angv$ystd,col="red")
lines(as.factor(angv$time),angv$zstd,col="blue")
grid(nx=20)
plot(as.factor(angv$time),angv$norm_std,ylim=c(0,3000))
title("norm angv std")
lines(as.factor(angv$time),angv$norm_std,col="black")
grid(nx=20)

#plot grava
dev.new()
par(mfrow=c(3,2))
par(mar=c(2,2,2,2))

plot(as.factor(grava$time),grava$x,ylim=c(-2000,2000))
title("grava")
lines(as.factor(grava$time),grava$x,col="black")
lines(as.factor(grava$time),grava$y,col="red")
lines(as.factor(grava$time),grava$z,col="blue")
grid(nx=20)
plot(as.factor(grava$time),grava$norm,ylim=c(0,2000))
title("norm grava")
lines(as.factor(grava$time),grava$norm,col="black")
grid(nx=20)

plot(as.factor(grava$time),grava$xmean,ylim=c(-2000,2000))
title("grava mean")
lines(as.factor(grava$time),grava$xmean,col="black")
lines(as.factor(grava$time),grava$ymean,col="red")
lines(as.factor(grava$time),grava$zmean,col="blue")
grid(nx=20)
plot(as.factor(grava$time),grava$norm_mean,ylim=c(0,3000))
title("norm grava mean")
lines(as.factor(grava$time),grava$norm_mean,col="black")
grid(nx=20)

plot(as.factor(grava$time),grava$xstd,ylim=c(-2000,2000))
title("grava std")
lines(as.factor(grava$time),grava$xstd,col="black")
lines(as.factor(grava$time),grava$ystd,col="red")
lines(as.factor(grava$time),grava$zstd,col="blue")
grid(nx=20)
plot(as.factor(grava$time),grava$norm_std,ylim=c(0,3000))
title("norm grava std")
lines(as.factor(grava$time),grava$norm_std,col="black")
grid(nx=20)
