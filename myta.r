force=function(x,m=2) {
  return((EMA(Cl(x),n=m)-EMA(Op(x),n=m))*log10(Vo(x)))
     }
bull=function(x,m=13) {
  return(Hi(x)-EMA(Cl(x),n=m))
  }
bear=function(x,m=13) {
  return(Lo(x)-EMA(Cl(x),n=m))
  }
wmr=function(x,m=5){
  return(1-WPR(HLC(x),n=m))
  }
myadx=function(x,m) {
  return(ADX(HLC(x),n=m)[,c(1,2,4)])
         }
sco=function(x,FK=5,FD=3,SD=3){
  return(stoch(HLC(x),nFastK=FK,nFastD=FD,nSlowD=SD)[,c(2,3)])
  }

addFI=newTA(force,legend.name="Force",col='blue',type='l')
addBU=newTA(bull,legend.name="Bull",col='white',type='h')
addBE=newTA(bear,legend.name="Bear",col='white',type='h')
addWMR=newTA(wmr,legend.name="WMR",col='blue',type='l')
addMYADX=newTA(myadx,legend.name="ADX",col=c("green","red","blue"))
addSCO=newTA(sco,legend.name="Stoch",col=c("blue","red"),type=c("l","l"),lty=c(1,2))

