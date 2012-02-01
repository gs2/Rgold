library("quantmod")
library("RMySQL")

con=dbConnect(MySQL(),user="john",password="",dbname="john",host="localhost")
tmp=dbGetQuery(con,'select * from xauw where Date>"2001-01-01" and Date<"2012-02-11"')
dbDisconnect(con)
XAUW=xts(tmp[,-1],as.Date(tmp[,1],"%Y-%m-%d"))
#par(mfrow=c(2,1))
#getSymbols("xauw",src="MySQL",db.fields=c("Date","Open","High","Low","Close","Volume"),user="john",password="",dbname="john")
chartSeries(XAUW,TA=c(addVo(),addBBands(),addADX(),addMACD(),addEMA(n=22,col="yellow"),addEMA(n=11,col="green"),addSAR()))
