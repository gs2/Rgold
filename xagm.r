require("quantmod")
require("RMySQL")

source("~/source/Rgold/myta.r")

con=dbConnect(MySQL(),user="john",password="",dbname="john",host="localhost")
tmp=dbGetQuery(con,'select * from xagm where Date>"2001-04-01" and Date<"2012-03-01 order by Date"')
dbDisconnect(con)
XAGM=xts(tmp[,-1],as.Date(tmp[,1],"%Y-%m-%d"))
#XAUW[,c(1,2,3,4)]=XAUW[,c(1,2,3,4)]*6.3027/31.1035*1000
#par(mfrow=c(2,1))
#XAUW=getSymbols("^SSEC",src="yahoo",auto.assign=FALSE)
#getSymbols("xauw",src="MySQL",db.fields=c("Date","Open","High","Low","Close","Volume"),user="john",password="",dbname="john")
#chartSeries(XAUW,TA=c(addVo(),addBBands(),addEMA(n=22,col="yellow"),addEMA(n=11,col="green"),addSAR(),addMYADX(),addMACD(),addFI(),addSCO(),addBU(),addBE()))
chartSeries(XAGM,TA=c(addVo(),addEMA(n=13,col="red"),addSAR(),addMYADX(m=5),addMACD(fast=3,slow=5,signal=5),addBU(m=13),addBE(m=13),addRSI(n=13)))
#addTA(EMA(Vo(XAUW)*(Cl(XAUW)-Op(XAUW)),n=5),col='blue', type='l')
#addTA(Hi(XAUW)-EMA(Cl(XAUW),n=13),col='white',legend="Bull",type='h')
#addTA(Lo(XAUW)-EMA(Cl(XAUW),n=13),col='white',legend="Bear",type='h')

#addRSI()
#addTA(1-WPR(HLC(XAUW)),col='blue',type='l')

#addTA(ADX(HLC(XAUW))[,c(1,2,4)],col=c("green","red","blue"))
#addMYADX()
#addMACD()
#addTA(force(XAUW)/100000000,col='blue',type='l')#,yrange=c(-3,3))
#addWMR()
#addTA(stoch(HLC(XAUW),nFastK=5,nFastD=3,nSlowD=3)[,c(2,3)],col=c("blue","red"),type=c("l","l"),lty=c(1,2))
#addBU()
#addBE()
#addTA(xts(TRUE,as.Date("2011-08-21")),on=-(1:7),col="#333333")
