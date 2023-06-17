credit_data<-read.csv(file.choose())
str(credit_data)

cr_data<-credit_data[,2:12]
names(cr_data)<-c('y','x1','x2','x3','x4','x5','x6','x7','x8','x9','x10')
head(cr_data)
cr_data$y<- 1-cr_data$y #0 indicates a breach of contract, 1 indicates no breach of contract

library(lattice)
library(mice)
md.pattern(cr_data) #Many missing values in May

library(ggplot2)
ggplot(data = cr_data, aes(x5)) + geom_density(fill="lightskyblue") + xlim(0,25000) + geom_vline(aes(xintercept = median(cr_data$x5[!is.na(cr_data$x5)])), col = "red", lty = 2, lwd = 1)
cr_data$x5[is.na(cr_data$x5)]=median(cr_data$x5[!is.na(cr_data$x5)]
cr_data<-na.omit(cr_data)



hii<-hatvalues(mod)
r<- rstandard(mod)
D<- cooks.distance(mod)
r[abs(r)>2]
D[D>1]