#install.packages("ggplot2")
#install.packages("grid")
library(ggplot2)
library(grid)

#Se extraen los datos del .rar
temp <- tempfile()
download.file("http://archive.ics.uci.edu/ml/machine-learning-databases/00357/occupancy_data.zip", temp)
X <- read.csv(unz(temp,"datatest.txt"))
unlink(temp)

#Se utilizan sólo los datos desde las 7:00 hrs del 4 de feb hasta las 10:00hrs del 5 de feb
X<-X[1002:2622,1:7]

#Se crea un vector con los Axes del gráfico
Axes1<-c("07:00","'08:00","09:00","10:00","11:00","12:00","13:00","14:00","15:00","16:00","17:00",
        "18:00","19:00","20:00","21:00","22:00","23:00","00:00","01:00","02:00","03:00","04:00",
        "05:00","06:00","07:00","08:00","09:00","10:00")
Axes2<-seq(1002,2662,60)

#Se crean los respectivos gráficos para cada variable
a<-ggplot(X,aes(x=as.numeric(X$date),y=X$Temperature))+geom_line(colour="red")+xlab("Time")+
  ylab("Temperature")+scale_x_continuous(breaks=Axes2,labels = Axes1)+
  theme(axis.text.x=element_text(angle=90,size=7), axis.text.y=element_text(size=7),axis.title.x=element_text(size=8),
        axis.title.y=element_text(size=8))

b<-ggplot(X,aes(x=as.numeric(X$date),y=X$Humidity))+geom_line(colour="blue")+xlab("Time")+
  ylab("Humidity")+scale_x_continuous(breaks=Axes2,labels = Axes1)+
  theme(axis.text.x=element_text(angle=90,size=7), axis.text.y=element_text(size=7),axis.title.x=element_text(size=8),
        axis.title.y=element_text(size=8))

c<-ggplot(X,aes(x=as.numeric(X$date),y=X$HumidityRatio))+geom_line(colour="cyan")+xlab("Time")+
  ylab("HumidityRatio")+scale_x_continuous(breaks=Axes2,labels = Axes1)+
  theme(axis.text.x=element_text(angle=90,size=7), axis.text.y=element_text(size=7),axis.title.x=element_text(size=8),
        axis.title.y=element_text(size=8))

d<-ggplot(X,aes(x=as.numeric(X$date),y=X$CO2))+geom_line(colour="green")+xlab("Time")+
  ylab("CO2 (ppm)")+scale_x_continuous(breaks=Axes2,labels = Axes1)+
  theme(axis.text.x=element_text(angle=90,size=7), axis.text.y=element_text(size=7),axis.title.x=element_text(size=8),
        axis.title.y=element_text(size=8))

e<-ggplot(X,aes(x=as.numeric(X$date),y=X$Light))+geom_line(colour="brown")+xlab("Time")+
  ylab("Light (Lux)")+scale_x_continuous(breaks=Axes2,labels = Axes1)+
  theme(axis.text.x=element_text(angle=90,size=7), axis.text.y=element_text(size=7),axis.title.x=element_text(size=8),
        axis.title.y=element_text(size=8))

f<-ggplot(X,aes(x=as.numeric(X$date),y=X$Occupancy))+geom_line(colour="black")+xlab("Time")+
  ylab("Occupancy")+scale_x_continuous(breaks=Axes2,labels = Axes1)+
  theme(axis.text.x=element_text(angle=90,size=7), axis.text.y=element_text(size=7),axis.title.x=element_text(size=8),
        axis.title.y=element_text(size=8))

#Se unen los gráficos mediante el paquete grid
vplayout <- function(x, y) viewport(layout.pos.row = x, layout.pos.col = y)

grid.newpage()
pushViewport(viewport(layout = grid.layout(6, 1)))

print(a, vp = vplayout(1,1))
print(b, vp = vplayout(2,1))
print(c, vp = vplayout(3,1))
print(d, vp = vplayout(4,1))
print(e, vp = vplayout(5,1))
print(f, vp = vplayout(6,1))