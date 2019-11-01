(* Mathematica Package *)

(* Created by the Wolfram Workbench OCT/2019 *)

(*
  This package is a modified copy of the NumericalCalculus package, 
  that is provided to help with documentation generation.
*)

If[ MemberQ[$Packages,"SpaceMath`"],
	Print["SpaceMath is already loaded! To reload it, please restart the kernel."];
	Abort[]
];

If[ ($VersionNumber < 10.0),
	Print["You need at least Mathematica 10.0 to run SpaceMath. Quitting the Mathematica kernel."];
	Abort[]
];

(*    Find out where SpaceMath is installed    *)
If[ !ValueQ[SpaceMath`$SpaceMathDirectory],
	SpaceMath`$SpaceMathDirectory =
	DirectoryName[$InputFileName]
];

If[ FileNames["*",{SpaceMath`$SpaceMathDirectory}] === {},
	Print["Could not find a SpaceMath installation. Quitting the Mathematica kernel."];
	Clear[SpaceMath`$SpaceMathDirectory];
	Abort[];
];

(*    Set the version number    *)
SpaceMath`$SpaceMathVersion = "1.0";

(*    Set defaults here, not in the config file    *)
If[ !ValueQ[Global`$SpaceMathStartupMessages],
	Global`$SpaceMathStartupMessages = True
];


If[ !ValueQ[Global`$LoadAddOns],
	Global`$LoadAddOns = {}
];

If[ Global`$SpaceMathStartupMessages=!=False,
	PrintTemporary[Style["Loading SpaceMath from "<>
	SpaceMath`$SpaceMathDirectory, "Text"]]
];

BeginPackage["SpaceMath`"]

HiggsData::usage = "NumLimit[expr, x->x0] numerically finds the limiting \
value of expr as x approaches x0."

LFVprocesses::usage =
"NumD[expr, x, x0] gives a numerical approximation to the derivative of expr \
with respect to x at the point x0."

ObliquePar::usage =
"NumSeries[f, {x, x0, n}] gives a numerical approximation to the series \
expansion of f about the point x == x0 through (x-x0)^n."

(* Implementation of the package *)

MakeFeynCalcPrivateContext::usage =
"MakeFeynCalcPrivateContext[val] constructs
FeynCalc`Private`val.";

FCDeclareHeader::usage =
"FCDeclareHeader is an internal SpeedPackage function to declare
objects inside an .m file in the same manner as it is done in
the JLink package. It may be used by SpeedPackage addons."

Begin["`Private`"]

(* New features*)

FCDeclareHeader[file_] :=
	Module[ {strm, einput, moreLines = True},
		strm = OpenRead[file];
		If[ Head[strm] =!= InputStream,
			Return[$Failed]
		];
		While[
			moreLines,
			einput = Read[strm, Hold[Expression]];
			ReleaseHold[einput];
			If[ einput === $Failed || MatchQ[einput, Hold[_End]],
				moreLines = False
			]
		];
		Close[file]
	];

MakeFeynCalcPrivateContext[x_String] :=
	MakeFeynCalcPrivateContext[x] =	ToExpression["SpaceMath`Private`"<>x];

End[];

(*
boostrappingList = Join[
	Map[ToFileName[{$SpaceMathDirectory,"Utilities"},#]&, {"Utilities.m"}]
];
*)

listHiggsData = FileNames[{"*.m"},ToFileName[{$SpaceMathDirectory,"HiggsData"}]];
listLFVprocesses = FileNames[{"*.m"},ToFileName[{$SpaceMathDirectory,"LFVprocesses"}]];
listObliquePar = FileNames[{"*.m"},ToFileName[{$SpaceMathDirectory,"ObliquePar"}]];
listValues = FileNames[{"*.m"},ToFileName[{$SpaceMathDirectory,"Values"}]];

AppendTo[$ContextPath, "SpaceMath`Package`"];

FCDeclareHeader/@listHiggsData;
FCDeclareHeader/@listLFVprocesses;
FCDeclareHeader/@listObliquePar;
FCDeclareHeader/@listValues;
(*
Get/@boostrappingList
*)
Get/@listHiggsData;
Get/@listLFVprocesses;
Get/@listObliquePar;
Get/@listValues;


EndPackage[];

If[ Global`$SpaceMathStartupMessages =!= False,
	Print[	Style["SpaceMath ", "Text", Bold], Style[$SpaceMathVersion <> ". For help, use the ",
				"Text"],
			Style[DisplayForm@ButtonBox["documentation center", BaseStyle->"Link", ButtonData :> "paclet:SpaceMath/",
				ButtonNote -> "paclet:SpaceMathPackage/"], "Text"],
			Style[", check out the ", "Text"],
			Style[DisplayForm@ButtonBox["wiki",ButtonData :> {URL["https://github.com/spacemathproject/SpaceMath/wiki/SpaceMath"], None},BaseStyle -> "Hyperlink",
				ButtonNote -> "https://github.com/spacemathproject/SpaceMath/wiki/SpaceMath"],"Text"],
			Style[" or write to the ", "Text"],
			Style[DisplayForm@ButtonBox["mailing list.",ButtonData :> {URL["https://github.com/spacemathproject/SpaceMath/wiki/SpaceMath"], None},BaseStyle -> "Hyperlink",
				ButtonNote -> "https://github.com/spacemathproject/SpaceMath/wiki/SpaceMath"],"Text"]];
	Print[ Style["See also the supplied ","Text"],

	Style[DisplayForm@ButtonBox["examples.", BaseStyle -> "Hyperlink",	ButtonFunction :>
							SystemOpen[FileNameJoin[{$SpaceMathDirectory, "Examples"}]],
							Evaluator -> Automatic, Method -> "Preemptive"], "Text"],
	Style[" If you use SpaceMath in your research, please cite","Text"]];
	Print [Style["\[Bullet] SpaceMath Version 1.0","Text"]];
	Print [Style["\[Bullet] Authors:  ","Text"]];
	Print [Style["M. A. Arroyo-Ure\[NTilde]a","Text"]];
	Print [Style["Facultad de Estudios Superiores-Cuautitl\[AAcute]n, Universidad Nacional Aut\[OAcute]noma de M\[EAcute]xico","Text"]];
	Print [Style["T. A. Valencia-P\[EAcute]rez","Text"]];
	Print [Style["Facultad de Ciencias F\[IAcute]sico Matem\[AAcute]ticas, Benem\[EAcute]rita Universidad Aut\[OAcute]noma de Puebla","Text"]];
	];


BeginPackage["SpaceMath`"];
If[ Global`$LoadAddOns=!={},
	FCDeclareHeader/@Map[ToFileName[{$SpaceMathDirectory,  "AddOns",#},#<>".m"] &, Global`$LoadAddOns];
	Get/@Map[ToFileName[{$SpaceMathDirectory,  "AddOns",#},#<>".m"] &, Global`$LoadAddOns]
];
EndPackage[];

