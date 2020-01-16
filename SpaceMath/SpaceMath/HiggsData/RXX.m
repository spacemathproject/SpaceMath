(* Wolfram Language Package *)

(* THIS PROGRAM EVALUATE THE SIGNAL STRENGHT FROM LHC *)
(*https://arxiv.org/abs/1809.10733*)

(*Scalar boson decays into fermion pair;*)
(*Definitions;*)
\[Tau]fi::usage ="See later"
\[Tau]fj::usage ="See later"

(*Decay width of the Scalar boson into fermion pair*)
WidthHff::usage ="See later"

(*Scalar boson decay into gluon pair at one-loop level*)
(*Definitions*)
ft::usage ="See later"
fb::usage ="See later"
gt::usage ="See later"
gb::usage ="See later"

At::usage ="See later"
Ab::usage ="See later"

Ft::usage ="See later"
Fb::usage ="See later"
AHgg::usage ="We consider the contribution of bottom and top quarks inside the loop"

(*Decay width of the Scalar boson into gluon pair*)
WidthHgg::usage ="See later"

(*Higgs boson decay into photon pair*)
Qt::usage ="2/3"
Qb::usage ="-1/3"

(*Main fermion contribution come from top and bottom quark*)
Aht::usage ="See later"
Ahb::usage ="See later"
Af::usage ="See later"

(*W contribution*)
fW::usage ="See later"
gW::usage ="See later"
AW::usage ="See later"
FW::usage ="See later"
AhW::usage ="See later"

(*Charged scalar contribution*)
fH::usage ="See later"
gH::usage ="See later"
AH::usage ="See later"
FH::usage ="See later"
AHc::usage ="See later"
Ahgaga::usage ="See later"

(*Decay width of Scalar boson into photon-photon*)
WidthHgaga::usage ="See later"

(*Scalar boson decay into vector pair*)
(*Definitions*)
RTW::usage ="See later"
RTZ::usage ="See later"
\[Delta]Z::usage ="See later"

(*Decay width of Higgs boson into WW pair*)
WidthHWW::usage ="See later"

(* Decay width of Scalar boson into ZZ pair *)
WidthHZZ::usage ="See later"
BRhfifj::usage ="See later"
BRhgaga::usage ="See later"
BRhWW::usage ="See later"
BRhZZ::usage ="See later"
BRhgg::usage ="See later"

(*Signal strengths*)
Rbotbot::usage ="See later"
Rtata::usage ="See later"
RWW::usage ="See later"
RZZ::usage ="See later"
Rgaga::usage ="See later"
Rgg::usage ="See later"

(* ------------------------------------------------------------------------ *)

Begin["`Package`"]
End[]

Begin["`RXX`Private`"]

(*Scalar boson decays into fermion pair;*)

(*Definitions;*)

\[Tau]fi[mi_,mS_] := (2 mi/mS)^2
\[Tau]fj[mj_,mS_] := (2 mj/mS)^2

(*Decay width of the Scalar boson into fermion pair*)

WidthHff[ghfifj_, Nc_, mi_, mj_,mS_] := (((ghfifj^2) Nc mS)/(128 \[Pi]))*
((4-(Sqrt[\[Tau]fi[mi,mS]]+Sqrt[\[Tau]fj[mj,mS]])^2)^(3/2))*(Sqrt[(4-(Sqrt[\[Tau]fi[mi,mS]]-Sqrt[\[Tau]fj[mj,mS]])^2)])

(************************************************************************************************************************************************************************************************************************************************************************************************************************)

(*Scalar boson decay into gluon pair at one-loop level*)

(*Definitions*)

ft[mS_]:=-(1/4) (Log[(1+Sqrt[1-((4*mt^2)/(mS^2))])/(1-Sqrt[1-((4*mt^2)/(mS^2))])]-I \[Pi])^2;
fb[mS_]:=-(1/4) (Log[(1+Sqrt[1-((4*mb^2)/(mS^2))])/(1-Sqrt[1-((4*mb^2)/(mS^2))])]-I \[Pi])^2;
gt[mS_]:=(ArcSin[1/Sqrt[(4*mt^2)/(mS^2)]])^2
gb[mS_]:=(ArcSin[1/Sqrt[(4*mb^2)/(mS^2)]])^2

At[mS_]:=If[((4*mt^2)/mS^2)>=1,gt[mS],ft[mS]]
Ab[mS_]:=If[((4*mb^2)/mS^2)>=1,gb[mS],fb[mS]]

Ft[mS_]:=-2*(4*mt^2/(mS^2))*(1+(1-(4*mt^2/(mS^2)))*At[mS]); 
Fb[mS_]:=-2*(4*mb^2/(mS^2))*(1+(1-(4*mb^2/(mS^2)))*Ab[mS]);

(*We consider the contribution of bottom and top quarks inside the loop*)
AHgg[ghtt_,ghbb_,mS_]:=(2*mW)*((ghtt/mt)*Ft[mS])+((ghbb/mb)*Fb[mS])

(*Decay width of the Scalar boson into gluon pair*)

WidthHgg[ghtt_,ghbb_,mS_]:=((\[Alpha]s^2*mS^3)/(512 mW^2 \[Pi]^3 ))*
Abs[AHgg[ghtt,ghbb,mS]]^2

(************************************************************************************************************************************************************************************************************************************************************************************************************************)

(*Higgs boson decay into photon pair*)

{Qt=(2/3),Qb=(-1/3)};

(*Main fermion contribution come from top and bottom quark*)

Aht[ghtt_,mS_]:=6 (mW/mt) ghtt Qt^2 ghtt Ft[mS]
Ahb[ghbb_,mS_]:=6 (mW/mb) ghbb Qb^2 ghbb Fb[mS]
Af[ghtt_,ghbb_,mS_]:=Aht[ghtt,mS]+Ahb[ghbb,mS]
(**)

(*W contribution*)

fW[mS_]:=-(1/4)*(Log[(1+Sqrt[1-((4*mW^2)/(mS^2))])/(1-Sqrt[1-((4*mW^2)/(mS^2))])]-I \[Pi])^2;
gW[mS_]:=(ArcSin[1/Sqrt[4*mW^2/(mS^2)]])^2; 
AW[mS_]:=If[(4*mW^2/(mS^2))>=1,gW[mS],fW[mS]];
FW[mS_]:=2+(3*(4*mW^2/(mS^2)))+((3*(4*mW^2/(mS^2))*(2-(4*mW^2/(mS^2)))*AW[mS]));
AhW[ghWW_,mS_]:=(ghWW/mW) FW[mS] 

(*Charged scalar contribution*)

fH[mCH_,mS_]:=-(1/4)*(Log[(1+Sqrt[1-((4*mCH^2)/(mS^2))])/(1-Sqrt[1-((4*mCH^2)/(mS^2))])]-I \[Pi])^2; ;
gH[mCH_,mS_]:=(ArcSin[1/Sqrt[4*mCH^2/(mS^2)]])^2; 
AH[mCH_,mS_]:=If[(4*mCH^2/(mS^2))>=1,gH[mCH,mS],fH[mCH,mS]];
FH[mCH_,mS_]:=(4*mCH^2/(mS^2))*(1-((4*mCH^2/(mS^2))*AH[mCH,mS]))
AHc[gCH_,mCH_,mS_]:=((mW*gCH)/(mCH^2)) FH[mCH,mS]



Ahgaga[ghtt_,ghbb_,ghWW_,mS_,gCH_,mCH_]:=Af[ghtt,ghbb,mS]+AhW[ghWW,mS]+AHc[gCH,mCH,mS]

(*Decay width of Scalar boson into photon-photon*)

WidthHgaga[ghtt_,ghbb_,ghWW_,gCH_,mCH_,mS_]:=
((\[Alpha]em^2)*(mS^3))/(1024*(\[Pi]^3)*mW^2)*Abs[Ahgaga[ghtt,ghbb,ghWW,mS,gCH,mCH]]^2




(************************************************************************************************************************************************************************************************************************************************************************************************************************)

(*Scalar boson decay into vector pair*)

(*Definitions*)

RTW[mS_]:=-(((1-(mW^2/mS^2)) (47 (mW^4/mS^4)-(13 mW^2/mS^2)+2))/(2 mW^2/mS^2))-(3/2 (4 (mW^4/mS^4)-6 (mW^2/mS^2)+1)*(Log[mW^2/mS^2]))+
((3 (20 (mW^4/mS^4)- 8 (mW^2/mS^2)+1))/Sqrt[4 (mW^2/mS^2)-1])*ArcCos[(3 (mW^2/mS^2)-1)/(2 (mW^3/mS^3))];



RTZ[mS_]:=RTW[mS]/.mW-> mZ;

\[Delta]Z=7-(40/(3 SW^2))+160/(9 SW^4);

(*Decay width of Higgs boson into WW pair*)

WidthHWW[ghWW_,mS_]:=((ghWW^2) mS)/(512 (\[Pi]^3) (mW^4)) RTW[mS]

(*Decay width of Scalar boson into ZZ pair*)

WidthHZZ[ghZZ_,mS_]:=((ghZZ^2) mS)/(2048 (\[Pi]^3) mZ^4) \[Delta]Z RTZ[mS]

(************************************************************************************************************************************************************************************************************************************************************************************************************************)

BRhfifj[ghfifj_, Nc_, mi_, mj_]:=WidthHff[ghfifj, Nc, mi, mj,mh]/TotWidh
BRhgaga[ghtt_,ghbb_,ghWW_,gCH_,mCH_]:=WidthHgaga[ghtt,ghbb,ghWW,gCH,mCH,mh]/TotWidh
BRhWW[ghWW_]:=WidthHWW[ghWW,mh]/TotWidh
BRhZZ[ghZZ_]:=WidthHZZ[ghZZ,mh]/TotWidh
BRhgg[ghtt_,ghbb_]:=WidthHgg[ghtt,ghbb,mh]/TotWidh

(************************************************************************************************************************************************************************************************************************************************************************************************************************)
(*Signal strengths*)
Rbotbot[ghtt_,ghbb_]:=(WidthHgg[ghtt,ghbb,mh]*BRhfifj[ghbb, 3, mb, mb])/(WidthHgg[g mt/(2 mW),g mb/(2 mW),mh]*BRhfifj[g mb/(2 mW), 3, mb, mb])
(************************************************************************************************************************************************************************************************************************************************************************************************************************)

Rtata[ghtt_,ghbb_,ghtautau_]:=(WidthHgg[ghtt,ghbb,mh]*BRhfifj[ghtautau, 1, mtau, mtau])/(WidthHgg[g mt/(2 mW),g mb/(2 mW),mh]*BRhfifj[g mtau/(2 mW), 1, mtau, mtau])

RWW[ghtt_,ghbb_,ghWW_]:=(WidthHgg[ghtt,ghbb,mh]*BRhWW[ghWW])/(WidthHgg[g mt/(2 mW),g mb/(2 mW),mh]*BRhWW[gw*mW])

RZZ[ghtt_,ghbb_,ghZZ_]:=(WidthHgg[ghtt,ghbb,mh]*BRhZZ[ghZZ])/(WidthHgg[g mt/(2 mW),g mb/(2 mW),mh]*BRhZZ[gz*mW])

Rgaga[ghtt_,ghbb_,ghWW_,gCH_,mCH_]:=(WidthHgg[ghtt,ghbb,mh]*BRhgaga[ghtt,ghbb,ghWW,gCH,mCH])/(WidthHgg[g mt/(2 mW),g mb/(2 mW),mh]*BRhgaga[g mt/(2 mW),g mb/(2 mW),gw*mW,0,mCH])

Rgg[ghtt_,ghbb_]:=WidthHgg[ghtt,ghbb,mh]*BRhgg[ghtt,ghbb]/(WidthHgg[g mt/(2 mW),g mb/(2 mW),mh]*BRhgg[g mt/(2 mW),g mb/(2 mW)])

End[]