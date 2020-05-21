
InstallSpaceMath::notcomp =
"Your Mathematica version is too old. SpaceMath requires at least Mathe 8. Installation aborted!";

InstallSpaceMath::failed =
"Download of `1` failed. Installation aborted!";

AutoOverwriteSpaceMathDirectory::usage="AutoOverwriteSpaceMathDirectory is an option of InstallSpaceMath. If \
set to True, the existing SpaceMath directory will be deleted without any further notice. The default
value None means that the user will be asked by a dialog. False means that the directory will be overwritten.";

AutoDisableInsufficientVersionWarning::usage="AutoDisableInsufficientVersionWarning is an option of InstallSpaceMath. If \
set to True, warning messages for notebooks that were created with a newer Mathematica version will be silently disabled. \
This is needed to use SpaceMath documentation in Mathematica 8 and 9, since otherwise the warning message will appear every \
time one opens a help page for a SpaceMath function. The default value None means that the user will be asked by a dialog. \
False means that the warning will not be disabled.";

SpaceMathDevelopmentVersionLink::usage="SpaceMathDevelopmentVersionLink is an option of InstallSpaceMath. It specifies the url \
to the main repository of SpaceMath. This repository is used to install the development version of SpaceMath.";

SpaceMathStableVersionLink::usage="SpaceMathStableVersionLink is an option of InstallSpaceMath. It specifies the url \
to the latest stable release of SpaceMath.";

InstallSpaceMathDevelopmentVersion::usage="InstallSpaceMathDevelopmentVersion is an option of InstallSpaceMath. If \
set to True, the installer will download the latest development version of SpaceMath from the git repository. \
Otherwise it will install the latest stable version.";

InstallSpaceMathTo::usage="InstallSpaceMathTo is an option of InstallSpaceMath. It specifies, the full path \
to the directory where SpaceMath will be installed.";

$PathToSPArc::usage="$PathToSPArc specifies where the installer should look for the zipped SpaceMath version. \
If the value is not empty, the installer will use the specified file instead of downloading it from the official \
website."

If[ !ValueQ[$PathToSPArc],
	$PathToSPArc = ""
];

If[  $VersionNumber == 8,
Needs["Utilities`URLTools`"];
];

Options[InstallSpaceMath]={
	AutoDisableInsufficientVersionWarning-> None,
	AutoOverwriteSpaceMathDirectory-> None,
	SpaceMathDevelopmentVersionLink->"https://github.com/spacemathproject/SpaceMath/archive/finale.zip",
	SpaceMathStableVersionLink->"https://github.com/spacemathproject/SpaceMath/archive/finale.zip",
	InstallSpaceMathDevelopmentVersion->False,
	InstallSpaceMathTo->FileNameJoin[{$UserBaseDirectory, "Applications","SpaceMath"}]
};
	
InstallSpaceMath[OptionsPattern[]]:=
	Module[{	unzipDir, tmpzip, gitzip, packageName, packageDir, fullPath,
				SMgetUrl, configFileProlog,
				OverwriteSM, zipDir,
				useTraditionalForm},

	If[OptionValue[InstallSpaceMathDevelopmentVersion],
		gitzip = OptionValue[SpaceMathDevelopmentVersionLink],
		gitzip = OptionValue[SpaceMathStableVersionLink]
	];

	useTraditionalForm=True;

	packageName = "SpaceMath";
	packageDir = OptionValue[InstallSpaceMathTo];

OverwriteSM="Looks like SpaceMath is already installed. Do you want to replace the content \
of " <> packageDir <> " with the downloaded version of SpaceMath? If you are using any custom configuration \
files or add-ons that are located in that directory, please backup them in advance.";

configFileProlog ="(*Here you can put some commands and settings to be evaluated on every start of SpaceMath. \n
This allows you to customize your SpaceMath installation to fit your needs best.*)";

	If[$VersionNumber < 8,
		Message[InstallSpaceMath::notcomp];
		Abort[]
	];

	If[$VersionNumber == 8,
		SMgetUrl[x_]:= Utilities`URLTools`FetchURL[x],
		SMgetUrl[x_]:= URLSave[x,CreateTemporary[]]
	];


	(* If the package directory already exists, ask the user about overwriting *)
	If[ DirectoryQ[packageDir],

		If[ OptionValue[AutoOverwriteSpaceMathDirectory],

			Quiet@DeleteDirectory[packageDir, DeleteContents -> True],

			Null,
			If[ ChoiceDialog[OverwriteSM,{"Yes, overwrite the " <> packageName <>" directory"->True,
				"No, I need to do a backup first. Abort installation."->False}, WindowFloating->True, WindowTitle->"Existing SpaceMath Installation detected"],
				Quiet@DeleteDirectory[packageDir, DeleteContents -> True],
				Abort[]
			]
		]
	];

	(* Download SpaceMath tarball	*)
	If[ $PathToSPArc=!="",
		tmpzip = $PathToSPArc;
		WriteString["stdout", "Installing SpaceMath from ", tmpzip," ..."],
		WriteString["stdout", "Downloading SpaceMath from ", gitzip," ..."];
		tmpzip=SMgetUrl[gitzip];
	];

	If[tmpzip===$Failed,
		WriteString["stdout", "\nFailed to download SpaceMath. Please check your interent connection.\nInstallation aborted!"];
		Abort[],

		unzipDir= tmpzip<>".dir";
		WriteString["stdout", "done! \n"];
	];

	(* Extract to the content	*)
	WriteString["stdout", "SpaceMath zip file was saved to ", tmpzip,".\n"];
	WriteString["stdout", "Extracting SpaceMath zip file to ", unzipDir, " ..."];

	If[	ExtractArchive[tmpzip, unzipDir]===$Failed,
		WriteString["stdout", "\nFailed to extract the SpaceMath zip. The file might be corrupted.\nInstallation aborted!"];
		Abort[],
		WriteString["stdout", "done! \n"];
		(* Delete the downloaded file	*)
		If[ $PathToSPArc==="",
			Quiet@DeleteFile[tmpzip];
		]
	];

	WriteString["stdout", "Recognizing the directory structure..."];
	zipDir = FileNames["SpaceMath.m", unzipDir, Infinity];
	If[ Length[zipDir]===1,
		fullPath = DirectoryName[zipDir[[1]]];
		zipDir = Last[FileNameSplit[DirectoryName[zipDir[[1]]]]];
		WriteString["stdout", "done! \n"],
		WriteString["stdout", "\nFailed to recognize the directory structure of the downloaded zip file. \nInstallation aborted!"];
		Abort[]
	];

	(* Move the files to the final destination	*)
	WriteString["stdout", "Copying "<>packageName<>" to ", packageDir, " ..."];

	If[	CopyDirectory[fullPath,packageDir]===$Failed,
		WriteString["stdout", "\nFailed to copy "  <>fullPath<>" to ", packageDir <>". \nInstallation aborted!"];
		Abort[],
		WriteString["stdout", "done! \n"];
		(* Delete the extracted archive *)
		Quiet@DeleteDirectory[unzipDir, DeleteContents -> True];
	];

	WriteString["stdout", "done! \n"];

	(* To have the documentation available immediately after installing SpaceMath (following the advice of Szabolcs Horv'at) *)
	RebuildPacletData[];

	WriteString["stdout", "\nInstallation complete! Loading SpaceMath ... \n"];

	Get["SpaceMath`"];

];