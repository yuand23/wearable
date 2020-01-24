train1 <- read.csv("train1.csv",header=T,stringsAsFactors = F)
train2 <- read.csv("train2_5.csv",header=T,stringsAsFactors = F)
train3 <- read.csv("train2_6.csv",header=T,stringsAsFactors = F)
train4 <- read.csv("train3_1.csv",header=T,stringsAsFactors = F)
train5 <- read.csv("train3_2.csv",header=T,stringsAsFactors = F)
train6 <- read.csv("train4_1.csv",header=T,stringsAsFactors = F)
train7 <- read.csv("train4_2.csv",header=T,stringsAsFactors = F)
train8 <- read.csv("train5_1.csv",header=T,stringsAsFactors = F)
train9 <- read.csv("train5_2.csv",header=T,stringsAsFactors = F)
train10 <- read.csv("train6_1.csv",header=T,stringsAsFactors = F)
train11 <- read.csv("train6_2.csv",header=T,stringsAsFactors = F)

train <- rbind(train1,train2,train3,train4,train5,train6,train7,train8,train9,train10,train11)

test <- read.csv("test_multi_freq10.csv",header=T,stringsAsFactors = F)

#random forest model
set.seed(754)
rf_model <- randomForest::randomForest(factor(type) ~ angv_meanx + angv_meany + angv_meanz + angv_meannorm + 
                           angv_stdx+ angv_stdy+ angv_stdz+ angv_stdnorm+ grava_meanx+ grava_meany + 
                         grava_meanz + grava_meannorm+ grava_stdx+ grava_stdy+ grava_stdz+ grava_stdnorm,
                           data = train)

dev.new()
par(mfrow=c(1,1))
par(mar=c(2,2,2,2))
plot(rf_model)

importance <- randomForest::importance(rf_model)
varImportance <- data.frame(Variables = row.names(importance),
                            Importance = round(importance[ ,'MeanDecreaseGini'],2))
library(dplyr)

rankImportance <- varImportance %>%
  mutate(Rank = paste0('#',dense_rank(desc(Importance))))

prediction <- predict(rf_model,test)

result <- data.frame(test$time,prediction)
colnames(result) <- c("time","prediction")
write.csv(result,file='prediction.csv',row.names=F)
