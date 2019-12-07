(* Wolfram Language Package *)
(***********************************************************************************************************************)
SalidaRgamma1sig::usage="SalidaRgamma1sig \[Rule] Output file \!\(\*SubscriptBox[\(R\), \(\[Gamma]\)]\) at 1 sigma"

SalidaRgamma2sig::usage="SalidaRgamma2sig \[Rule] Output file \!\(\*SubscriptBox[\(R\), \(\[Gamma]\)]\) at 2 sigma"


(***********************************************************************************************************************)
(***********************************************************************************************************************)
(***********************************************************************************************************************)
RgamRandom::usage="RgamRandom[ghtt_, ghbb_,ghWW_,gCH_,mCH_, x1_, x1min_, x1max_, x2_, x2min_, x2max_, x3_, x3min_, x3max_, x4_, x4min_, x4max_, NN_] \[Rule] This command generates random points that agree with the signal strength \!\(\*SubscriptBox[\(R\), \(\[Gamma]\)]\) measurements. The arguments ghtt, ghbb, ghWW, gCH stand for the SM-like Higgs boson to top, bottom quarks, W gauge boson and a charged scalar boson couplings, respectively. While xi, with i= 1, 2, 3, 4, are the parameters to constraint and ximin-ximax represent the initial-final values of the interval to evaluate. Finally, NN represents the random points to generate. Here [[i]] indicates the confidence level: i=1 (2) at 1\[Sigma] (2\[Sigma]). The output file will be saved in $UserDocumentsDirectory."

(***********************************************************************************************************************)
(***********************************************************************************************************************)
(***********************************************************************************************************************)


(***********************************************************************************************************************)
(**********************************************Rgam*******************************************************************)
(***********************************************************************************************************************)
PlotRgamRandom::usage="PlotRgamRandom[ci_, cj_, xlabel_, ylabel_] \[Rule] This command generates a plot with random points that are in accordance with \!\(\*SubscriptBox[\(R\), \(\[Gamma]\)]\) measuremets on the ci-cj plane, where ci and cj stand for the column i and j, respectively; xlabel (ylabel) is used for indicates the X axis label (Y axis label)."

(* Exported symbols added here with SymbolName::usage *)  
Begin["`Package`"]
End[]

Begin["`PlotsRgamgamRandom`Private`"]
(***********************************************************************************************************************)
(****************************************Begin Rgamma Random********************************************************)
(***********************************************************************************************************************)

(***********************************************************************************************************************)
SalidaRgamma1sig = 
  OpenWrite[FileNameJoin[{$UserDocumentsDirectory, "Rgamma_random1sigma.txt"}], 
   PageWidth -> Infinity, FormatType -> OutputForm];
SalidaRgamma2sig = 
  OpenWrite[FileNameJoin[{$UserDocumentsDirectory, "Rgamma_random2sigma.txt"}], 
   PageWidth -> Infinity, FormatType -> OutputForm];


(*This command generates a list which must invoked for a subsequently be ploted*)

(***********************************************************************************************************************)
(***********************************************************************************************************************)
(***********************************************************************************************************************)
RgamRandom[ghtt_, ghbb_,ghWW_,gCH_,mCH_, x1_, x1min_, x1max_,
x2_, x2min_, x2max_, x3_, x3min_, x3max_, x4_, x4min_, x4max_, NN_]:=
 {
 Do[
   {
    
    x1 = RandomReal[{x1min, x1max}],
    x2 = RandomReal[{x2min, x2max}],
    x3 = RandomReal[{x3min, x3max}],
    x4 = RandomReal[{x4min, x4max}],
    
    If[
     RgammagammaINF1sig <= Rgaga[ghtt, ghbb, ghWW, gCH, mCH] <= RgammagammaSUP1sig,
     Write[SalidaRgamma1sig, 
  FortranForm[x1], " , ", FortranForm[x2], " , ", 
      FortranForm[x3], " , ", FortranForm[x4], " , ", 
      FortranForm[Rgaga[ghtt, ghbb, ghWW, gCH, mCH]]], 0
     ]
    }, {n, NN}
   ]
,
Do[
   {
    
    x1 = RandomReal[{x1min, x1max}],
    x2 = RandomReal[{x2min, x2max}],
    x3 = RandomReal[{x3min, x3max}],
    x4 = RandomReal[{x4min, x4max}],
    
    If[
     RgammagammaINF2sig <= Rgaga[ghtt, ghbb, ghWW, gCH, mCH] <= RgammagammaSUP2sig,
     Write[SalidaRgamma2sig, 
  FortranForm[x1], " , ", FortranForm[x2], " , ", 
      FortranForm[x3], " , ", FortranForm[x4], " , ", 
      FortranForm[Rgaga[ghtt, ghbb, ghWW, gCH, mCH]]], 0
     ]
    }, {n, NN}
   ]
}
(***********************************************************************************************************************)
(***********************************************************************************************************************)
(***********************************************************************************************************************)


(*Command for plotting*)

(***********************************************************************************************************************)
(**********************************************Rb*******************************************************************)
(***********************************************************************************************************************)

PlotRgamRandom[ci_, cj_, xlabel_, ylabel_] := 
{ 
ListPlot[Import[FileNameJoin[{$UserDocumentsDirectory, "Rgamma_random1sigma.txt"}], "CSV"][[All, {ci, cj}]],
  Frame -> True,
  PlotStyle -> {Magenta, Opacity[1]},
  FrameLabel -> {Style[xlabel, Larger, Bold], 
       Style[ylabel, Larger, Bold], 
   Style["\!\(\*
StyleBox[\"SpaceMath\",\nFontWeight->\"Bold\",\nFontSlant->\"Italic\"]\)", Medium, Bold]}(*,
   AxesLabel -> {Style["x", Larger, Bold], 
     Style["y", Larger, Bold],Style["z", Larger, Bold]}*), 
   FrameStyle ->  Thickness[0.004], LabelStyle -> 35, 
  ImageSize -> 800,
    GridLines -> Automatic, 
  GridLinesStyle ->    Directive[Black, Dashed],
  PlotMarkers->{{\[FilledUpTriangle],3}}, 
  PlotRange -> Full(*,
PlotLegends -> 
 Placed[{Style["\!\(\*SubscriptBox[\(R\), \(\[Gamma]\)]\)", Larger, 
    Bold]}, {1, 0.6}]*)
  ]
,
ListPlot[Import[FileNameJoin[{$UserDocumentsDirectory, "Rgamma_random2sigma.txt"}], "CSV"][[All, {ci, cj}]],
  Frame -> True,
  PlotStyle -> {Magenta, Opacity[1]},
  FrameLabel -> {Style[xlabel, Larger, Bold], 
       Style[ylabel, Larger, Bold], 
   Style["\!\(\*
StyleBox[\"SpaceMath\",\nFontWeight->\"Bold\",\nFontSlant->\"Italic\"]\)", Medium, Bold]}(*,
   AxesLabel -> {Style["x", Larger, Bold], 
     Style["y", Larger, Bold],Style["z", Larger, Bold]}*), 
   FrameStyle ->  Thickness[0.004], LabelStyle -> 35, 
  ImageSize -> 800,
    GridLines -> Automatic, 
  GridLinesStyle ->    Directive[Black, Dashed],
  PlotMarkers->{{\[FilledCircle],3}}, 
  PlotRange -> Full(*,
PlotLegends -> 
 Placed[{Style["\!\(\*SubscriptBox[\(R\), \(\[Gamma]\)]\)", Larger, 
    Bold]}, {1, 0.6}]*)
  ]
}

(***********************************************************************************************************************)
(****************************************End Rgamma Random********************************************************)
(***********************************************************************************************************************)
End[]