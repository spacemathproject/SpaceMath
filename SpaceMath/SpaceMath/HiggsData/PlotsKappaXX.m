(* Definitions; *)

(******************************************************************************************************************************************************)
(*********************************************************Begin KV************************************************************************************)
(******************************************************************************************************************************************************)
KVone::usage = "\!\(\*
StyleBox[\"KVone\",\nFontWeight->\"Bold\"]\)\!\(\*
StyleBox[\"[\",\nFontWeight->\"Bold\"]\)\!\(\*
StyleBox[\"ghVV_\",\nFontWeight->\"Bold\"]\)\!\(\*
StyleBox[\",\",\nFontWeight->\"Bold\"]\)\!\(\*
StyleBox[\"x_\",\nFontWeight->\"Bold\"]\)\!\(\*
StyleBox[\",\",\nFontWeight->\"Bold\"]\)\!\(\*
StyleBox[\"xmin_\",\nFontWeight->\"Bold\"]\)\!\(\*
StyleBox[\",\",\nFontWeight->\"Bold\"]\)\!\(\*
StyleBox[\"xmax_\",\nFontWeight->\"Bold\"]\)\!\(\*
StyleBox[\",\",\nFontWeight->\"Bold\"]\)\!\(\*
StyleBox[\"xlabel_\",\nFontWeight->\"Bold\"]\)\!\(\*
StyleBox[\"]\",\nFontWeight->\"Bold\"]\)\!\(\*
StyleBox[\"[\",\nFontWeight->\"Bold\"]\)\!\(\*
StyleBox[\"[\",\nFontWeight->\"Bold\"]\)\!\(\*
StyleBox[\"i\",\nFontWeight->\"Bold\"]\)\!\(\*
StyleBox[\"]\",\nFontWeight->\"Bold\"]\)\!\(\*
StyleBox[\"]\",\nFontWeight->\"Bold\"]\)\[Rule]  \
This command evaluates \!\(\*SubscriptBox[\(K\), \(V\)]\) with V=W, \
Z when there is dependence only on one parameter. The arguments ghtt, ghbb and ghVV are the htt, hbb, hVV \
couplings. Here, h represents to SM-like Higgs boson while t and b are the top and bottom quarks. The label x \
indicates the parameter to constrain, while xmin and xmax are the \
initial and final values defined by users and xlabel is used \
for indicates the X axis label. Finally, [[i]] stands for confidence level, i=1 (2) indicates 1\[Sigma] (2\[Sigma])."

TableKVone::usage="\!\(\*
StyleBox[\"TableKVone\",\nFontWeight->\"Bold\"]\)\!\(\*
StyleBox[\"[\",\nFontWeight->\"Bold\"]\)\!\(\*
StyleBox[\"ghtt_\",\nFontWeight->\"Bold\"]\)\!\(\*
StyleBox[\",\",\nFontWeight->\"Bold\"]\)\!\(\*
StyleBox[\"ghbb_\",\nFontWeight->\"Bold\"]\)\!\(\*
StyleBox[\",\",\nFontWeight->\"Bold\"]\)\!\(\*
StyleBox[\"ghVV_\",\nFontWeight->\"Bold\"]\)\!\(\*
StyleBox[\",\",\nFontWeight->\"Bold\"]\)\!\(\*
StyleBox[\"x_\",\nFontWeight->\"Bold\"]\)\!\(\*
StyleBox[\",\",\nFontWeight->\"Bold\"]\)\!\(\*
StyleBox[\"xmin_\",\nFontWeight->\"Bold\"]\)\!\(\*
StyleBox[\",\",\nFontWeight->\"Bold\"]\)\!\(\*
StyleBox[\"xmax_\",\nFontWeight->\"Bold\"]\)\!\(\*
StyleBox[\",\",\nFontWeight->\"Bold\"]\)\!\(\*
StyleBox[\"xstep_\",\nFontWeight->\"Bold\"]\)\!\(\*
StyleBox[\"]\",\nFontWeight->\"Bold\"]\)\[Rule] This command generates a table of the signal strength \!\(\*SubscriptBox[\(K\), \(V\)]\), with V= W, Z. The arguments ghtt, ghbb and ghVV are the htt, hbb, hVV \
couplings. Here, h represents to SM-like Higgs boson while t and b the top and bottom quarks. The label x \
indicates the parameter to constraint, while xmin and xmax are the \
initial and final values defined by users and xstep is used \
to indicates the steps from xmin to xmax. The output file will be saved in $UserDocumentsDirectory."

KV::usage="KV[ghtt_,ghbb_,ghVV_,x_,y_,xmin_,xmax_,ymin_,ymax_,xlabel_,ylabel_,xfor_,yfor_,xformin_,xformax_,xforstep_,yformin_,yformax_,yforstep_,PP_][[i]]\[Rule] This command evaluates \!\(\*SubscriptBox[\(K\), \(V\)]\) with V=W, \
Z when there is dependence on two or more parameters. The arguments ghtt, ghbb, ghVV are the htt, hbb, hVV \
couplings. Here, h represents to SM-like Higgs boson while t and b the top and bottom quarks. Labels x and y \
indicate the parameters to constraint, while xmin (ymin) and xmax (ymax) are the \
initial and final values defined by users. Argument xlabel (ylabel) is used \
for indicates the X axis label (Y axis label). The arguments xfor (yfor), xformin (yformin), xforstep (yforstep) represent an additional parameter to constraint, namely: initial value, final value and the steps from xformin (yformin) to xformax (yformax), respectively. Label [[i]] stands for confidence level, i=1 (2) indicates 1\[Sigma] (2\[Sigma]), Finally, PP is an option for plotting functions that specifies how many initial sample points to use."

TableKV::usage="TableKV[ghtt_,ghbb_,ghVV_,x_,xmin_,xmax_,xstep_,y_,ymin_,ymax_,ystep_]\[Rule] This command generates a table of the signal strength \!\(\*SubscriptBox[\(K\), \(V\)]\), with V= W, Z gauge bosons. The arguments ghtt, ghbb and ghVV are the htt, \
hbb and hVV couplings. Here, h represents to SM-like Higgs boson while t and b the top and bottom quarks. Labels x and y \
indicate the parameters to constraint, while xmin (ymin) and xmax (ymax) are the \
initial and final values defined by users and xstep (ystep) is used \
to indicates the steps from xmin to xmax (ymin to ymax). The output file will be saved in $UserDocumentsDirectory."
(******************************************************************************************************************************************************)
(*********************************************************END OF KV************************************************************************************)
(******************************************************************************************************************************************************)

(******************************************************************************************************************************************************)
(*********************************************************Begin OF KXALL************************************************************************************)
(*****************************************************************************************************************************************************)

KappaALL::usage="KappaALL[ghtt_, ghbb_, ghZZ_, ghWW_, ghtautau_, gCH_, mCH_, x_, y_, xmin_, xmax_, ymin_, ymax_, xlabel_, ylabel_, xfor_, yfor_, xformin_, xformax_, xforstep_, yformin_, yformax_, yforstep_, PP_][[i]]\[Rule] This command evaluates all \[Kappa]'s, \
when there is dependence on two or more parameters. The arguments ghtt, ghbb, ghZZ, ghWW, ghtautau and gCH are the htt, hbb, \
hZZ, hWW, htautau and \!\(\*SuperscriptBox[\(hH\), \(-\)]\)\!\(\*SuperscriptBox[\(H\), \(+\)]\) couplings. Here, h represents to SM-like Higgs boson while t and b are the top and bottom quarks; V=Z, W are the gauge bosons, tau is the tau lepton and \!\(\*SuperscriptBox[\(H\), \(-\)]\) is a charged scalar boson. Labels x and y \
indicate the parameters to constraint, while xmin (ymin) and xmax (ymax) are the \
initial and final values defined by users. Argument xlabel (ylabel) is used \
for indicates the X axis label (Y axis label). The arguments xfor (yfor), xformin (yformin), xforstep (yforstep) represent an additional parameter to constraint, namely: initial value, final value and the steps from xformin (yformin) to xformax (yformax), respectively; mCH stands for the charged scalar boson. Label [[i]] stands for confidence level, i=1 (2) indicates 1\[Sigma] (2\[Sigma]), Finally, PP is an option for plotting functions that specifies how many initial sample points to use."

(*****************************************************************************************************************************************************)
(*********************************************************End OF Kappa-ALL****************************************************************************)
(*****************************************************************************************************************************************************)

Begin["`Package`"]
End[]

Begin["`PlotsKappaXX`Private`"]

All processes;

(***************************************************************************************************************************************************)
(****************************************Begin All kappa's******************************************************************************************)
(***************************************************************************************************************************************************)

(*To 2\[Sigma]*)

KappaX2sig[ghtt_, ghbb_,ghZZ_,ghWW_,ghtautau_,gCH_,mCH_,x_,y_,
xmin_,xmax_,ymin_,ymax_,xlabel_,ylabel_,PP_]:=
RegionPlot[{kappaBotINF2sig <= kb[ghbb] <= kappaBotSUP2sig(*,
kappaTopINF2sig<=ktop[ghtt]<=kappaTopSUP2sig*), 
    kappaTauINF2sig <= Abs[ktau[ghtautau]] <= kappaTauSUP2sig, 
   kappaWINF2sig<= kW[ghWW] <= kappaWSUP2sig, 
    kappaZINF2sig<= kZ[ghZZ] <= kappaZSUP2sig, 
  kappaGammaINF2sig <=Abs[kgaga[ghtt, ghbb, ghWW, gCH, mCH]] <=  kappaGammaSUP2sig,
kappaGluonINF2sig<=Abs[kgluglu[ghtt,ghbb]]<=kappaGluonSUP2sig},
 {x, xmin, xmax}, {y, ymin, ymax}
 , FrameLabel -> {Style[xlabel, Larger, Bold], 
   Style[ylabel, Larger, Bold], 
   Style["\!\(\*
StyleBox[\"SpaceMath\",\nFontWeight->\"Bold\",\nFontSlant->\"Italic\"]\)", Medium, Bold]}, 
 PlotLegends -> Placed[{"\!\(\*SubscriptBox[\(\[Kappa]\), \(b\)]\)",(*
"\!\(\*SubscriptBox[\(\[Kappa]\), \(t\)]\)",*)"\!\(\*SubscriptBox[\(\[Kappa]\), \(\[Tau]\)]\)",
"\!\(\*SubscriptBox[\(\[Kappa]\), \(W\)]\)","\!\(\*SubscriptBox[\(\[Kappa]\), \(Z\)]\)",
"\!\(\*SubscriptBox[\(\[Kappa]\), \(\[Gamma]\)]\)","\!\(\*SubscriptBox[\(\[Kappa]\), \(g\)]\)"}, {1,0.6}],
 (*AxesLabel -> {Style["x", Larger, Bold], 
   Style["y", Larger, Bold]},*)
 FrameStyle ->  Thickness[0.004], LabelStyle -> 35,PlotPoints->PP, ImageSize -> 800,
  GridLines -> Automatic, GridLinesStyle -> 
   Directive[Black, 
     Dashed], BoundaryStyle -> {1 -> Directive[Green, Dashed, Thickness[0.003]], 
  2 -> Directive[Pink, Dashed, Thickness[0.003]], 
  3 -> Directive[Yellow, Dashed, Thickness[0.003]], 
  4 -> Directive[Blue, Dashed, Thickness[0.003]], 
  5 -> Directive[Orange, Dashed, Thickness[0.003]],
  6 -> Directive[Purple, Dashed, Thickness[0.003]],
  7 -> Directive[Cyan, Dashed, Thickness[0.003]]}, PlotStyle -> {{Green, Opacity[0.1]}, {Pink, Opacity[0.1]}, {Yellow, 
   Opacity[0.1]}, {Blue, Opacity[0.1]}, {Orange, Opacity[0.1]}, {Purple, Opacity[0.1]}, {Cyan, Opacity[0.1]}}, AspectRatio->1]

K2sigAll[
ghtt_, ghbb_,ghZZ_,ghWW_,ghtautau_,gCH_,mCH_,x_,y_,xmin_,xmax_,ymin_,ymax_,xlabel_,ylabel_,xfor_,
yfor_,xformin_,xformax_,xforstep_,yformin_,yformax_,yforstep_,PP_
]:=Manipulate[
KappaX2sig[ghtt, ghbb,ghZZ,ghWW,ghtautau,gCH,mCH,x,y,xmin,xmax,ymin,ymax,xlabel,ylabel,PP],
 {xfor,xformin,xformax,xforstep},{yfor,yformin,yformax,yforstep
}];

(*To 1\[Sigma]*)

KappaX1sig[ghtt_, ghbb_,ghZZ_,ghWW_,ghtautau_,gCH_,mCH_,x_,y_,
xmin_,xmax_,ymin_,ymax_,xlabel_,ylabel_,PP_]:=
RegionPlot[{kappaBotINF1sig <= kb[ghbb] <= kappaBotSUP1sig(*,
kappaTopINF2sig<=ktop[ghtt]<=kappaTopSUP2sig*), 
    kappaTauINF1sig <= Abs[ktau[ghtautau]] <= kappaTauSUP1sig, 
   kappaWINF1sig<= kW[ghWW] <= kappaWSUP1sig, 
    kappaZINF1sig<= kZ[ghZZ] <= kappaZSUP1sig, 
  kappaGammaINF1sig <=Abs[kgaga[ghtt, ghbb, ghWW, gCH, mCH]] <=  kappaGammaSUP1sig,
kappaGluonINF1sig<=Abs[kgluglu[ghtt,ghbb]]<=kappaGluonSUP1sig},
 {x, xmin, xmax}, {y, ymin, ymax}
 , FrameLabel -> {Style[xlabel, Larger, Bold], 
   Style[ylabel, Larger, Bold], 
   Style["\!\(\*
StyleBox[\"SpaceMath\",\nFontWeight->\"Bold\",\nFontSlant->\"Italic\"]\)", Medium, Bold]}, 
 PlotLegends -> Placed[{"\!\(\*SubscriptBox[\(\[Kappa]\), \(b\)]\)",(*
"\!\(\*SubscriptBox[\(\[Kappa]\), \(t\)]\)",*)"\!\(\*SubscriptBox[\(\[Kappa]\), \(\[Tau]\)]\)",
"\!\(\*SubscriptBox[\(\[Kappa]\), \(W\)]\)","\!\(\*SubscriptBox[\(\[Kappa]\), \(Z\)]\)",
"\!\(\*SubscriptBox[\(\[Kappa]\), \(\[Gamma]\)]\)","\!\(\*SubscriptBox[\(\[Kappa]\), \(g\)]\)"}, {1,0.6}],
 (*AxesLabel -> {Style["x", Larger, Bold], 
   Style["y", Larger, Bold]},*) 
 FrameStyle ->  Thickness[0.004], LabelStyle -> 35,PlotPoints->PP, ImageSize -> 600,
  GridLines -> Automatic, GridLinesStyle -> 
   Directive[Black, 
     Dashed], BoundaryStyle -> {1 -> Directive[Green, Dashed, Thickness[0.003]], 
  2 -> Directive[Pink, Dashed, Thickness[0.003]], 
  3 -> Directive[Yellow, Dashed, Thickness[0.003]], 
  4 -> Directive[Blue, Dashed, Thickness[0.003]], 
  5 -> Directive[Orange, Dashed, Thickness[0.003]],
  6 -> Directive[Purple, Dashed, Thickness[0.003]],
  7 -> Directive[Cyan, Dashed, Thickness[0.003]]}, PlotStyle -> {{Green, Opacity[0.1]}, {Pink, Opacity[0.1]}, {Yellow, 
   Opacity[0.1]}, {Blue, Opacity[0.1]}, {Orange, Opacity[0.1]}, {Purple, Opacity[0.1]}, {Cyan, Opacity[0.1]}}, AspectRatio->1]

K1sigAll[
ghtt_, ghbb_,ghZZ_,ghWW_,ghtautau_,gCH_,mCH_,x_,y_,xmin_,xmax_,ymin_,ymax_,xlabel_,ylabel_,xfor_,
yfor_,xformin_,xformax_,xforstep_,yformin_,yformax_,yforstep_,PP_
]:=Manipulate[
KappaX1sig[ghtt, ghbb,ghZZ,ghWW,ghtautau,gCH,mCH,x,y,xmin,xmax,ymin,ymax,xlabel,ylabel,PP],
 {xfor,xformin,xformax,xforstep},{yfor,yformin,yformax,yforstep
}];

KappaALL[ghtt_, ghbb_,ghZZ_,ghWW_,ghtautau_,gCH_,mCH_,x_,y_,xmin_,xmax_,ymin_,ymax_,xlabel_,ylabel_,xfor_,
yfor_,xformin_,xformax_,xforstep_,yformin_,yformax_,yforstep_,PP_]:=
{
K1sigAll[
ghtt, ghbb,ghZZ,ghWW,ghtautau,gCH,mCH,x,y,xmin,xmax,ymin,ymax,xlabel,ylabel,xfor,
yfor,xformin,xformax,xforstep,yformin,yformax,yforstep,PP
],
K2sigAll[
ghtt, ghbb,ghZZ,ghWW,ghtautau,gCH,mCH,x,y,xmin,xmax,ymin,ymax,xlabel,ylabel,xfor,
yfor,xformin,xformax,xforstep,yformin,yformax,yforstep,PP
]
}

(*************************************************************************************************************************************************************************************)

(*KappaALL[ghtt_, ghbb_,ghZZ_,ghWW_,ghtautau_,gCH_,mCH_,x_,y_,xmin_,xmax_,ymin_,ymax_,xlabel_,ylabel_,xfor_,
yfor_,xformin_,xformax_,xforstep_,yformin_,yformax_,yforstep_,PP_]*)

(*K2sigAll[
ghtt[c\[Alpha],Ztt,u], ghbb[c\[Alpha],Zbb,u],ghZZ[c\[Alpha]],ghWW[c\[Alpha]],ghtautau[c\[Alpha],Ztautau,u],0,mCH,Ztt,Zbb,0,30,0,5,Ztt,Zbb,u,
c\[Alpha],500,2000,100,0.9,0.99,0.01
]*)

(***************************************************************************************************************************************************)
(****************************************End All kappa's******************************************************************************************)
(***************************************************************************************************************************************************)

(***************************************************************************************************************************************************)
(*****************************************************BEGIN COMAND FOR CALL FOR ALL KAPPAS**********************************************************)
(***************************************************************************************************************************************************)

(*COMAND FOR CALL FOR ALL KAPPAS *)

Intersection;

(*To 1\[Sigma]*)

Intersectionkappa1sig[ghtt_, ghbb_,ghZZ_,ghWW_,ghtautau_,gCH_,mCH_,x_,y_,xmin_,xmax_,ymin_,ymax_,xlabel_,ylabel_,PP_]:=RegionPlot[
{kappaBotINF1sig <= kb[ghbb] <= kappaBotSUP1sig&&
kappaTopINF1sig<=ktop[ghtt]<=kappaTopSUP1sig&& 
    kappaTauINF1sig <= ktau[ghtautau] <= kappaTauSUP1sig&& 
   kappaWINF1sig<= kW[ghWW] <= kappaWSUP1sig&& 
    kappaZINF1sig<= kZ[ghZZ] <= kappaZSUP1sig&& 
  kappaGammaINF1sig <= kgaga[ghtt, ghbb, ghWW, gCH, mCH] <= kappaGammaSUP1sig&&
kappaGluonINF1sig<=kgluglu[ghtt,ghbb]<=kappaGluonSUP1sig},
 {x, xmin, xmax}, {y, ymin, ymax}
 ,PlotPoints->PP, FrameLabel -> {Style[xlabel, Larger, Bold], 
   Style[ylabel, Larger, Bold], 
   Style["\!\(\*
StyleBox[\"SpaceMath\",\nFontWeight->\"Bold\",\nFontSlant->\"Italic\"]\)", Larger, Bold]}, 
 PlotLegends -> Placed[{"Intersection"}, {0.8,0.6}],
 (*AxesLabel -> {Style["x", Larger, Bold], 
   Style["y", Larger, Bold]},*) 
 FrameStyle ->  Thickness[0.004], LabelStyle -> 35, ImageSize -> 1000,(*PlotPoints->500,*)
  GridLines -> Automatic, GridLinesStyle -> 
   Directive[Black, 
     Dashed], BoundaryStyle -> {1 -> Directive[Orange, Dashed, Thickness[0.003]]}, PlotStyle -> {{Orange, Opacity[0.3]}}, AspectRatio->1]

InterKappa1sig[ghtt_, ghbb_,ghZZ_,ghWW_,ghtautau_,gCH_,mCH_,x_,y_,xmin_,xmax_,ymin_,ymax_,xlabel_,ylabel_,xfor_,yfor_,xformin_,xformax_,xforstep_,yformin_,yformax_,yforstep_,PP_]:=
Manipulate[
Intersectionkappa1sig[ghtt, ghbb,ghZZ,ghWW,ghtautau,gCH,mCH,x,y,xmin,xmax,ymin,ymax,xlabel,ylabel,PP],
 {xfor,xformin,xformax,xforstep},{yfor,yformin,yformax,yforstep}]

(*To 2\[Sigma]*)

Intersectionkappa2sig[ghtt_, ghbb_,ghZZ_,ghWW_,ghtautau_,gCH_,mCH_,x_,y_,xmin_,xmax_,ymin_,ymax_,xlabel_,ylabel_,PP_]:=RegionPlot[
{kappaBotINF2sig <= kb[ghbb] <= kappaBotSUP2sig&&
    kappaTauINF2sig <= ktau[ghtautau] <= kappaTauSUP2sig&& 
   kappaWINF2sig<= kW[ghWW] <= kappaWSUP2sig&& 
    kappaZINF2sig<= kZ[ghZZ] <= kappaZSUP2sig&& 
  kappaGammaINF2sig <= kgaga[ghtt, ghbb, ghWW, gCH, mCH] <= kappaGammaSUP2sig&&
kappaGluonINF2sig<=kgluglu[ghtt,ghbb]<=kappaGluonSUP2sig},
 {x, xmin, xmax}, {y, ymin, ymax}
,PlotPoints->PP , FrameLabel -> {Style[xlabel, Larger, Bold], 
   Style[ylabel, Larger, Bold], 
   Style["\!\(\*
StyleBox[\"SpaceMath\",\nFontWeight->\"Bold\",\nFontSlant->\"Italic\"]\)", Larger, Bold]}, 
 PlotLegends -> Placed[{"Intersection"}, {0.8,0.6}],
 (*AxesLabel -> {Style["x", Larger, Bold], 
   Style["y", Larger, Bold]},*)
 FrameStyle ->  Thickness[0.004], LabelStyle -> 35, ImageSize -> 600,
  GridLines -> Automatic, GridLinesStyle -> 
   Directive[Black, 
     Dashed], BoundaryStyle -> {1 -> Directive[Purple, Dashed, Thickness[0.003]]}, PlotStyle -> {{Purple, Opacity[0.3]}}, AspectRatio->1]

InterKappa2sig[ghtt_, ghbb_,ghZZ_,ghWW_,ghtautau_,gCH_,mCH_,x_,y_,xmin_,xmax_,ymin_,ymax_,xlabel_,ylabel_,xfor_,yfor_,xformin_,xformax_,xforstep_,yformin_,yformax_,yforstep_,PP_]:=
Manipulate[
Intersectionkappa2sig[ghtt, ghbb,ghZZ,ghWW,ghtautau,gCH,mCH,x,y,xmin,xmax,ymin,ymax,xlabel,ylabel,PP],
 {xfor,xformin,xformax,xforstep},{yfor,yformin,yformax,yforstep}]
 
(***************************************************************************************************************************************************)
(**********************************************************END COMAND FOR CALL FOR ALL KAPPAS*******************************************************)
(***************************************************************************************************************************************************)
 
 End[]