(* Wolfram Language Package *)


(*value of masses(units given in GeV )*)
(*Reference: M. Tanabashi et al. (Particle Data Group), Phys. Rev. D 98, 030001 (2018).*)

mtau::usage = "tau mass"
mmu::usage="muon mass"
me::usage="electron mass"
mu::usage="up quark mass"

md::usage="down quark mass" 
mc::usage="charm quark mass"
ms::usage="strange quark mass"
mt::usage="top quark mass"
mb::usage="bottom quark mass"
mh::usage="Higgs boson mass"
mW::usage="W gauge boson mass"
mZ::usage="Z gauge boson mass"

(*value of constants*)
vev::usage="vacumm expectation value"
\[Alpha]em::usage="structure fine constant"
ee::usage="electric charge"
g::usage="2 mW/vev"
\[Alpha]s::usage="strong alpha"
CW::usage="cosine of Weinberg angle"
SW::usage="sine of Weinberg angle"
gw::usage="Weak constant coupling (W)"
gz::usage="Weak constant coupling (Z)"
ge::usage="electric charge"
GF::usage="Fermi constant"

(*value of bounds*)
(* Higgs data *)
(*Epsilon to 2\[Sigma]*)
(*Reference: P. P. Giardino, K. Kannike, I. Masina, M. Raidal, and A. Strumia, J. High Energy Phys. 05 (2014) 046.*)
EpstopSUP::usage="See later."
EpstopINF::usage="See later."
EpsbotSUP::usage="See later."
EpsbotINF::usage="See later."
EpstauSUP::usage="See later."
EpstauINF::usage="See later."
EpsZSUP::usage="See later."
EpsZINF::usage="See later."
EpsWSUP::usage="See later."
EpsWINF::usage="See later."

(*Signal Strengths*)
(*Reference: ARXIV:1809.10733*)
(*central values for gluon production*)
Rbb::usage="See later."
Rtautau::usage="See later."
Rww::usage="See later."
Rzz::usage="See later."
Rgammagamma::usage="See later."

(*Signal Strengths to 2\[Sigma]*)
(*Reference: ARXIV:1809.10733*)
RbbSUP2sig::usage="See later."
RbbINF2sig::usage="See later."
RtautauSUP2sig::usage="See later."
RtautauINF2sig::usage="See later."
RwwSUP2sig::usage="See later."
RwwINF2sig::usage="See later."
RzzSUP2sig::usage="See later."
RzzINF2sig::usage="See later."
RgammagammaINF2sig::usage="See later."
RgammagammaSUP2sig::usage="See later."

(*Signal Strengths to 1\[Sigma]*)
(*Reference: ARXIV:1809.10733*)
RbbSUP1sig::usage="See later."
RbbINF1sig::usage="See later."
RtautauSUP1sig::usage="See later."
RtautauINF1sig::usage="See later."
RwwSUP1sig::usage="See later."
RwwINF1sig::usage="See later."
RzzSUP1sig::usage="See later."
RzzINF1sig::usage="See later."
RgammagammaINF1sig::usage="See later."
RgammagammaSUP1sig::usage="See later."

(*kappa-parametrization*)
(*central values*)
kappaZ::usage="See later."
kappaW::usage="See later."
kappaTop::usage="See later."
kappaTau1::usage="See later."
kappaBot::usage="See later."
kappaGluon::usage="See later."
kappaGamma::usage="See later."

(*kappaX to 2\[Sigma]*)
(*Reference: ARXIV:1809.10733*)
kappaZSUP2sig::usage="See later."
kappaZINF2sig::usage="See later."
kappaWSUP2sig::usage="See later."
kappaWINF2sig::usage="See later."
kappaTopSUP2sig::usage="See later."
kappaTopINF2sig::usage="See later."
kappaTauSUP2sig::usage="See later."
kappaTauINF2sig::usage="See later."
kappaBotSUP2sig::usage="See later."
kappaBotINF2sig::usage="See later."
kappaGluonSUP2sig::usage="See later."
kappaGluonINF2sig::usage="See later."
kappaGammaSUP2sig::usage="See later."
kappaGammaINF2sig::usage="See later."

(*kappaX to 1\[Sigma]*)
(*Reference: ARXIV:1809.10733*)
kappaZSUP1sig::usage="See later."
kappaZINF1sig::usage="See later."
kappaWSUP1sig::usage="See later."
kappaWINF1sig::usage="See later."
kappaTopSUP1sig::usage="See later."
kappaTopINF1sig::usage="See later."
kappaTauSUP1sig::usage="See later."
kappaTauINF1sig::usage="See later."
kappaBotSUP1sig::usage="See later."
kappaBotINF1sig::usage="See later."
kappaGluonSUP1sig::usage="See later."
kappaGluonINF1sig::usage="See later."
kappaGammaSUP1sig::usage="See later."
kappaGammaINF1sig::usage="See later."

(* LFV processes *)
(*Reference: M. Tanabashi et al. (Particle Data Group), Phys. Rev. D 98, 030001 (2018)*)
BRMUtoEgamma::usage="Upper bound of the mu\[Rule] e gamma decay"
BRMUtoEEE::usage="Upper bound of the mu\[Rule] 3e decay"
BRTAUtoMUgamma::usage="Upper bound of the tau\[Rule] mu gamma decay"
BRTAUtoEgamma::usage="Upper bound of the tau\[Rule] e gamma decay"
BRTAUtoEEE::usage="Upper bound of the tau\[Rule] 3e decay"
BRTAUtoMUMUMU::usage="Upper bound of the tau\[Rule] 3\[Mu] decay"
BRHtoTAUMU::usage="Upper bound of the h\[Rule] tau mu decay"
GF::usage="Fermi constant"
Ttau::usage="tau lifetime"
TotWidh::usage="Total width of the Higgs boson"
aMUInf::usage="lower limit of the discrepancy interval of the muon anomalous magnetic dipole moment"
aMUSup::usage="upper limit of the discrepancy interval of the muon anomalous magnetic dipole moment"
aSM::usage="Theoretical prediction of the SM for the muon anomalous magnetic dipole moment"
aEXP::usage="Experimental value for the muon anomalous magnetic dipole moment"
BRTAUtolnunu::usage="Branching ratio of the tau \[Rule] l nu nu decay"
dmuINF::usage="lower limit of the muon alectric dipole moment"
dmuSUP::usage="upper limit of the muon alectric dipole moment"

(* b-s gamma *)
bsgammaINF3sigma::usage="See later."
bsgammaSUP3sigma::usage="See later."

(* ------------------------------------------------------------------------ *)

Begin["`Package`"]
End[]

Begin["`Values`Private`"]

mtau = 1.77686; (*tau mass*)
mmu = 0.1056583745; (*muon mass*) 
me = 0.0005109989461; (*electron mass*)
mu = 0.0022; (*up quark mass*)
md = 0.0047; (*down quark mass*) 
mc = 1.275; (*charm quark mass*)
ms = 0.095; (*strange quark mass*)
mt = 173.21; (*top quark mass*) 
mb = 4.18; (*bottom quark*) 
mh = 125.18; (*Higgs boson mass*)
mW = 80.379; (*W gauge boson mass*)
mZ = 91.1876; (*Z gauge boson mass*)

(*value of constants*)
vev = 246; (*vacumm expectation value*)
\[Alpha]em =1/137; (*structure fine constant*)
ee=Sqrt[4*\[Pi]*\[Alpha]em ]; (*electric charge*)
g= 2 mW/vev;
\[Alpha]s=0.11; (*strong alpha*)
CW=mW/mZ; (*cosine of Weinberg angle*)
SW=Sqrt[1-(CW^2)]; (*sine of Weinberg angle*)
gw=ge/SW; (*Weak constant coupling (W)*)
gz=gw/CW; (*Weak constant coupling (Z)*)
ge=Sqrt[4 \[Pi] \[Alpha]em]; (*electric charge*)
GF=1.16637^-5; (*Fermi constant*)

(*value of bounds*)
(* Higgs data *)
(*Epsilon to 2\[Sigma]*)
(*Reference: P. P. Giardino, K. Kannike, I. Masina, M. Raidal, and A. Strumia, J. High Energy Phys. 05 (2014) 046.*)
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

(*Signal Strengths*)
(*Reference: ARXIV:1809.10733*)
(*central values for gluon production*)
Rbb = 1.02;
Rtautau = 1.11;
Rww = 1.08;
Rzz = 1.19;
Rgammagamma = 1.10;

(*Signal Strengths to 2\[Sigma]*)
(*Reference: ARXIV:1809.10733*)
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

(*Signal Strengths to 1\[Sigma]*)
(*Reference: ARXIV:1809.10733*)
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

(*kappa-parametrization*)
(*central values*)
kappaZ=1.01;
kappaW=1.01;
kappaTop=1.04;
kappaTau=1.0;
kappaBot=0.94;
kappaGluon=1.02;
kappaGamma=0.97;

(*kappaX to 2\[Sigma]*)
(*Reference: arXiv:1902.00134v2[hep-ph], Table 42*)
kappaZSUP2sig=1.13;
kappaZINF2sig=0.89;
kappaWSUP2sig=1.13;
kappaWINF2sig=0.0.89;
kappaTopSUP2sig=1.23009;
kappaTopINF2sig=0.849912;
kappaTauSUP2sig=1.21;
kappaTauINF2sig=0.69;<-----------
kappaBotSUP2sig=1.12006;
kappaBotINF2sig=0.579938;
kappaGluonSUP2sig=1.16009;
kappaGluonINF2sig=0.779912;
kappaGammaSUP2sig=1.11115;
kappaGammaINF2sig=0.848851;


(*kappaX to 1\[Sigma]*)
(*Reference: arXiv:1902.00134v2[hep-ph], Table 42*)

kappaZSUP1sig=1.07;
kappaZINF1sig=0.95;
kappaWSUP1sig=1.07;
kappaWINF1sig=0.95;
kappaTopSUP1sig=1.13504;
kappaTopINF1sig=0.944956;<-----------------
kappaTauSUP1sig=kappaTau1+0.13;
kappaTauINF1sig=kappaTau1-0.13;
kappaBotSUP1sig=kappaBot+0.13;
kappaBotINF1sig=kappaBot-0.14;
kappaGluonSUP1sig=kappaGluon+0.10;
kappaGluonINF1sig=kappaGluon-0.09;
kappaGammaSUP1sig=kappaGamma+0.05;
kappaGammaINF1sig=kappaGamma-0.08;
(********************************************************************************************************)
(********************************************************************************************************)
(********************************************************************************************************)
(*kappaX to 1\[Sigma]*)
(*Projection for kappa top at HL-LHC to 1 sigma, taken from arXiv:1902.00134v2[hep-ph]*)
kappaZSUP1sigHL=1.027;
kappaZINF1sigHL=0.993;
kappaWSUP1sigHL=1.027;
kappaWINF1sigHL=0.993;
kappaTopSUP1sigHL=1.08;
kappaTopINF1sigHL=1;<-----------
kappaTauSUP1sigHL=kappaTau1+0.13;
kappaTauINF1sigHL=kappaTau1-0.13;
kappaBotSUP1sigHL=kappaBot+0.13;
kappaBotINF1sigHL=kappaBot-0.14;
kappaGluonSUP1sigHL=kappaGluon+0.10;
kappaGluonINF1sigHL=kappaGluon-0.09;
kappaGammaSUP1sigHL=kappaGamma+0.05;
kappaGammaINF1sigHL=kappaGamma-0.08;


(*kappaX to 2\[Sigma]*)
(*Projection for kappa top at HL-LHC to 2 sigma, taken from arXiv:1902.00134v2[hep-ph]*)
kappaZSUP2sigHL=1.044;
kappaZINF2sigHL=0.976;
kappaWSUP2sigHL=1.044;
kappaWINF2sigHL=0.976;
kappaTopSUP2sigHL=1.12;
kappaTopINF2sigHL=0.96;<-----------
kappaTauSUP2sigHL=kappaTau1+0.13;
kappaTauINF2sigHL=kappaTau1-0.13;
kappaBotSUP2sigHL=kappaBot+0.13;
kappaBotINF2sigHL=kappaBot-0.14;
kappaGluonSUP2sigHL=kappaGluon+0.10;
kappaGluonINF2sigHL=kappaGluon-0.09;
kappaGammaSUP2sigHL=kappaGamma+0.05;
kappaGammaINF2sigHL=kappaGamma-0.08;


(********************************************************************************************************)
(********************************************************************************************************)
(********************************************************************************************************)
(*kappaX to 1\[Sigma]*)
(*Projection for kappa at HE-LHC to 1 sigma, taken from arXiv:1902.00134v2[hep-ph]*)
kappaZSUP1sigHE=1.019;
kappaZINF1sigHE=1.001;
kappaWSUP1sigHE=1.019;
kappaWINF1sigHE=1.001;
kappaTopSUP1sigHE=1.065;
kappaTopINF1sigHE=1.015;<-----------
kappaTauSUP1sigHE=kappaTau1+0.13;
kappaTauINF1sigHE=kappaTau1-0.13;
kappaBotSUP1sigHE=kappaBot+0.13;
kappaBotINF1sigHE=kappaBot-0.14;
kappaGluonSUP1sigHE=kappaGluon+0.10;
kappaGluonINF1sigHE=kappaGluon-0.09;
kappaGammaSUP1sigHE=kappaGamma+0.05;
kappaGammaINF1sigHE=kappaGamma-0.08;


(*kappaX to 2\[Sigma]*)
(*Projection for kappa at HE-LHC to 2 sigma, taken from arXiv:1902.00134v2[hep-ph]*)
kappaZSUP2sigHE=1.028;
kappaZINF2sigHE=0.992;
kappaWSUP2sigHE=1.028;
kappaWINF2sigHE=0.992;
kappaTopSUP2sigHE=1.09;
kappaTopINF2sigHE=0.99;<-----------
kappaTauSUP2sigHE=kappaTau1+0.13;
kappaTauINF2sigHE=kappaTau1-0.13;
kappaBotSUP2sigHE=kappaBot+0.13;
kappaBotINF2sigHE=kappaBot-0.14;
kappaGluonSUP2sigHE=kappaGluon+0.10;
kappaGluonINF2sigHE=kappaGluon-0.09;
kappaGammaSUP2sigHE=kappaGamma+0.05;
kappaGammaINF2sigHE=kappaGamma-0.08;


(********************************************************************************************************)
(********************************************************************************************************)
(********************************************************************************************************)

(* LFV processes *)
(*Reference: M. Tanabashi et al. (Particle Data Group), Phys. Rev. D 98, 030001 (2018)*)
BRMUtoEgamma=4.2*(10^(-13)); (*Upper bound of the mu\[Rule] e gamma decay*)
BRMUtoEEE=1*(10^(-12)); (*Upper bound of the mu\[Rule] 3e decay*)
BRTAUtoMUgamma=4.4*(10^(-8)); (*Upper bound of the tau\[Rule] mu gamma decay*)
BRTAUtoEgamma=3.3*(10^(-8)); (*Upper bound of the tau\[Rule] e gamma decay*)
BRTAUtoEEE=2.7*(10^(-8)); (*Upper bound of the tau\[Rule] 3e decay*)
BRTAUtoMUMUMU=2.7*(10^(-8)); (*Upper bound of the tau\[Rule] 3\[Mu] decay*)
BRHtoTAUMU=0.0025; (*Upper bound of the h\[Rule] tau mu decay*)
(* GF=1.1663787*(10^-5); (*Fermi constant*) *)
Ttau=(2.906*10^-13) ((1/6.582)*10^25); (*tau lifetime*)
TotWidh=0.0047; (*Total width of the Higgs boson*)
aMUInf=1.32*10^-9; (*lower limit of the discrepancy interval of the muon anomalous magnetic dipole moment*)
aMUSup=4.44*10^-9; (*upper limit of the discrepancy interval of the muon anomalous magnetic dipole moment*)
aSM=11659179*10^-10; (*Theoretical prediction of the SM for the muon anomalous magnetic dipole moment*)
aEXP=116592091*10^-11; (*Experimental value for the muon anomalous magnetic dipole moment*)
BRTAUtolnunu=0.17; (*Branching ratio of the tau \[Rule] l nu nu decay*)
dmuINF=-10*(10^-20); (*lower limit of the muon alectric dipole moment*)
dmuSUP=8*(10^-20);

(* B-physics *)
(*
TwoSigBmumuSUP=4.301110699893027*(10^-9) (*experimental
bounds satisfing two standard deviations for B0s into 2mu decay*),
TwoSigBmumuINF=1.2988893001069727*(10^-9) (*experimental
bounds satisfing two standard deviations for B0s into 2mu decay*),
mB0s = 5.36689 (*B0s meson mass*),
TB0s=0.0227*(10^13) (*Lifetime of the B0s meson*),
fB0s=0.242,  (*B0s decay constant*)
BRBmesonTOmumuSM=3.66*(10^-9) (*Branching ratio of the B to mumu decay*)
BRexpBdTOmumu=9.4*(10^(-10))
*)

(* b-s gamma *)
bsgammaINF3sigma = 0.000259;
bsgammaSUP3sigma = \!\(TraditionalForm\`0.000427\);



End[]