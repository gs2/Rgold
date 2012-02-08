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

addFI=newTA(force,legend.name="Force",col='blue',type='l')
addBU=newTA(bull,legend.name="Bull",col='white',type='h')
addBE=newTA(bear,legend.name="Bear",col='white',type='h')
addWMR=newTA(wmr,legend.name="WMR",col='blue',type='l')
addMYADX=newTA(myadx,legend.name="ADX",col=c("green","red","blue"))
addSCO=newTA(sco,legend.name="Stoch",col=c("blue","red"),type=c("l","l"),lty=c(1,2))
