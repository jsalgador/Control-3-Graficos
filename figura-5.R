#install.packages("corrplot")
library(corrplot)

#Se extraen los datos directamente de la URL
X <- read.csv(url("https://www.dropbox.com/s/r0fxlta0tyqkwax/datatraining.txt?dl=1"))

#Se generan los datos de la nueva variable NSM
h<-as.numeric(strftime(X[1:8143,1], format="%H"))*3600
m<-as.numeric(strftime(X[1:8143,1], format="%M"))*60
s<-as.numeric(strftime(X[1:8143,1], format="%S"))

#Se generan los datos de la nueva variable WeekStatus
a<-as.numeric(strftime(X[1:8143,1], format="%d"))!=7 & as.numeric(strftime(X[1:8143,1], format="%d"))!=8
X[1]<-h+m+s
a[a==TRUE]<-1
X[8]<-a

#Se agregan los nombres seg�n la posici�n
colnames(X)<-c("NSM","Temperature","Humidity","Light","CO2","HumidityRatio","Occupancy","WeekStatus")

#Se cambian de posici�n las columnas
X<-X[,c("WeekStatus","Temperature","Light","CO2","NSM","Humidity","HumidityRatio","Occupancy")]

#Se genera la correlaci�n con los datos, sin incluir la ocupaci�n
Y<-cor(X[1:7])

#Se imprime la correlaci�n con la funci�n corrplot
corrplot(Y, method="circle", type="upper",tl.col="black", tl.srt=45, tl.cex=0.8)
