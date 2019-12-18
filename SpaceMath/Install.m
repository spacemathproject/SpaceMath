
InstallSpaceMath::notcomp =
"Your Mathematica version is too old. SpaceMath requires at least Mathematica 8. Installation aborted!";

InstallSpaceMath::failed =
"Download of `1` failed. Installation aborted!";

AutoOverwriteSpaceMathDirectory::usage="AutoOverwriteSpaceMathDirectory is an option of InstallSpaceMath. If \
set to True, the existing SpaceMath directory will be deleted without any further notice. The default
value None means that the user will be asked by a dialog. False means that the directory will be overwritten.";

SpaceMathStableVersionLink::usage="SpaceMathStableVersionLink is an option of InstallSpaceMath. It specifies the url \
to the latest stable release of SpaceMath.";

InstallSpaceMathTo::usage="InstallSpaceMathTo is an option of InstallSpaceMath. It specifies, the full path \
to the directory where SpaceMath will be installed.";

$PathToSPArc::usage="$PathToSPArc specifies where the installer should look for the zipped SpaceMath version. \
If the value is not empty, the installer will use the specified file instead of downloading it from the official \
website."

If[ !ValueQ[$PathToSPArc],
	$PathToSPArc = ""
];

(*
If[  $VersionNumber == 8,
Needs["Utilities`URLTools`"];
];
*)

Options[InstallSpaceMath]={
	AutoOverwriteSpaceMathDirectory-> None,
	SpaceMathStableVersionLink->"https://github.com/spacemathproject/SpaceMath/archive/developerTAVP.zip",
	InstallSpaceMathTo->FileNameJoin[{$UserBaseDirectory, "Applications","SpaceMath"}]
};
	
InstallSpaceMath[OptionsPattern[]]:=
	Module[
			{	unzipDir, tmpzip, gitzip, packageName, packageDir, fullPath,
				SMgetUrl,
				OverwriteSM, zipDir
			},

			gitzip = OptionValue[SpaceMathStableVersionLink];
			packageName = "SpaceMath";
			packageDir = OptionValue[InstallSpaceMathTo];

			OverwriteSM="Looks like SpaceMath is already installed. Do you want to replace the content \
			of " <> packageDir <> " with the downloaded version of SpaceMath? If you are using any custom configuration \
			files or add-ons that are located in that directory, please backup them in advance.";

			SMgetUrl[x_]:= URLSave[x,CreateTemporary[]];

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

tmpzip = $PathToSPArc;
WriteString["stdout", "Installing SpaceMath from ", tmpzip," ..."];
WriteString["stdout", "Downloading SpaceMath from ", gitzip," ..."];
tmpzip=SMgetUrl[gitzip];

unzipDir= tmpzip<>".dir";
WriteString["stdout", "SpaceMath zip file was saved to ", tmpzip,".\n"];
WriteString["stdout", "Extracting SpaceMath zip file to ", unzipDir, " ..."];

ExtractArchive[tmpzip, unzipDir];
Quiet@DeleteFile[tmpzip];

WriteString["stdout", "Recognizing the directory structure..."];
zipDir = FileNames["SpaceMath.m", unzipDir, Infinity];

		fullPath = DirectoryName[zipDir[[1]]];
		zipDir = Last[FileNameSplit[DirectoryName[zipDir[[1]]]]];
(**
	If[ Length[zipDir]===1,
		fullPath = DirectoryName[zipDir[[1]]];
		zipDir = Last[FileNameSplit[DirectoryName[zipDir[[1]]]]];
		WriteString["stdout", "done! \n"],
		WriteString["stdout", "\nFailed to recognize the directory structure of the downloaded zip file. \nInstallation aborted!"];
		Abort[]
	];
*)
(* Move the files to the final destination	*)
WriteString["stdout", "Copying "<>packageName<>" to ", packageDir, " ..."];
CopyDirectory[fullPath,packageDir];
Quiet@DeleteDirectory[unzipDir, DeleteContents -> True];
(*
	If[	CopyDirectory[fullPath,packageDir]===$Failed,
		WriteString["stdout", "\nFailed to copy "  <>fullPath<>" to ", packageDir <>". \nInstallation aborted!"];
		Abort[],
		WriteString["stdout", "done! \n"];
		(* Delete the extracted archive *)
		Quiet@DeleteDirectory[unzipDir, DeleteContents -> True];
	];
*)
WriteString["stdout", "done! \n"];
WriteString["stdout", "\nInstallation complete! Loading SpaceMath ... \n"];
Get["SpaceMath`"];

];