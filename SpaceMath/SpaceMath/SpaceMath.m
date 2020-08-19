(* Mathematica Package *)

(* Created by the Wolfram Workbench OCT/2019 *)


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

HiggsData::usage = "The implementation of the Higgs boson data within the SpaceMath code, \
was closely following the reference : arXiv:1809.10733v2[hep-ex], 10.1140/epjc/s10052-019-6909-y."

LFVprocesses::usage =
"The implementation of the Higgs boson data within the SpaceMath code, \
was closely following the reference : arXiv:1809.10733v2[hep-ex], 10.1140/epjc/s10052-019-6909-y."

ObliquePar::usage =
"The implementation of the Higgs boson data within the SpaceMath code, \
was closely following the reference : arXiv:1809.10733v2[hep-ex], 10.1140/epjc/s10052-019-6909-y."

(* Implementation of the package *)

MakeSpaceMathPrivateContext::usage =
"MakeSpaceMathPrivateContext[val] constructs
SpaceMath`Private`val.";

SMDeclareHeader::usage =
"SMDeclareHeader is an internal SpaceMath function to declare
objects inside an .m file in the same manner as it is done in
the JLink package. It may be used by SpaceMath addons."

Begin["`Private`"]

(* New features*)

SMDeclareHeader[file_] :=
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

MakeSpaceMathPrivateContext[x_String] :=
	MakeSpaceMathPrivateContext[x] =	ToExpression["SpaceMath`Private`"<>x];

End[];


listHiggsData = FileNames[{"*.m"},ToFileName[{$SpaceMathDirectory,"HiggsData"}]];
listLFVprocesses = FileNames[{"*.m"},ToFileName[{$SpaceMathDirectory,"LFVprocesses"}]];
listObliquePar = FileNames[{"*.m"},ToFileName[{$SpaceMathDirectory,"ObliquePar"}]];
listValues = FileNames[{"*.m"},ToFileName[{$SpaceMathDirectory,"Values"}]];
listMisc = FileNames[{"*.m"},ToFileName[{$SpaceMathDirectory,"Miscellaneous"}]];

AppendTo[$ContextPath, "SpaceMath`Package`"];

SMDeclareHeader/@listHiggsData;
SMDeclareHeader/@listLFVprocesses;
SMDeclareHeader/@listObliquePar;
SMDeclareHeader/@listValues;
SMDeclareHeader/@listMisc;

Get/@listHiggsData;
Get/@listLFVprocesses;
Get/@listObliquePar;
Get/@listValues;
Get/@listMisc;


EndPackage[];


If[ Global`$SpaceMathStartupMessages =!= False,
	Print[	Style["SpaceMath ", "Text", Bold], Style[$SpaceMathVersion <> ". For help, see arXiv:2008.00564 [hep-ph]",
				"Text"],Style[", Please see	 ", "Text"],
			Style[DisplayForm@ButtonBox["documentation center", BaseStyle->"Link", ButtonData :> "paclet:SpaceMath/tutorial/SpaceMathOverview",
				ButtonNote -> "paclet:SpaceMath/tutorial/SpaceMathOverview"], "Text"](*,
			Style[", check out the ", "Text"],
				Style[DisplayForm@ButtonBox["wiki",ButtonData :> {URL["https://github.com/spacemathproject/SpaceMath/wiki/SpaceMath"], None},BaseStyle -> "Hyperlink",
				ButtonNote -> "https://github.com/spacemathproject/SpaceMath/wiki/SpaceMath"],"Text"],
			Style[" or write to the ", "Text"],
			Style[DisplayForm@ButtonBox["mailing list.",ButtonData :> {URL["https://github.com/spacemathproject/SpaceMath/wiki/SpaceMath"], None},BaseStyle -> "Hyperlink",
				ButtonNote -> "https://github.com/spacemathproject/SpaceMath/wiki/SpaceMath"],"Text"]*)];
	Print[ Style["See also the supplied ","Text"],

	Style[DisplayForm@ButtonBox["Examples.", BaseStyle -> "Hyperlink",	ButtonFunction :>
							SystemOpen[FileNameJoin[{$SpaceMathDirectory, "Examples"}]],
							Evaluator -> Automatic, Method -> "Preemptive"], "Text"],
	Style[" If you use SpaceMath in your research, please cite arXiv:2008.00564 [hep-ph]","Text"]];
	Print [Style["\[Bullet] SpaceMath Version 1.0","Text"]];
	Print [Style["\[Bullet] Authors:  ","Text"]];
	Print [Style["M. A. Arroyo-Ure\[NTilde]a","Text"]];
	Print [Style["Facultad de Estudios Superiores-Cuautitl\[AAcute]n, Universidad Nacional Aut\[OAcute]noma de M\[EAcute]xico","Text"]];
	Print [Style["T. A. Valencia-P\[EAcute]rez","Text"]];
	Print [Style["Facultad de Ciencias F\[IAcute]sico Matem\[AAcute]ticas, Benem\[EAcute]rita Universidad Aut\[OAcute]noma de Puebla","Text"]];
	];
(*Style[DisplayForm@ButtonBox["SpaceMath_RXX", BaseStyle->"Link", ButtonData :> "paclet:SpaceMath/SPACEMATH_RXX",
				ButtonNote -> "paclet:SpaceMath/SPACEMATH_RXX"], "Text"];*)

BeginPackage["SpaceMath`"];
If[ Global`$LoadAddOns=!={},
	SMDeclareHeader/@Map[ToFileName[{$SpaceMathDirectory,  "AddOns",#},#<>".m"] &, Global`$LoadAddOns];
	Get/@Map[ToFileName[{$SpaceMathDirectory,  "AddOns",#},#<>".m"] &, Global`$LoadAddOns]
];
EndPackage[];

