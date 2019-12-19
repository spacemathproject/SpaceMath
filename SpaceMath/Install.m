
InstallSpaceMath::notcomp =
"Your Mathematica version is too old. SpaceMath requires at least Mathematica 8. Installation aborted!";

InstallSpaceMath::failed =
"Download of `1` failed. Installation aborted!";

$PathToSPArc::usage="$PathToSPArc specifies where the installer should look for the zipped SpaceMath version. \
If the value is not empty, the installer will use the specified file instead of downloading it from the official \
website."

If[ !ValueQ[$PathToSPArc],
	$PathToSPArc = ""
];

InstallSpaceMath[]:=
		Module[
	     	{	unzipDir, tmpzip, gitzip, packageName, packageDir, fullPath,
				SMgetUrl,
				OverwriteSM, zipDir
			},
        
			gitzip = "https://github.com/spacemathproject/SpaceMath/archive/developerTAVP.zip";
			packageName = "SpaceMath";
			packageDir = FileNameJoin[{$UserBaseDirectory, "Applications","SpaceMath"}];			

			OverwriteSM="Looks like SpaceMath is already installed. Do you want to replace the content \
			of " <> packageDir <> " with the downloaded version of SpaceMath? If you are using any custom configuration \
			files or add-ons that are located in that directory, please backup them in advance.";

			SMgetUrl[x_]:= URLSave[x,CreateTemporary[]];

	(* If the package directory already exists, ask the user about overwriting *)
	If[ DirectoryQ[packageDir],

(*		If[ OptionValue[AutoOverwriteSpaceMathDirectory], *)
		If[ None,
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

(* Move the files to the final destination	*)
WriteString["stdout", "Copying "<>packageName<>" to ", packageDir, " ..."];
CopyDirectory[fullPath,packageDir];
Quiet@DeleteDirectory[unzipDir, DeleteContents -> True];

WriteString["stdout", "done! \n"];
WriteString["stdout", "\nInstallation complete! Loading SpaceMath ... \n"];
Get["SpaceMath`"];

];