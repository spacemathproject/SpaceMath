from sympy import symbols, S
from numpy import sqrt, pi
#####################3
#masses
######################
mt = {'value':173.21,'units':'GeV','symbol':symbols('m_t',positive=True)}
mb = {'value':4.18,'units':'GeV','symbol':symbols('m_b',positive=True)}
mta = {'value':1.77686,'units':'GeV','symbol':symbols(r'm_{\tau}',positive=True)}
mW = {'value':80.379,'units':'GeV','symbol':symbols('m_W',positive=True)}
mZ = {'value':91.1876,'units':'GeV','symbol':symbols('m_Z',positive=True)}
mh = {'value':125.18,'units':'GeV','symbol':symbols('m_h',positive=True)}

#mCH = {'value':200.0,'units':'GeV','symbol':symbols(r'm_{H^{\pm}}',positive=True)}
#######################
#constants
#######################
SMvev = {'value':246,'units':'GeV','symbol':symbols('v',positive=True)}
GF = {'value':1.16637e-5,'units':'GeV','symbol':symbols('G_F',positive=True)}
αs = {'value':0.11,'units':None,'symbol':symbols(r'\alpha_s',positive=True)}
αem = {'value':1.0/137.03599911,'units':None,'symbol':symbols(r'\alpha_{e}',positive=True)}
cW = {'value':mW['value']/mZ['value'],'units':'GeV','symbol':symbols('c_W',real=True)}
sW = {'value':sqrt(1-cW['value']**2),'units':'GeV','symbol':symbols('s_W',real=True)}
g = {'value':2*(mW['value']/SMvev['value']),'unit':None,'symbol':symbols('g',real=True)}
ge = {'value':sqrt(4*pi*αem['value']),'unit':None,'symbol':symbols('g_e',real=True)}
gw = {'value':ge['value']/sW['value'],'unit':None,'symbol':symbols('g_w',real=True)}
gz = {'value':gw['value']/cW['value'],'unit':None,'symbol':symbols('g_z',real=True)}


Qt = {'value':2.0/3,'units':'|e|','symbol':S(2)/3}
Qb = {'value':-1.0/3,'units':'|e|','symbol':-S(1)/3}

####################################################33
# Value of bounds
######################################################3
#Higgs data
#Reference: P. P. Giardino, K. Kannike, I. Masina, M. Raidal, and A. Strumia, J. High Energy Phys. 05 (2014) 046.
EpstopSUP=0.01;
EpstopINF=-0.43;
EpsbotSUP=-0.19+0.28;
EpsbotINF=-0.19-0.28;
EpstauSUP=-0.03+0.17;
EpstauINF=-0.03-0.17;
EpsZSUP=0+0.1;
EpsZINF=0-0.1;
EpsWSUP=-0.2+0.13;
EpsWINF=-0.2-0.13;

#Signal Strengths
#Reference: ARXIV:1809.10733
#central values for gluon production
Rbb = 1.02;
Rtautau = 1.11;
Rww = 1.08;
Rzz = 1.19;
Rgammagamma = 1.10;

#Signal Strengths to 2σ
#Reference: ARXIV:1809.10733
RbbSUP2sig=1.32;
RbbINF2sig=0.72;
RtautauSUP2sig=1.45;
RtautauINF2sig=0.77;
RwwSUP2sig=1.4202;
RwwINF2sig=0.739804;
RzzSUP2sig=1.42007;
RzzINF2sig=0.959928;
RgammagammaINF2sig=0.909912;
RgammagammaSUP2sig=1.29009;

#Signal Strengths to 1σ
#Reference: ARXIV:1809.10733
RbbSUP1sig=1.17;
RbbINF1sig=0.87;
RtautauSUP1sig=1.28;
RtautauINF1sig=0.94;
RwwSUP1sig=1.2501;
RwwINF1sig=0.909902;
RzzSUP1sig=1.30504;
RzzINF1sig=1.07496;
RgammagammaINF1sig=1.00496;
RgammagammaSUP1sig=1.19504;

#kappa-parametrization
#central values
kappaZ=0.99;
kappaW=1.10;
kappaTop=1.11;
kappaTau1=1.01;
kappaBot=-1.10;
kappaGluon=1.18;
kappaGamma=1.07;

#kappaX to 2σ
#Reference: ARXIV:1809.10733
kappaZSUP2sig=1.22;
kappaZINF2sig=0.78;
kappaWSUP2sig=1.45;
kappaWINF2sig=0.81;
kappaTopSUP2sig=1.26;
kappaTopINF2sig=0.7;
kappaTauSUP2sig=1.36;
kappaTauINF2sig=0.68;
kappaBotSUP2sig=1.75046;
kappaBotINF2sig=0.58954;
kappaGluonSUP2sig=1.48022;
kappaGluonINF2sig=0.879778;
kappaGammaSUP2sig=1.36006;
kappaGammaINF2sig=0.779943;

#kappaX to 1σ
#Reference: ARXIV:1809.10733
kappaZSUP1sig=1.00+0.11;
kappaZINF1sig=1.00-0.11;
kappaWSUP1sig=1.13+0.16;
kappaWINF1sig=1.13-0.16;
kappaTopSUP1sig=0.98+0.14;
kappaTopINF1sig=0.98-0.14;
kappaTauSUP1sig=1.02+0.17;
kappaTauINF1sig=1.02-0.17;
kappaBotSUP1sig=1.17+0.27;
kappaBotINF1sig=1.17-0.31;
kappaGluonSUP1sig=1.18+0.16;
kappaGluonINF1sig=1.18-0.14;
kappaGammaSUP1sig=1.07+0.14;
kappaGammaINF1sig=1.07-0.15;

# LFV processes 
#Reference: M. Tanabashi et al. (Particle Data Group), Phys. Rev. D 98, 030001 (2018)
BRMUtoEgamma=4.2*(10^(-13)); #Upper bound of the mu\[Rule] e gamma decay
BRMUtoEEE=1*(10^(-12)); #Upper bound of the mu\[Rule] 3e decay
BRTAUtoMUgamma=4.4*(10^(-8)); #Upper bound of the tau\[Rule] mu gamma decay
BRTAUtoEgamma=3.3*(10^(-8)); #Upper bound of the tau\[Rule] e gamma decay
BRTAUtoEEE=2.7*(10^(-8)); #Upper bound of the tau\[Rule] 3e decay
BRTAUtoMUMUMU=2.7*(10^(-8)); #Upper bound of the tau\[Rule] 3\[Mu] decay
BRHtoTAUMU=0.0025; #Upper bound of the h\[Rule] tau mu decay
#GF=1.1663787*(10^-5); (*Fermi constant*) 

Ttau=(2.906e-13)*((1/6.582)*10**25); #tau lifetime
TotWidth=0.0041; #Total width of the Higgs boson
aMUInf=1.32e-9; #lower limit of the discrepancy interval of the muon anomalous magnetic dipole moment
aMUSup=4.44e-9; #upper limit of the discrepancy interval of the muon anomalous magnetic dipole moment
aSM=11659179e-10; #Theoretical prediction of the SM for the muon anomalous magnetic dipole moment
aEXP=116592091e-11; #Experimental value for the muon anomalous magnetic dipole moment
BRTAUtolnunu=0.17; #Branching ratio of the tau \[Rule] l nu nu decay
dmuINF=-10*(10**-20); #lower limit of the muon alectric dipole moment
dmuSUP=8*(10**-20);

#print('linea final')