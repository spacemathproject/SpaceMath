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
EpstopSUP::usage="Value of bounds: EpstopSUP"
EpstopINF::usage="Value of bounds: EpstopINF"
EpsbotSUP::usage="Value of bounds: EpsbotSUP"
EpsbotINF::usage="Value of bounds: EpsbotINF"
EpstauSUP::usage="Value of bounds: EpstauSUP"
EpstauINF::usage="Value of bounds: EpstauINF"
EpsZSUP::usage="Value of bounds: EpsZSUP"
EpsZINF::usage="Value of bounds: EpsZINF"
EpsWSUP::usage="Value of bounds: EpsWSUP"
EpsWINF::usage="Value of bounds: EpsWINF"

(*Signal Strengths*)
(*Reference: ARXIV:1809.10733*)
(*central values for gluon production*)
Rbb::usage="Signal Strengths: Rbb"
Rtautau::usage="Signal Strengths: Rtautau"
Rww::usage="Signal Strengths: Rww"
Rzz::usage="Signal Strengths: Rzz"
Rgammagamma::usage="Signal Strengths: Rgammagamma"

(*Signal Strengths to 2\[Sigma]*)
(*Reference: ARXIV:1809.10733*)
RbbSUP2sig::usage="Signal Strengths to 2\[Sigma]: RbbSUP2sig"
RbbINF2sig::usage="Signal Strengths to 2\[Sigma]: RbbINF2sig"
RtautauSUP2sig::usage="Signal Strengths to 2\[Sigma]: RtautauSUP2sig"
RtautauINF2sig::usage="Signal Strengths to 2\[Sigma]: RtautauINF2sig"
RwwSUP2sig::usage="Signal Strengths to 2\[Sigma]: RwwSUP2sig"
RwwINF2sig::usage="Signal Strengths to 2\[Sigma]: RwwINF2sig"
RzzSUP2sig::usage="Signal Strengths to 2\[Sigma]: RzzSUP2sig"
RzzINF2sig::usage="Signal Strengths to 2\[Sigma]: RzzINF2sig"
RgammagammaINF2sig::usage="Signal Strengths to 2\[Sigma]: RgammagammaINF2sig"
RgammagammaSUP2sig::usage="Signal Strengths to 2\[Sigma]: RgammagammaSUP2sig"

(*Signal Strengths to 1\[Sigma]*)
(*Reference: ARXIV:1809.10733*)
RbbSUP1sig::usage="Signal Strengths to 1\[Sigma]: RbbSUP1sig"
RbbINF1sig::usage="Signal Strengths to 1\[Sigma]: RbbINF1sig"
RtautauSUP1sig::usage="Signal Strengths to 1\[Sigma]: RtautauSUP1sig"
RtautauINF1sig::usage="Signal Strengths to 1\[Sigma]: RtautauINF1sig"
RwwSUP1sig::usage="Signal Strengths to 1\[Sigma]: RwwSUP1sig"
RwwINF1sig::usage="Signal Strengths to 1\[Sigma]: RwwINF1sig"
RzzSUP1sig::usage="Signal Strengths to 1\[Sigma]: RzzSUP1sig"
RzzINF1sig::usage="Signal Strengths to 1\[Sigma]: RzzINF1sig"
RgammagammaINF1sig::usage="Signal Strengths to 1\[Sigma]: "
RgammagammaSUP1sig::usage="Signal Strengths to 1\[Sigma]: "

(*kappa-parametrization*)
(*central values*)
kappaZ::usage="kappa-parametrization: kappaZ"
kappaW::usage="kappa-parametrization: kappaW"
kappaTop::usage="kappa-parametrization: kappaTop"
kappaTau1::usage="kappa-parametrization: kappaTau1"
kappaBot::usage="kappa-parametrization: kappaBot"
kappaGluon::usage="kappa-parametrization: kappaGluon"
kappaGamma::usage="kappa-parametrization: kappaGamma"

(*kappaX to 2\[Sigma]*)
(*Reference: ARXIV:1809.10733*)
kappaZSUP2sig::usage="kappaX to 2\[Sigma]: kappaZSUP2sig"
kappaZINF2sig::usage="kappaX to 2\[Sigma]: kappaZINF2sig"
kappaWSUP2sig::usage="kappaX to 2\[Sigma]: kappaWSUP2sig"
kappaWINF2sig::usage="kappaX to 2\[Sigma]: kappaWINF2sig"
kappaTopSUP2sig::usage="kappaX to 2\[Sigma]: kappaTopSUP2sig"
kappaTopINF2sig::usage="kappaX to 2\[Sigma]: kappaTopINF2sig"
kappaTauSUP2sig::usage="kappaX to 2\[Sigma]: kappaTauSUP2sig"
kappaTauINF2sig::usage="kappaX to 2\[Sigma]: kappaTauINF2sig"
kappaBotSUP2sig::usage="kappaX to 2\[Sigma]: kappaBotSUP2sig"
kappaBotINF2sig::usage="kappaX to 2\[Sigma]: kappaBotINF2sig"
kappaGluonSUP2sig::usage="kappaX to 2\[Sigma]: kappaGluonSUP2sig"
kappaGluonINF2sig::usage="kappaX to 2\[Sigma]: kappaGluonINF2sig"
kappaGammaSUP2sig::usage="kappaX to 2\[Sigma]: kappaGammaSUP2sig"
kappaGammaINF2sig::usage="kappaX to 2\[Sigma]: kappaGammaINF2sig"

(*kappaX to 1\[Sigma]*)
(*Reference: ARXIV:1809.10733*)
kappaZSUP1sig::usage="kappaX to 1\[Sigma]: kappaZSUP1sig"
kappaZINF1sig::usage="kappaX to 1\[Sigma]: kappaZINF1sig"
kappaWSUP1sig::usage="kappaX to 1\[Sigma]: kappaWSUP1sig"
kappaWINF1sig::usage="kappaX to 1\[Sigma]: kappaWINF1sig"
kappaTopSUP1sig::usage="kappaX to 1\[Sigma]: kappaTopSUP1sig"
kappaTopINF1sig::usage="kappaX to 1\[Sigma]: kappaTopINF1sig"
kappaTauSUP1sig::usage="kappaX to 1\[Sigma]: kappaTauSUP1sig"
kappaTauINF1sig::usage="kappaX to 1\[Sigma]: kappaTauINF1sig"
kappaBotSUP1sig::usage="kappaX to 1\[Sigma]: kappaBotSUP1sig"
kappaBotINF1sig::usage="kappaX to 1\[Sigma]: kappaBotINF1sig"
kappaGluonSUP1sig::usage="kappaX to 1\[Sigma]: kappaGluonSUP1sig"
kappaGluonINF1sig::usage="kappaX to 1\[Sigma]: kappaGluonINF1sig"
kappaGammaSUP1sig::usage="kappaX to 1\[Sigma]: kappaGammaSUP1sig"
kappaGammaINF1sig::usage="kappaX to 1\[Sigma]: kappaGammaINF1sig"

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
bsgammaINF3sigma::usage="b-s gamma: bsgammaINF3sigma"
bsgammaSUP3sigma::usage="b-s gamma: bsgammaSUP3sigma"

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
kappaZ=0.99;
kappaW=1.10;
kappaTop=1.11;
kappaTau1=1.01;
kappaBot=-1.10;
kappaGluon=1.18;
kappaGamma=1.07;

(*kappaX to 2\[Sigma]*)
(*Reference: ARXIV:1809.10733*)
kappaZSUP2sig=1.22;
kappaZINF2sig=0.78;
kappaWSUP2sig=\!\(TraditionalForm\`1.45\);
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

(*{
kappaZSUP2sig=1.22007,
kappaZINF2sig=0.759928,
kappaWSUP2sig=1.391433239925259,
kappaWINF2sig=0.808567,
kappaTopSUP2sig=1.3303,
kappaTopINF2sig=0.889697,
kappaTauSUP2sig=1.37074,
kappaTauINF2sig=0.64926,
kappaBotSUP2sig=1.66297,
kappaBotINF2sig=0.537032,
kappaGluonSUP2sig=1.47134,
kappaGluonINF2sig=0.848659,
kappaGammaSUP2sig=1.14,
kappaGammaINF2sig=0.78
};*)

(*kappaX to 1\[Sigma]*)
(*Reference: ARXIV:1809.10733*)
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
TotWidh=0.0041; (*Total width of the Higgs boson*)
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