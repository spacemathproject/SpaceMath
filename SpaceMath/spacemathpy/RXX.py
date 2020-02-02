#Python version of RXX.m
# This program evaluate the signal strenght from LHC
# https://arxiv.org/abs/1809.10733

#python libraries
import sympy as sp
sp.init_printing()
import numpy as np
from .data import *
#######################################
# Scalar boson decays into fermion pair
#######################################
# Definitions
τf = lambda mi,mS: (2*(mi/mS))**2

#Función para probar que un al menos un elempento es una clase de sympy
# Funtion to test if one argument is a sympy subclass

def issymbolic(*z):
    return True in [isinstance(z[i],tuple(sp.core.all_classes)) for i in range(len(z))]

# Decay width of the Scalar boson into fermion pair
def WidthHff(ghfifj,Nc,mi,mj,mS):
    if issymbolic(ghfifj,Nc,mi,mj,mS):
        return (((ghfifj**2)*Nc*mS)/(128*sp.pi))*((4-(sp.sqrt(τf(mi,mS)) + sp.sqrt(τf(mj,mS)))**2)**(sp.S(3)/2))*(sp.sqrt((4-(sp.sqrt(τf(mi,mS))-sp.sqrt(τf(mj,mS)))**2)))
    else:
        return (((ghfifj**2)*Nc*mS)/(128*np.pi))*((4-(np.sqrt(τf(mi,mS)) + np.sqrt(τf(mj,mS)))**2)**(3/2))*(np.sqrt((4-(np.sqrt(τf(mi,mS))-np.sqrt(τf(mj,mS)))**2)))

####################################################
#Scalar boson decay into gluon pair at one-loop level
####################################################

#Definitions
def ft(mS):
    global mt
    if issymbolic(mS):
        mtop=mt['symbol']
        return -(sp.S(1)/4)*(sp.log((1+sp.sqrt(1-(((mS**2)/(4*mtop**2))**-1)))/(1-sp.sqrt(1-(((mS**2)/(4*mtop**2))**-1))))*(-sp.I*sp.pi))**2
    else:
        mtop=mt['value']
        return -(1/4)*(np.log((1+np.sqrt(1-(((mS**2)/(4*mtop**2))**-1)))/(1-np.sqrt(1-(((mS**2)/(4*mtop**2))**-1))))*(-sp.I*np.pi))**2
            
def fb(mS):
    global mb
    if issymbolic(mS):
        mbot=mb['symbol']
        return -(sp.S(1)/4)*(sp.log((1+sp.sqrt(1-(((mS**2)/(4*mbot**2))**-1)))/(1-sp.sqrt(1-(((mS**2)/(4*mbot**2))**-1))))*(-sp.I*sp.pi))**2
    else:
        mbot=mb['value']
        return -(1/4)*(np.log((1+np.sqrt(1-(((mS**2)/(4*mbot**2))**-1)))/(1-np.sqrt(1-(((mS**2)/(4*mbot**2))**-1))))*(-sp.I*np.pi))**2

def gt(mS):
    global mt
    if issymbolic(mS):
        mtop=mt['symbol']
        return sp.asin(sp.sqrt((mS**2)/(4*mtop**2)))**2
    else:
        mtop = mt['value']
        return np.arcsin(np.sqrt((mS**2)/(4*mtop**2)))**2;

def gb(mS):
    global mb
    if issymbolic(mS):
        mbot=mb['symbol']
        return sp.asin(sp.sqrt((mS**2)/(4*mbot**2)))**2
    else:
        mbot=mb['value']
        return np.arcsin(np.sqrt((mS**2)/(4*mbot**2)))**2;
    
def At(mS):
    global mt
    if issymbolic(mS):
        mtop=mt['symbol']
        return sp.Piecewise((gt(mS), mS**2/(4*mtop**2)<=1), (ft(mS), True))
    else:
        mtop = mt['value']
        return np.where(mS**2/(4*mtop**2)<=1.0,gt(mS),ft(mS))

    
def Ab(mS):
    global mb
    if issymbolic(mS):
        mbot=mb['symbol']
        return sp.Piecewise((gb(mS), mS**2/(4*mbot**2)<=1), (fb(mS), True))
    else:
        mbot=mb['value']
        return np.where(mS**2/(4*mbot**2)<=1.0,gb(mS),fb(mS))
    
def Ft(mS):
    global mt
    if issymbolic(mS):
        mtop = mt['symbol']
        return 2*(mS**2/(4*mtop**2)+((mS**2/(4*mtop**2)-1)*At(mS)))*((mS**2/(4*mtop**2))**-2);
    else:
        mtop = mt['value']
        return 2*(mS**2/(4*mtop**2)+((mS**2/(4*mtop**2)-1)*At(mS)))*((mS**2/(4*mtop**2))**-2);
        
def Fb(mS):
    global mb
    if issymbolic(mS):
        mbot = mb['symbol']
        return 2*(mS**2/(4*mbot**2)+((mS**2/(4*mbot**2)-1)*At(mS)))*((mS**2/(4*mbot**2))**-2);
    else:
        mbot = mb['value']
        return 2*(mS**2/(4*mbot**2)+((mS**2/(4*mbot**2)-1)*At(mS)))*((mS**2/(4*mbot**2))**-2);

        
def AHgg(ghtt,ghbb,mS):# Considering th bottom and top quarks contributions
    global mW,mt,mb
    if issymbolic(ghtt,ghbb,mS):###¿?###does not depend of ghtt and ghbb?
        mWp,mtop,mbot = mW['symbol'],mt['symbol'],mb['symbol']
        return 2*mWp*((ghtt/(mtop)*Ft(mS))+(ghbb/(mbot)*Fb(mS)))
    else:
        mWp,mtop,mbot = mW['value'],mt['value'],mb['value']
        return 2*mWp*((ghtt/(mtop)*Ft(mS))+(ghbb/(mbot)*Fb(mS)))

#Decay width of the Scalar boson into gluon pair
def WidthHgg(ghtt,ghbb,mS):
    global mW, αs
    if issymbolic(ghtt,ghbb,mS):
        mWp = mW['symbol']
        return ((αs['symbol']**2*mS**3)/(512*mWp**2*sp.pi**3 ))*abs(sp.S(3/4)*AHgg(ghtt,ghbb,mS))**2;
    else:
        mWp = mW['value']
        return ((αs['value']**2*mS**3)/(512*mWp**2*np.pi**3 ))*abs(3/4*AHgg(ghtt,ghbb,mS))**2;

####################################################
# Higgs boson decay into photon pair
####################################################

#Main fermion contribution come from top and bottom quark*

#seem that ghff does not contribute ¿?
def Aht(ghtt,mS):
    global Qt
    if issymbolic(ghtt,mS):
        qt = Qt['symbol']
        return 3*qt**2*(ghtt/ghtt)*Ft(mS)
    else:
        qt = Qt['value']
        return 3*qt**2*(ghtt/ghtt)*Ft(mS)
    
def Ahb(ghbb,mS):
    global Qb
    if issymbolic(ghbb,mS):
        qb = Qb['symbol']
        return 3*qb**2*(ghbb/ghbb)*Ft(mS)
    else:
        qb = Qb['value']
        return 3*qb**2*(ghbb/ghbb)*Ft(mS)

def Af(ghtt,ghbb,mS):
    return Aht(ghtt,mS) + Ahb(ghbb,mS)


#### W contribution
    
def fW(mS):
    global mW
    if issymbolic(mS):
        mWp = mW['symbol']
        return -(sp.S(1)/4)*(sp.log((1+sp.sqrt(1-(((mS**2)/(4*mWp**2))**-1)))/(1-sp.sqrt(1-(((mS**2)/(4*mWp**2))**-1))))*(-sp.I*sp.pi))**2;
    else:
        mWp = mW['value']
        return -(1.0/4)*(np.log((1+np.sqrt(1-(((mS**2)/(4*mWp**2))**-1)))/(1-np.sqrt(1-(((mS**2)/(4*mWp**2))**-1))))*(-sp.I*np.pi))**2;
    
def gW(mS):
    global mW
    if issymbolic(mS):
        mWp = mW['symbol']
        return sp.asin(sp.sqrt(mS**2/(4*mWp**2)))**2;
    else:
        mWp = mW['value']
        return np.arcsin(np.sqrt(mS**2/(4*mWp**2)))**2;

    
def AW(mS):
    global mW
    if issymbolic(mS):
        mWp=mW['symbol']
        return sp.Piecewise((gW(mS), mS**2/(4*mWp**2)<=1), (fW(mS), True))
    else:
        mWp=mW['value']
        return np.where(mS**2/(4*mWp**2)<=1.0,gW(mS),fW(mS))
    
def FW(mS):
    global mW
    if issymbolic(mS):
        mWp = mW['symbol']
        return -((2*(mS**2/(4*mWp**2))**2)+(3*(mS**2/(4*mWp**2)))+((3*(2*(mS**2/(4*mWp**2))-1))*AW(mS)))*(mS**2/(4*mWp**2))**(-2);
    else:
        mWp = mW['value']
        return -((2*(mS**2/(4*mWp**2))**2)+(3*(mS**2/(4*mWp**2)))+((3*(2*(mS**2/(4*mWp**2))-1))*AW(mS)))*(mS**2/(4*mWp**2))**(-2);
    
def AhW(ghWW,mS):
    global mW
    if issymbolic(ghWW,mS):
        mWp = mW['symbol']
    else:
        mWp = mW['value']
    return (ghWW/mWp)*FW(mS)
    
# Charged scalar contribution
    
def fH(mCH,mS):
    if issymbolic(mCH,mS):
        return -(sp.S(1)/4)*(sp.log((1+sp.sqrt(1-(((mS**2)/(4*mCH**2))**-1)))/(1-sp.sqrt(1-(((mS**2)/(4*mCH**2))**-1))))*(- sp.I*sp.pi))**2
    else:
        return -(1.0/4)*(np.log((1+np.sqrt(1-(((mS**2)/(4*mCH**2))**-1)))/(1-np.sqrt(1-(((mS**2)/(4*mCH**2))**-1))))*(- sp.I*np.pi))**2
    
    
def gH(mCH,mS):
    if issymbolic(mCH,mS):
        return sp.asin(sp.sqrt(mS**2/(4*mCH**2)))**2 
    else:
        return np.arcsin(np.sqrt(mS**2/(4*mCH**2)))**2 

def AH(mCH,mS):
    if issymbolic(mCH,mS):
        return sp.Piecewise((gH(mCH,mS), mS**2/(4*mCH**2)<=1), (fH(mCH,mS), True))
    else:
        return np.where(mS**2/(4*mCH**2)<=1.0,gH(mCH,mS),fH(mCH,mS))

def FH(mCH,mS):
    return -((mS**2/(4*mCH**2))-AH(mCH,mS))*(mS**2/(4*mCH**2))**-2;

def AHc(gCH,mCH,mS):
    global mW, cW
    if issymbolic(gCH,mCH,mS):
        mWp, CW = mW['symbol'], cW['symbol']
    else:
        mWp, CW = mW['value'], cW['value']
    return (mWp*gCH)/(mCH**2)*FH(mCH,mS);
    
def Ahgaga(ghtt,ghbb,ghWW,gCH,mCH,mS):
    return Af(ghtt,ghbb,mS) + AhW(ghWW,mS) + AHc(gCH,mCH,mS)

#Decay width of scalar boson into photon-photon
def WidthHgaga(ghtt,ghbb,ghWW,gCH,mCH,mS):
    global mW, αem
    if issymbolic(ghtt,ghbb,ghWW,gCH,mCH,mS):
        mWp = mW['symbol']
        return ((αem['symbol']**2)*(mS**3))/(1024*sp.pi**3*mWp**2)*abs(Ahgaga(ghtt,ghbb,ghWW,gCH,mCH,mS))**2
    else:
        mWp = mW['value']
        return ((αem['value']**2)*(mS**3))/(1024*np.pi**3*mWp**2)*abs(Ahgaga(ghtt,ghbb,ghWW,gCH,mCH,mS))**2
    
####################################################################################
# Scalar boson decay into vector pair
####################################################################################
#Definitions

def RT(mS,mV):
    if issymbolic(mS):
        mVec = mV['symbol']
        return -(((1-mVec**2/mS**2)*(47*(mVec**4/mS**4)-(13*mVec**2/mS**2)+2))/(2*mVec**2/mS**2))-sp.S(3)/2*(4*(mVec**4/mS**4)-6*(mVec**2/mS**2)+1)*(sp.log(mVec**2/mS**2))+(3*(20*(mVec**4/mS**4)- 8*(mVec**2/mS**2)+1))/sp.sqrt(4**(mVec**2/mS**2)-1)*sp.acos((3*(mVec**2/mS**2)-1)/(2*(mVec**3/mS**3)));
    else:
        mVec = mV['value']
        return -(((1-mVec**2/mS**2)*(47*(mVec**4/mS**4)-(13*mVec**2/mS**2)+2))/(2*mVec**2/mS**2))-(3.0/2)*(4*(mVec**4/mS**4)-6*(mVec**2/mS**2)+1)*(np.log(mVec**2/mS**2))+(3*(20*(mVec**4/mS**4)- 8*(mVec**2/mS**2)+1))/np.sqrt(4**(mVec**2/mS**2)-1)*np.arccos((3*(mVec**2/mS**2)-1)/(2*(mVec**3/mS**3)));

RTW = lambda mS: RT(mS,mW)
RTZ = lambda mS: RT(mS,mZ)
δZ = 7-(40/(3*sW['value']**2))+160/(9*sW['value']**4);

# Decay width of Higgs boson into WW pair
def WidthHWW(ghWW,mS):
    global mW
    if issymbolic(ghWW,mS):
        mWp = mW['symbol']
        return ((ghWW**2)*mS)/(512*(sp.pi**3)*(mWp**4))*RTW(mS)
    else:
        mWp = mW['value']
        return ((ghWW**2)*mS)/(512*(np.pi**3)*(mWp**4))*RTW(mS)

# Decay width of Higgs boson into ZZ pair
def WidthHZZ(ghZZ,mS):
    global mZ, δZ
    if issymbolic(ghZZ,mS):
        mZp = mZ['symbol']
        sZ = sp.symbols(r'\delta_Z',positive=True)
        return ((ghZZ**2)*mS)/(2048*(sp.pi**3)*mZp**4)*sZ*RTZ(mS)
    else:
        mZp = mZ['value']
        return ((ghZZ**2)*mS)/(2048*(np.pi**3)*mZp**4)*δZ*RTZ(mS)
    
#####################################################################3
# Branchig ratios for higgs -> XX'

# h->fifj
def BRhfifj(ghfifj,Nc,mi,mj):
    global mh,TotWidth
    if issymbolic(ghfifj,Nc,mi,mj):
        mhiggs = mh['symbol']
        return WidthHff(ghfifj,Nc,mi,mj,mhiggs)/TotWidth
    else:
        mhiggs = mh['value']
        return WidthHff(ghfifj,Nc,mi,mj,mhiggs)/TotWidth

# h->gaga
def BRhgaga(ghtt,ghbb,ghWW,gCH,mCH):
    global mh,TotWidth
    if issymbolic(ghtt,ghbb,ghWW,gCH,mCH):
        mhiggs = mh['symbol']
        return WidthHgaga(ghtt,ghbb,ghWW,gCH,mCH,mhiggs)/TotWidth
    else:
        mhiggs = mh['value']
        return WidthHgaga(ghtt,ghbb,ghWW,gCH,mCH,mhiggs)/TotWidth

# h->WW
def BRhWW(ghWW):
    global mh, TotWidth
    if issymbolic(ghWW):
        mhiggs = mh['symbol']
        return WidthHWW(ghWW,mhiggs)/TotWidth
    else:
        mhiggs = mh['value']
        return WidthHWW(ghWW,mhiggs)/TotWidth
# h->ZZ
def BRhZZ(ghZZ):
    global mh , TotWidth
    if issymbolic(ghZZ):
        mhiggs = mh['symbol']
        return WidthHZZ(ghZZ,mhiggs)/TotWidth
    else:
        mhiggs = mh['value']
        return WidthHWW(ghZZ,mhiggs)/TotWidth

# h->ZZ
def BRhgg(ghtt,ghbb):
    global mh, TotWidth
    if issymbolic(ghtt,ghbb):
        mhiggs = mh['symbol']
        return WidthHgg(ghtt,ghbb,mhiggs)/TotWidth
    else:
        mhiggs = mh['value']
        return WidthHgg(ghtt,ghbb,mhiggs)/TotWidth

###############################################################################
#Signal Strenghts
###############################################################################
#Rb
def Rbotbot(ghtt,ghbb):
    global mh,mt,mb,mW,g
    if issymbolic(ghtt,ghbb):
        mhiggs,mtop,mbot,mWp,gg = mh['symbol'],mt['symbol'],mb['symbol'],mW['symbol'],g['symbol']
    else:
        mhiggs,mtop,mbot,mWp,gg = mh['value'],mt['value'],mb['value'],mW['value'],g['value']
    return (WidthHgg(ghtt,ghbb,mhiggs)*BRhfifj(ghbb, 3, mbot, mbot))/(WidthHgg(gg*mtop/(2*mWp),gg*mbot/(2*mWp),mhiggs)*BRhfifj(gg*mbot/(2*mWp), 3, mbot, mbot))

#Rtau
def Rtata(ghtt,ghbb,ghtautau):
    global mh,mt,mb,mta,mW,g
    if issymbolic(ghtt,ghbb,ghtautau):
        mhiggs,mtop,mbot,mtau,mWp,gg = mh['symbol'],mt['symbol'],mb['symbol'],mta['symbol'],mW['symbol'],g['symbol']
    else:
        mhiggs,mtop,mbot,mtau,mWp,gg = mh['value'],mt['value'],mb['value'],mta['value'],mW['value'],g['value']
    return (WidthHgg(ghtt,ghbb,mhiggs)*BRhfifj(ghtautau, 1, mtau, mtau))/(WidthHgg(gg*mtop/(2*mWp),gg*mbot/(2*mWp),mhiggs)*BRhfifj(gg*mtau/(2*mWp), 1, mtau, mtau));

#RW
def RWW(ghtt,ghbb,ghWW):
    global mh,mt,mb,mW
    if issymbolic(ghtt,ghbb,ghWW):
        mhiggs,mtop,mbot,mWp,gg,ggw = mh['symbol'],mt['symbol'],mb['symbol'],mW['symbol'],g['symbol'],gw['symbol']
    else:
        mhiggs,mtop,mbot,mWp,gg,ggw = mh['value'],mt['value'],mb['value'],mW['value'],g['value'],gw['value']
    return (WidthHgg(ghtt,ghbb,mhiggs)*BRhWW(ghWW))/(WidthHgg(gg*mtop/(2*mWp),gg*mbot/(2*mWp),mhiggs)*BRhWW(ggw*mWp))

#RZ
def RZZ(ghtt,ghbb,ghZZ):
    global mh,mt,mb,mW
    if issymbolic(ghtt,ghbb,ghZZ):
        mhiggs,mtop,mbot,mZp,mWp,gg,ggz = mh['symbol'],mt['symbol'],mb['symbol'],mZ['symbol'],mW['symbol'],g['symbol'],gz['symbol']
    else:
        mhiggs,mtop,mbot,mZp,mWp,gg,ggz = mh['value'],mt['value'],mb['value'],mZ['value'],mW['value'],g['value'],gz['value']
    return (WidthHgg(ghtt,ghbb,mhiggs)*BRhZZ(ghZZ))/(WidthHgg(gg*mtop/(2*mWp),gg*mbot/(2*mWp),mhiggs)*BRhZZ(ggz*mZp))#Es mZ o mW

#Rga
def Rgaga(ghtt,ghbb,ghWW,gCH,mCH):
    global mh,mt,mb,mW
    if issymbolic(ghtt,ghbb,ghWW,gCH,mCH):
        mhiggs,mtop,mbot,mWp,gg,ggw = mh['symbol'],mt['symbol'],mb['symbol'],mW['symbol'],g['symbol'],gw['symbol']
    else:
        mhiggs,mtop,mbot,mWp,gg,ggw = mh['value'],mt['value'],mb['value'],mW['value'],g['value'],gw['value']
    return (WidthHgg(ghtt,ghbb,mhiggs)*BRhgaga(ghtt,ghbb,ghWW,gCH,mCH))/(WidthHgg(gg*mtop/(2*mWp),gg*mbot/(2*mWp),mhiggs)*BRhgaga(gg*mtop/(2*mWp),gg*mbot/(2*mWp),ggw*mWp,0,mCH))

#Rg
def Rgg(ghtt,ghbb):
    global mh,mt,mb,mW
    if issymbolic(ghtt,ghbb):
        mhiggs,mtop,mbot,mWp,gg = mh['symbol'],mt['symbol'],mb['symbol'],mW['symbol'],g['symbol']
    else:
        mhiggs,mtop,mbot,mWp,gg = mh['value'],mt['value'],mb['value'],mW['value'],g['value']
    return WidthHgg(ghtt,ghbb,mhiggs)*BRhgg(ghtt,ghbb)/(WidthHgg(gg*mtop/(2*mWp),gg*mbot/(2*mWp),mhiggs)*BRhgg(gg*mtop/(2*mWp),gg*mbot/(2*mWp)))

