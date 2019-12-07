(* Wolfram Language Package *)
(***********************************************************************************************************************)
SalidaRW1sig::usage="SalidaRW1sig \[Rule] Output file RW at 1 sigma" 
SalidaRW2sig::usage="SalidaRW2sig \[Rule] Output file RW at 2 sigma"

(*This command generates a list which must invoked for a subsequently be ploted*)

(***********************************************************************************************************************)
(***********************************************************************************************************************)
(***********************************************************************************************************************)
RWRandom::usage="RWRandom[ghtt_, ghbb_, ghWW_, x1_, x1min_, x1max_, x2_, x2min_, x2max_, x3_, x3min_, x3max_, x4_, x4min_, x4max_, NN_][[i]] \[Rule] This command generates random points that agree with the signal strength \!\(\*SubscriptBox[\(R\), \(W\)]\) measurements. The arguments ghtt, ghbb and ghWW stand for the SM-like Higgs boson to top, bottom quarks and W gauge boson couplings, respectively. While xi, with i= 1, 2, 3, 4, are the parameters to constraint and ximin-ximax represent the initial-final values of the interval to evaluate. Finally, NN represents the random points to generate. Here [[i]] indicates the confidence level: i=1 (2) at 1\[Sigma] (2\[Sigma]). The output file will be saved in $UserDocumentsDirectory."

(*Command for plotting*)

(***********************************************************************************************************************)
(**********************************************RW*******************************************************************)
(***********************************************************************************************************************)

PlotRWRandom::usage="PlotRWRandom[ci_, cj_, xlabel_, ylabel_] \[Rule] This command generates a plot with random points that are in accordance with \!\(\*SubscriptBox[\(R\), \(W\)]\) measuremets on the ci-cj plane, where ci and cj stand for the column i and j, respectively; xlabel (ylabel) is used for indicates the X axis label (Y axis label)." 

(***********************************************************************************************************************)
(****************************************End RW Random********************************************************)
(***********************************************************************************************************************)
Begin["`Package`"]
End[]

Begin["`PlotsRWWRandom`Private`"]

(***********************************************************************************************************************)
(****************************************End RW Random********************************************************)
(***********************************************************************************************************************)

(***********************************************************************************************************************)
SalidaRW1sig = 
  OpenWrite[FileNameJoin[{$UserDocumentsDirectory, "RW_random1sigma.txt"}], 
   PageWidth -> Infinity, FormatType -> OutputForm];
SalidaRW2sig = 
  OpenWrite[FileNameJoin[{$UserDocumentsDirectory, "RW_random2sigma.txt"}], 
   PageWidth -> Infinity, FormatType -> OutputForm];

(*This command generates a list which must invoked for a subsequently be ploted*)

(***********************************************************************************************************************)
(***********************************************************************************************************************)
(***********************************************************************************************************************)
RWRandom[ghtt_, ghbb_, ghWW_, x1_, x1min_, x1max_,
x2_, x2min_, x2max_, x3_, x3min_, x3max_, x4_, x4min_, x4max_, NN_]:=
 {
 Do[
   {
    
    x1 = RandomReal[{x1min, x1max}],
    x2 = RandomReal[{x2min, x2max}],
    x3 = RandomReal[{x3min, x3max}],
    x4 = RandomReal[{x4min, x4max}],
    
    If[
     RwwINF1sig <= RWW[ghtt, ghbb, ghWW] <= RwwSUP1sig,
     Write[SalidaRW1sig, 
  FortranForm[x1], " , ", FortranForm[x2], " , ", 
      FortranForm[x3], " , ", FortranForm[x4], " , ", 
      FortranForm[RWW[ghtt, ghbb, ghWW]]], 0
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
     RwwINF2sig <= RWW[ghtt, ghbb, ghWW] <= RwwSUP2sig,
     Write[SalidaRW2sig, FortranForm[x1], " , ", FortranForm[x2], " , ", 
      FortranForm[x3], " , ", FortranForm[x4], " , ", 
      FortranForm[RWW[ghtt, ghbb, ghWW]]], 0
     ]
    }, {n, NN}
   ]
}
(***********************************************************************************************************************)
(***********************************************************************************************************************)
(***********************************************************************************************************************)

(*Command for plotting*)

(***********************************************************************************************************************)
(**********************************************RW*******************************************************************)
(***********************************************************************************************************************)

PlotRWRandom[ci_, cj_, xlabel_, ylabel_] := 
{ 
ListPlot[Import[FileNameJoin[{$UserDocumentsDirectory, "RW_random1sigma.txt"}], "CSV"][[All, {ci, cj}]],
  Frame -> True,
  PlotStyle -> {Red, Opacity[1]},
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
 Placed[{Style["\!\(\*SubscriptBox[\(R\), \(W\)]\)", Larger, 
    Bold]}, {1, 0.6}]*)
  ]
,
ListPlot[Import[FileNameJoin[{$UserDocumentsDirectory, "RW_random2sigma.txt"}], "CSV"][[All, {ci, cj}]],
  Frame -> True,
  PlotStyle -> {Red, Opacity[1]},
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
 Placed[{Style["\!\(\*SubscriptBox[\(R\), \(W\)]\)", Larger, 
    Bold]}, {1, 0.6}]*)
  ]
}

(***********************************************************************************************************************)
(****************************************End RV Random********************************************************)
(***********************************************************************************************************************)

End[]