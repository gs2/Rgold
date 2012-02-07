library("quantmod")
library("RMySQL")

force=function(x) {
  return((EMA(Cl(x),n=2)-EMA(Op(x),n=2))*Vo(x))
     }
bull=function(x) {
  return(Hi(x)-EMA(Cl(x)))
  }
bear=function(x) {
  return(Lo(x)-EMA(Cl(x)))
  }
wmr=function(x){
  return(1-WPR(HLC(x)))
  }
myadx=function(x) {
  return(ADX(HLC(x))[,c(1,2,4)])
         }
sco=function(x){
  return(stoch(HLC(x),nFastK=5,nFastD=3,nSlowD=3)[,c(2,3)])
  }

addFI=newTA(force,col='blue',type='l')
addBU=newTA(bull,legend.name="Bull",col='white',type='h')
addBE=newTA(bear,legend.name="Bear",col='white',type='h')
addWMR=newTA(wmr,legend.name="WMR",col='blue',type='l')
addMYADX=newTA(myadx,col=c("green","red","blue"))
addSCO=newTA(sco,col=c("blue","red"),type=c("l","l"),lty=c(1,2))
con=dbConnect(MySQL(),user="john",password="",dbname="john",host="localhost")
tmp=dbGetQuery(con,'select * from xagw where Date>"2008-01-01" and Date<"2012-04-01 order by Date"')
dbDisconnect(con)
XAUW=xts(tmp[,-1],as.Date(tmp[,1],"%Y-%m-%d"))
#XAUW[,c(1,2,3,4)]=XAUW[,c(1,2,3,4)]*6.3027/31.1035*1000
#par(mfrow=c(2,1))
#XAUW=getSymbols("^SSEC",src="yahoo",auto.assign=FALSE)
#getSymbols("xauw",src="MySQL",db.fields=c("Date","Open","High","Low","Close","Volume"),user="john",password="",dbname="john")
chartSeries(XAUW,TA=c(addVo(),addBBands(),addEMA(n=22,col="yellow"),addEMA(n=11,col="green"),addSAR(),addMYADX(),addMACD(),addFI(),addSCO(),addBU(),addBE()))
#addTA(Vo(XAUW)*(EMA(Cl(XAUW),n=2)-EMA(lag(Cl(XAUW),1),n=2))/10000,col='blue', type='l')
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
