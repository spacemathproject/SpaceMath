#Python version of RXX.m
# This program evaluate the signal strenght from LHC
# https://arxiv.org/abs/1809.10733

#python libraries
from sympy import log, sqrt, pi,I,S,asin,acos,Abs,Piecewise,symbols
import numpy as np
from .data import *
#from data import mt,mb, mW, αs, Qt,Qb,αem, mZ, mh,TotWidth,cW,g,mtau,sW
#import data
#mt = data.mt
#mb = data.mb
#mW = data.mW
#mZ = data.mZ
#mtau = data.mtau
#mh = data.mh
#αs = data.αs
#Qt = data.Qt
#Qb = data.Qb
#αem = data.αem
#TotWidth = data.TotWidth
#cW = data.cW
#sW = data.sW
#g = data.g
#gw = data.gw
#######################################
# Scalar boson decays into fermion pair
#######################################
# Definitions
τf = lambda mi,mS: (2*(mi/mS))**2

def issymbolic(*args):
    '''
    Test is some of the element of args list is an 
    instance of sympy
    
    Parameters
    ----------
    args: list
        List with differents types of elements they 
        could be float, int or sympy instances
        
    Returns
    -------
    Return True if someone of the elements of args list is a
    sympy instance, otherwise return False.
    
    '''
    from sympy import core
    return True in [isinstance(args[i],tuple(core.all_classes)) for i in range(len(args))]

# Decay width of the Scalar boson into fermion pair
def WidthHff(ghfifj,Nc,mi,mj,mS):
    '''Width decay for S -> fi fj
    
    Parameters
    ----------
    ghfifj: float also works with numpy or sympy
        Coupling of scalar and fermions
    Nc: int 
        Color charge, 1 for leptons and 3 for quarks.
    mi,mj: float also works with numpy or sympy
        Fermions masses
    mS: float also works with numpy or sympy
        Scalar mass
    
    Returns
    -------
    float, numpy and sympy instances depend on input
    '''
    if issymbolic(ghfifj,Nc,mi,mj,mS):
        return (((ghfifj**2)*Nc*mS)/(128*pi))*((4-(sqrt(τf(mi,mS)) + sqrt(τf(mj,mS)))**2)**(S(3)/2))*(sqrt((4-(sqrt(τf(mi,mS))-sqrt(τf(mj,mS)))**2)))
    else:
        return (((ghfifj**2)*Nc*mS)/(128*np.pi))*((4-(np.sqrt(τf(mi,mS)) + np.sqrt(τf(mj,mS)))**2)**(3.0/2))*(np.sqrt((4-(np.sqrt(τf(mi,mS))-np.sqrt(τf(mj,mS)))**2)))

####################################################
#Scalar boson decay into gluon pair at one-loop level
####################################################

#Definitions
def ft(mS):
    global mt
    if issymbolic(mS):
        mtop=mt['symbol']
        x = 4*mtop**2/mS**2
        return -(S(1)/4)*(log((1+sqrt(1-x))/(1-sqrt(1-x)))-I*pi)**2;#MODIFICADO#
    else:
        mtop=mt['value']
        x = 4*mtop**2/mS**2
        return -(1.0/4.0)*(np.log((1+np.sqrt(1-x))/(1-np.sqrt(1-x)))-1j*np.pi)**2;#MODIFICADO#(-I*np.pi)
         
def fb(mS):
    global mb
    if issymbolic(mS):
        mbot=mb['symbol']
        x = 4*mbot**2/mS**2
        return -(S(1)/4)*(log((1+sqrt(1-x))/(1-sqrt(1-x)))-I*pi)**2;#MODIFICADO#
    else:
        mbot=mb['value']
        x = 4*mbot**2/mS**2
        return -(1.0/4.0)*(np.log((1+np.sqrt(1-x))/(1-np.sqrt(1-x)))-1j*np.pi)**2;#MODIFICADO#(-I*np.pi)

def gt(mS):
    global mt
    if issymbolic(mS):
        mtop=mt['symbol']
        return asin(sqrt((mS**2)/(4*mtop**2)))**2
    else:#(ArcSin[1/Sqrt[(4*mt^2)/(mS^2)]])^2
        mtop = mt['value']
        return np.arcsin(np.sqrt((mS**2)/(4*mtop**2)))**2;

def gb(mS):
    global mb
    if issymbolic(mS):
        mbot=mb['symbol']
        return asin(sqrt((mS**2)/(4*mbot**2)))**2
    else:
        mbot=mb['value']
        return np.arcsin(np.sqrt((mS**2)/(4*mbot**2)))**2;
    
def At(mS):
    global mt
    if issymbolic(mS):
        mtop=mt['symbol']
        return Piecewise((gt(mS), (4*mtop**2)/mS**2>=1), (ft(mS), True))
    else:#If[((4*mt^2)/mS^2)>=1,gt[mS],ft[mS]]
        mtop = mt['value']
        return np.where((4*mtop**2)/mS**2>=1.0,gt(mS),ft(mS))

    
def Ab(mS):
    global mb
    if issymbolic(mS):
        mbot=mb['symbol']
        return Piecewise((gb(mS), (4*mbot**2)/mS**2>=1), (fb(mS), True))
    else:
        mbot=mb['value']
        return np.where((4*mbot**2)/mS**2>=1.0,gb(mS),fb(mS))
    
def Ft(mS):
    global mt
    if issymbolic(mS):
        mtop = mt['symbol']
    else:#########MODIFICADO##########
        mtop = mt['value']
    x = 4*mtop**2/(mS**2)
    return -2*x*(1+(1-x)*At(mS));
       
def Fb(mS):
    global mb
    if issymbolic(mS):
        mbot = mb['symbol']
    else:#########MODIFICADO##########
        mbot = mb['value']
    x = 4*mbot**2/(mS**2)
    return -2*x*(1+(1-x)*Ab(mS));

        
def AHgg(ghtt,ghbb,mS):# Considering the bottom and top quarks contributions
    global mW,mt,mb
    if issymbolic(ghtt,ghbb,mS):
        mWp,mtop,mbot = mW['symbol'],mt['symbol'],mb['symbol']
        return 2*mWp*((ghtt/(mtop)*Ft(mS))+(ghbb/(mbot)*Fb(mS)))
    else:
        mWp,mtop,mbot = mW['value'],mt['value'],mb['value']
        return 2*mWp*((ghtt/(mtop)*Ft(mS))+(ghbb/(mbot)*Fb(mS)))

#Decay width of the Scalar boson into gluon pair
def WidthHgg(ghtt,ghbb,mS):
    '''Width decay for S -> g g
    
    Parameters
    ----------
    ghtt: float also works with numpy or sympy
        Coupling of scalar and top quarks
    ghbb: float also works with numpy or sympy
        Coupling of scalar and top quarks
    mS: float also works with numpy or sympy
        Scalar mass
    Returns
    -------
    float, numpy and sympy instances depend on input
    '''
    global mW, αs
    if issymbolic(ghtt,ghbb,mS):
        mWp = mW['symbol']
        return ((αs['symbol']**2*mS**3)/(512*mWp**2*pi**3 ))*Abs(AHgg(ghtt,ghbb,mS))**2;#####MODIFICADO#######
    else:
        mWp = mW['value']
        return ((αs['value']**2*mS**3)/(512*mWp**2*np.pi**3))*abs(AHgg(ghtt,ghbb,mS))**2;#####MODIFICADO#######

####################################################
# Higgs boson decay into photon pair
####################################################

#Main fermion contribution come from top and bottom quark*

def Aht(ghtt,mS):
    global Qt,mW,mt
    if issymbolic(ghtt,mS):
        qt,mWp,mtop = Qt['symbol'],mW['symbol'],mt['symbol']
    else:
        qt,mWp,mtop = Qt['value'],mW['value'],mt['value']
    return 6*(mWp/mtop)*ghtt*qt**2*Ft(mS)#######MODIFICADO#########ghtt

def Ahb(ghbb,mS):
    global Qb,mW,mb
    if issymbolic(ghbb,mS):
        qb,mWp,mbot = Qb['symbol'],mW['symbol'],mb['symbol']
    else:
        qb,mWp,mbot = Qb['value'],mW['value'],mb['value']
    return 6*(mWp/mbot)*ghbb*qb**2*Fb(mS)#######MODIFICADO#########ghbb

def Af(ghtt,ghbb,mS):
    return Aht(ghtt,mS) + Ahb(ghbb,mS)


#### W contribution
    
def fW(mS):
    global mW
    if issymbolic(mS):
        mWp = mW['symbol']#(S(1)/4)
        x = (4*mWp**2)/(mS**2)
        return -(S(1)/4)*(log((1+sqrt(1-x))/(1-sqrt(1-x)))-I*pi)**2;#######MODIFICADO#########(-I*np.pi)
    else:
        mWp = mW['value']
        x = (4*mWp**2)/(mS**2)
        return -(1.0/4.0)*(np.log((1+np.sqrt(1-x))/(1-np.sqrt(1-x)))-1j*np.pi)**2; #######MODIFICADO#########(-I*np.pi)
def gW(mS):
    global mW
    if issymbolic(mS):
        mWp = mW['symbol']
        x = (4*mWp**2)/(mS**2)
        return asin(1/sqrt(x))**2;#######MODIFICADO#########
    else:
        mWp = mW['value']
        x = (4*mWp**2)/(mS**2)
        return np.arcsin(1/np.sqrt(x))**2;#######MODIFICADO#########

    
def AW(mS):
    global mW
    if issymbolic(mS):
        mWp=mW['symbol']#If[(4*mW^2/(mS^2))>=1,gW[mS],fW[mS]];
        return Piecewise((gW(mS), (4*mWp**2)/(mS**2)>=1), (fW(mS), True))
    else:
        mWp=mW['value']
        return np.where((4*mWp**2)/(mS**2)>=1.0,gW(mS),fW(mS))
    
def FW(mS):
    global mW
    if issymbolic(mS):
        mWp = mW['symbol']
    else:
        mWp = mW['value']
    x = 4*mWp**2/(mS**2)
    return 2+3*x+3*x*(2-x)*AW(mS);#######MODIFICADO#########
    
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
        x = (4*mCH**2)/(mS**2)
        return -(S(1)/4)*(log((1+sqrt(1-x))/(1-sqrt(1-x)))-I*pi)**2;#######MODIFICADO#########(I*pi)
    else:
        x = (4*mCH**2)/(mS**2)
        return -(1.0/4)*(np.log((1+np.sqrt(1-x))/(1-np.sqrt(1-x)))-1j*np.pi)**2;#######MODIFICADO#########(-I*pi)
    
def gH(mCH,mS):
    if issymbolic(mCH,mS):
        x = (4*mCH**2)/(mS**2)
        return asin(1/sqrt(x))**2 
    else:
        x = (4*mCH**2)/(mS**2)
        return np.arcsin(1.0/np.sqrt(x))**2 

def AH(mCH,mS):
    if issymbolic(mCH,mS):
        return Piecewise((gH(mCH,mS), (4*mCH**2)/(mS**2)>=1), (fH(mCH,mS), True))
    else:
        return np.where((4*mCH**2)/(mS**2)>=1.0,gH(mCH,mS),fH(mCH,mS))

def FH(mCH,mS):
    x = 4*mCH**2/(mS**2)
    return x*(1-x*AH(mCH,mS))#######MODIFICADO#########

def AHc(gCH,mCH,mS):
    global mW, cW
    if issymbolic(gCH,mCH,mS):
        mWp = mW['symbol']
    else:
        mWp = mW['value']
    return (mWp*gCH)/(mCH**2)*FH(mCH,mS);

def Ahgaga(ghtt,ghbb,ghWW,gCH,mCH,mS):
    if gCH==0:
        return Af(ghtt,ghbb,mS) + AhW(ghWW,mS)
    else:
        return Af(ghtt,ghbb,mS) + AhW(ghWW,mS) + AHc(gCH,mCH,mS)

#Decay width of scalar boson into photon-photon
def WidthHgaga(ghtt,ghbb,ghWW,gCH,mCH,mS):
    '''Width decay for S -> gamma gamma
    
    Parameters
    ----------
    ghtt: float also works with numpy or sympy
        Coupling of scalar and top quarks
    ghbb: float also works with numpy or sympy
        Coupling of scalar and bottom quarks
    ghWW: float also works with numpy or sympy
        Coupling of scalar and W bosons
    gCH: float also works with numpy or sympy
        Coupling of scalar and charged Higgs wich can appear in 2HDM's
    mCH: float also works with numpy or sympy
        Charged Higgs mass
    mS: float also works with numpy or sympy
        Scalar mass
    
    Returns
    -------
    float, numpy and sympy instances depend on input
    '''
    global mW, αem
    if issymbolic(ghtt,ghbb,ghWW,gCH,mCH,mS):
        mWp = mW['symbol']
        return ((αem['symbol']**2)*(mS**3))/(1024*pi**3*mWp**2)*Abs(Ahgaga(ghtt,ghbb,ghWW,gCH,mCH,mS))**2
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
        x = mVec**2/mS**2
        return -(((1-x)*(47*x**2-13*x+2))/(2*x))-(S(3)/2)*(4*x**2-6*x+1)*log(x)+((3*(20*x**2- 8*x+1))/sqrt(4*x-1))*acos((3*x-1)/(2*x**(S(3)/2)));
    else:
        mVec = mV['value']
        x = mVec**2/mS**2
        return -(((1.0-x)*(47.0*x**2.0-13.0*x+2.0))/(2.0*x))-(3.0/2.0)*(4.0*x**2.0-6.0*x+1.0)*np.log(x)+((3.0*(20.0*x**2.0- 8.0*x+1.0))/np.sqrt(4.0*x-1.0))*np.arccos((3.0*x-1.0)/(2.0*x**(3.0/2.0)));
    
RTW = lambda mS: RT(mS,mW)

RTZ = lambda mS: RT(mS,mZ)


δZ = 7-(40/(3*sW['value']**2))+160/(9*sW['value']**4);

# Decay width of Higgs boson into WW pair
def WidthHWW(ghWW,mS):
    '''Width decay for S -> W W* 
    
    Parameters
    ----------
    ghWW: float also works with numpy or sympy
        Coupling of scalar and W bosons
    mS: float also works with numpy or sympy
        Scalar mass
    
    Returns
    -------
    float, numpy and sympy instances depend on input
    '''
    global mW
    if issymbolic(ghWW,mS):
        mWp = mW['symbol']
        return 3*((ghWW**4)*mS)/(512*(pi**3)*(mWp**4))*RTW(mS)
    else:
        mWp = mW['value']
        return 3*((ghWW**4)*mS)/(512*(np.pi**3)*(mWp**4))*RTW(mS)

# Decay width of Higgs boson into ZZ pair
def WidthHZZ(ghZZ,mS):
    '''Width decay for S -> Z Z*
    
    Parameters
    ----------
    ghZZ: float also works with numpy or sympy
        Coupling of scalar and Z bosons
    mS: float also works with numpy or sympy
        Scalar mass
    
    Returns
    -------
    float, numpy and sympy instances depend on input
    '''
    global mZ, δZ
    if issymbolic(ghZZ,mS):
        mZp = mZ['symbol']
        sZ = symbols(r'\delta_Z',positive=True)
        return 3*((ghZZ**4)*mS)/(2048*(pi**3)*(mZp**4))*sZ*RTZ(mS)
    else:
        mZp = mZ['value']
        return 3*((ghZZ**4)*mS)/(2048*(np.pi**3)*(mZp**4))*δZ*RTZ(mS)

#####################################################################3
# Branchig ratios for higgs -> XX'

# h->fifj
def BRhfifj(ghfifj,Nc,mi,mj):
    '''Branching ratio higgs boson to fermions, h -> fi fj.
    
    Parameters
    ----------
    ghfifj: float also works with numpy or sympy
        Coupling of scalar and fermions
    Nc: int 
        Color charge, 1 for leptons and 3 for quarks.
    mi,mj: float also works with numpy or sympy
        Fermions masses
    
    Returns
    -------
    float, numpy and sympy instances depend on input
    '''
    global mh,TotWidth
    if issymbolic(ghfifj,Nc,mi,mj):
        mhiggs = mh['symbol']
    else:
        mhiggs = mh['value']
    return WidthHff(ghfifj,Nc,mi,mj,mhiggs)/TotWidth

# h->gaga
def BRhgaga(ghtt,ghbb,ghWW,gCH,mCH):
    '''Branching ratio higgs boson to photon pair , h -> gamma gamma.
    
    Parameters
    ----------
    ghtt: float also works with numpy or sympy
        Coupling of scalar and top quarks
    ghbb: float also works with numpy or sympy
        Coupling of scalar and bottom quarks
    ghWW: float also works with numpy or sympy
        Coupling of scalar and W bosons
    gCH: float also works with numpy or sympy
        Coupling of scalar and charged Higgs wich can appear in 2HDM's
    mCH: float also works with numpy or sympy
        Charged Higgs mass
    
    Returns
    -------
    float, numpy and sympy instances depend on input
    '''
    global mh,TotWidth
    if issymbolic(ghtt,ghbb,ghWW,gCH,mCH):
        mhiggs = mh['symbol']
    else:
        mhiggs = mh['value']
    return WidthHgaga(ghtt,ghbb,ghWW,gCH,mCH,mhiggs)/TotWidth
#WidthHgaga(ghtt,ghbb,ghWW,gCH,mCH,mS)
# h->WW
def BRhWW(ghWW):
    '''Branching ratio higgs boson to W bosons pair , h -> W W*.
    
    Parameters
    ----------
    ghWW: float also works with numpy or sympy
        Coupling of scalar and W bosons
    
    Returns
    -------
    float, numpy and sympy instances depend on input
    '''
    global mh, TotWidth
    if issymbolic(ghWW):
        mhiggs = mh['symbol']
    else:
        mhiggs = mh['value']
    return WidthHWW(ghWW,mhiggs)/TotWidth
# h->ZZ
def BRhZZ(ghZZ):
    '''Branching ratio higgs boson to Z bosons pair , h -> Z Z*.
    
    Parameters
    ----------
    ghZZ: float also works with numpy or sympy
        Coupling of scalar and Z bosons
    
    Returns
    -------
    float, numpy and sympy instances depend on input
    '''
    global mh , TotWidth
    if issymbolic(ghZZ):
        mhiggs = mh['symbol']
    else:
        mhiggs = mh['value']
    return WidthHZZ(ghZZ,mhiggs)/TotWidth

# h->ZZ
def BRhgg(ghtt,ghbb):
    '''Branching ratio higgs boson to gluons pair , h -> g g.
    
    Parameters
    ----------
    ghtt: float also works with numpy or sympy
        Coupling of scalar and top quarks
    ghbb: float also works with numpy or sympy
        Coupling of scalar and top quarks
    
    Returns
    -------
    float, numpy and sympy instances depend on input
    '''
    global mh, TotWidth
    if issymbolic(ghtt,ghbb):
        mhiggs = mh['symbol']
    else:
        mhiggs = mh['value']
    return WidthHgg(ghtt,ghbb,mhiggs)/TotWidth

###############################################################################
#Signal Strenghts
###############################################################################
#Rb
def Rbotbot(ghtt,ghbb):
    '''Signal Strenght to h->bb
    
    Parameters
    ----------
    ghtt: float also works with numpy or sympy
        Coupling of Higgs boson and top quarks
    ghbb: float also works with numpy or sympy
        Coupling of Higgs boson and top quarks
    
    Returns
    -------
    float, numpy and sympy instances depend on input
    '''
    global mh,mt,mb,mW,g
    if issymbolic(ghtt,ghbb):
        mhiggs,mtop,mbot,mWp,gg = mh['symbol'],mt['symbol'],mb['symbol'],mW['symbol'],g['symbol']
    else:
        mhiggs,mtop,mbot,mWp,gg = mh['value'],mt['value'],mb['value'],mW['value'],g['value']
    return (WidthHgg(ghtt,ghbb,mhiggs)*BRhfifj(ghbb, 3, mbot, mbot))/(WidthHgg(gg*mtop/(2*mWp),gg*mbot/(2*mWp),mhiggs)*BRhfifj(gg*mbot/(2*mWp), 3, mbot, mbot))

#Rtau
def Rtautau(ghtt,ghbb,ghtautau):
    '''Signal Strenght to h->tau tau
    
    Parameters
    ----------
    ghtt: float also works with numpy or sympy instances
        Coupling of Higgs boson and top quarks
    ghbb: float also works with numpy or sympy instnaces
        Coupling of Higgs boson and top quarks
    ghtautau: float also works with numpy or sympy instnaces
        Coupling of Higgs boson and tau leptons
    
    Returns
    -------
    float, numpy and sympy instances depend on input
    '''
    global mh,mt,mb,mtau,mW,g
    if issymbolic(ghtt,ghbb,ghtautau):
        mhiggs,mtop,mbot,mta,mWp,gg = mh['symbol'],mt['symbol'],mb['symbol'],mtau['symbol'],mW['symbol'],g['symbol']
    else:
        mhiggs,mtop,mbot,mta,mWp,gg = mh['value'],mt['value'],mb['value'],mtau['value'],mW['value'],g['value']
    return (WidthHgg(ghtt,ghbb,mhiggs)*BRhfifj(ghtautau, 1, mta, mta))/(WidthHgg(gg*mtop/(2*mWp),gg*mbot/(2*mWp),mhiggs)*BRhfifj(gg*mta/(2*mWp), 1, mta, mta));

#RW
def RWW(ghtt,ghbb,ghWW):
    '''
    Signal Strenght to h -> W W*.
    
    Parameters
    ----------
    ghWW: float also works with numpy or sympy instances
        Coupling of Higgs boson and W bosons
    
    Returns
    -------
    float, numpy and sympy instances depend on input
    '''    
    #global data.mh,data.mt,data.mb,data.mW
    if issymbolic(ghtt,ghbb,ghWW):
        mhiggs,mtop,mbot,mWp,gg,ggw = mh['symbol'],mt['symbol'],mb['symbol'],mW['symbol'],g['symbol'],gw['symbol']
    else:
        mhiggs,mtop,mbot,mWp,gg,ggw = mh['value'],mt['value'],mb['value'],mW['value'],g['value'],gw['value']
    return (WidthHgg(ghtt,ghbb,mhiggs)*BRhWW(ghWW))/(WidthHgg(gg*mtop/(2*mWp),gg*mbot/(2*mWp),mhiggs)*BRhWW(ggw*mWp))

#RZ
def RZZ(ghtt,ghbb,ghZZ):
    '''
    Signal Strenght to h -> Z Z*.
    
    Parameters
    ----------
    ghZZ: float also works with numpy or sympy instances
        Coupling of Higgs boson and W bosons
    
    Returns
    -------
    float, numpy and sympy instances depend on input
    '''    
    global mh,mt,mb,mW
    if issymbolic(ghtt,ghbb,ghZZ):
        mhiggs,mtop,mbot,mZp,mWp,gg,ggz = mh['symbol'],mt['symbol'],mb['symbol'],mZ['symbol'],mW['symbol'],g['symbol'],gz['symbol']
    else:
        mhiggs,mtop,mbot,mZp,mWp,gg,ggz = mh['value'],mt['value'],mb['value'],mZ['value'],mW['value'],g['value'],gz['value']
    return (WidthHgg(ghtt,ghbb,mhiggs)*BRhZZ(ghZZ))/(WidthHgg(gg*mtop/(2*mWp),gg*mbot/(2*mWp),mhiggs)*BRhZZ(ggz*mZp))#Es mZ o mW

#Rga
def Rgaga(ghtt,ghbb,ghWW,gCH,mCH):
    '''Signal Strenght to h->gamma gamma
    
    Parameters
    ----------
    ghtt: float also works with numpy or sympy instances
        Coupling of Higgs boson and top quarks
    ghbb: float also works with numpy or sympy instances
        Coupling of Higgs boson and top quarks
    ghWW: float also works with numpy or sympy instances
        Coupling of Higgs boson and W bosons
    gCH: float also works with numpy or sympy instances
        Coupling of Higgs boson and charged
    mCH: float also works with numpy or sympy instances
        Charged scalar mass
    
    Returns
    -------
    float, numpy and sympy instances depend on input
    '''
    global mh,mt,mb,mW
    if issymbolic(ghtt,ghbb,ghWW,gCH,mCH):
        mhiggs,mtop,mbot,mWp,gg,ggw = mh['symbol'],mt['symbol'],mb['symbol'],mW['symbol'],g['symbol'],gw['symbol']
    else:
        mhiggs,mtop,mbot,mWp,gg,ggw = mh['value'],mt['value'],mb['value'],mW['value'],g['value'],gw['value']
    return (WidthHgg(ghtt,ghbb,mhiggs)*BRhgaga(ghtt,ghbb,ghWW,gCH,mCH))/(WidthHgg(gg*mtop/(2*mWp),gg*mbot/(2*mWp),mhiggs)*BRhgaga(gg*mtop/(2*mWp),gg*mbot/(2*mWp),ggw*mWp,0,mCH))####¿?#####
#BRhgaga(ghtt,ghbb,ghWW,gCH,mCH)
#Rg
def Rgg(ghtt,ghbb):
    '''Signal Strenght to h->gamma gamma
    
    Parameters
    ----------
    ghtt: float also works with numpy or sympy instances
        Coupling of Higgs boson and top quarks
    ghbb: float also works with numpy or sympy instnaces
        Coupling of Higgs boson and top quarks
    
    Returns
    -------
    float, numpy and sympy instances depend on input
    '''
    global mh,mt,mb,mW
    if issymbolic(ghtt,ghbb):
        mhiggs,mtop,mbot,mWp,gg = mh['symbol'],mt['symbol'],mb['symbol'],mW['symbol'],g['symbol']
    else:
        mhiggs,mtop,mbot,mWp,gg = mh['value'],mt['value'],mb['value'],mW['value'],g['value']
    return WidthHgg(ghtt,ghbb,mhiggs)*BRhgg(ghtt,ghbb)/(WidthHgg(gg*mtop/(2*mWp),gg*mbot/(2*mWp),mhiggs)*BRhgg(gg*mtop/(2*mWp),gg*mbot/(2*mWp)))

if __name__=='__main__':
    print('All right RXX')
