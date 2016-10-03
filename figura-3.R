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

#Se agregan los nombres según la posición
colnames(X)<-c("NSM","Temperature","Humidity","Light","CO2","HumidityRatio","Occupancy","WeekStatus")

#Se cambian de posición las columnas
X<-X[,c("Temperature","Humidity","Light","CO2","HumidityRatio","NSM","WeekStatus","Occupancy")]

#Se imprime el gráfico
plot(X[1:7],col=ifelse(X$Occupancy==1,"blue","green"))
