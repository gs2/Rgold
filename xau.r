library("quantmod")
library("RMySQL")

force=function(x) {
  return((EMA(Cl(x),n=2)-EMA(lag(Cl(x),1),n=2))*Vo(x))
     }
bull=function(x) {
  return(Hi(x)-EMA(Cl(x)))
  }
bear=function(x) {
  return(Lo(x)-EMA(Cl(x)))
  }
addFI=newTA(force,col='blue',type='l')
addBU=newTA(bull,legend.name="Bull",col='white',type='h')
addBE=newTA(bear,legend.name="Bear",col='white',type='h')
con=dbConnect(MySQL(),user="john",password="",dbname="john",host="localhost")
tmp=dbGetQuery(con,'select * from xauw where Date>"2006-05-01" and Date<"2012-08-01 order by Date"')
dbDisconnect(con)
XAUW=xts(tmp[,-1],as.Date(tmp[,1],"%Y-%m-%d"))

#par(mfrow=c(2,1))
#getSymbols("AAPL")
#getSymbols("xauw",src="MySQL",db.fields=c("Date","Open","High","Low","Close","Volume"),user="john",password="",dbname="john")
chartSeries(XAUW,TA=c(addVo(),addBBands(),addADX(),addMACD(),addEMA(n=22,col="yellow"),addEMA(n=11,col="green"),addSAR(),addFI(),addBU(),addBE()))
#addTA(Vo(XAUW)*(EMA(Cl(XAUW),n=2)-EMA(lag(Cl(XAUW),1),n=2))/10000,col='blue', type='l')
#addTA(Hi(XAUW)-EMA(Cl(XAUW),n=13),col='white',legend="Bull",type='h')
#addTA(Lo(XAUW)-EMA(Cl(XAUW),n=13),col='white',legend="Bear",type='h')
#addTA(force(XAUW)/10000,col='blue',type='l')
