
(* Wolfram Language Package *)
(***********************************************************************************************************************)
(****************************************Begin Rb Random********************************************************)
(***********************************************************************************************************************)

(***********************************************************************************************************************)
SalidaRb1sig::usage="SalidaRb1sig \[Rule] Output file \!\(\*SubscriptBox[\(R\), \(b\)]\) at 1 sigma"
SalidaRb2sig::usage="SalidaRb2sig \[Rule] Output file \!\(\*SubscriptBox[\(R\), \(b\)]\) at 2 sigma"


(*This command generates a list which must invoked for a subsequently be ploted*)

(***********************************************************************************************************************)
(***********************************************************************************************************************)
(***********************************************************************************************************************)
RbRandom::usage="RbRandom[ghtt_, ghbb_, x1_, x1min_, x1max_, x2_, x2min_, x2max_, x3_, x3min_, x3max_, x4_, x4min_, x4max_, NN_] \[Rule] This command generates random points that agree with the signal strength \!\(\*SubscriptBox[\(R\), \(b\)]\) measurements. The arguments ghtt and ghbb stand for the SM-like Higgs boson to top and bottom quarks couplings, respectively. While xi, with i= 1, 2, 3, 4, are the parameters to constraint and ximin-ximax represent the initial-final values of the interval to evaluate. Finally, NN represents the random points to generate. Here [[i]] indicates the confidence level: i=1 (2) at 1\[Sigma] (2\[Sigma]). The output file will be saved in $UserDocumentsDirectory."
(***********************************************************************************************************************)
(***********************************************************************************************************************)
(***********************************************************************************************************************)


(*Command for plotting*)

(***********************************************************************************************************************)
(**********************************************Rb*******************************************************************)
(***********************************************************************************************************************)
PlotRbRandom::usage="PlotRbRandom[ci_, cj_, xlabel_, ylabel_] \[Rule] This command generates a plot with random points that are in accordance with \!\(\*SubscriptBox[\(R\), \(b\)]\) measuremets on the ci-cj plane, where ci and cj stand for the column i and j, respectively; xlabel (ylabel) is used for indicates the X axis label (Y axis label)."

(***********************************************************************************************************************)
(****************************************End Rb Random********************************************************)
(***********************************************************************************************************************)


Begin["`Package`"]
End[]

Begin["`PlotsRbbRandom`Private`"]

(***********************************************************************************************************************)
(****************************************Begin Rb Random********************************************************)
(***********************************************************************************************************************)

(***********************************************************************************************************************)
SalidaRb1sig = 
  OpenWrite[FileNameJoin[{$UserDocumentsDirectory, "Rb_random1sigma.txt"}], 
   PageWidth -> Infinity, FormatType -> OutputForm];
SalidaRb2sig = 
  OpenWrite[FileNameJoin[{$UserDocumentsDirectory, "Rb_random2sigma.txt"}], 
   PageWidth -> Infinity, FormatType -> OutputForm];


(*This command generates a list which must invoked for a subsequently be ploted*)

(***********************************************************************************************************************)
(***********************************************************************************************************************)
(***********************************************************************************************************************)
RbRandom[ghtt_, ghbb_, x1_, x1min_, x1max_,
x2_, x2min_, x2max_, x3_, x3min_, x3max_, x4_, x4min_, x4max_, NN_]:=
 {
 Do[
   {
    
    x1 = RandomReal[{x1min, x1max}],
    x2 = RandomReal[{x2min, x2max}],
    x3 = RandomReal[{x3min, x3max}],
    x4 = RandomReal[{x4min, x4max}],
    
    If[
     RbbINF1sig <= Rbotbot[ghtt, ghbb] <= RbbSUP1sig,
     Write[SalidaRb1sig, 
  FortranForm[x1], " , ", FortranForm[x2], " , ", 
      FortranForm[x3], " , ", FortranForm[x4], " , ", 
      FortranForm[Rbotbot[ghtt, ghbb]]], 0
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
     RbbINF2sig <= Rbotbot[ghtt, ghbb] <= RbbSUP2sig,
     Write[SalidaRb2sig, 
  FortranForm[x1], " , ", FortranForm[x2], " , ", 
      FortranForm[x3], " , ", FortranForm[x4], " , ", 
      FortranForm[Rbotbot[ghtt, ghbb]]], 0
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

PlotRbRandom[ci_, cj_, xlabel_, ylabel_] := 
{ 
ListPlot[Import[FileNameJoin[{$UserDocumentsDirectory, "Rb_random1sigma.txt"}], "CSV"][[All, {ci, cj}]],
  Frame -> True,
  PlotStyle -> {Orange, Opacity[1]},
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
 Placed[{Style["\!\(\*SubscriptBox[\(R\), \(b\)]\)", Larger, 
    Bold]}, {1, 0.6}]*)
  ]
,
ListPlot[Import[FileNameJoin[{$UserDocumentsDirectory, "Rb_random2sigma.txt"}], "CSV"][[All, {ci, cj}]],
  Frame -> True,
  PlotStyle -> {Orange, Opacity[1]},
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
 Placed[{Style["\!\(\*SubscriptBox[\(R\), \(b\)]\)", Larger, 
    Bold]}, {1, 0.6}]*)
  ]
}

(***********************************************************************************************************************)
(****************************************End Rb Random********************************************************)
(***********************************************************************************************************************)


End[]