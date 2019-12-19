
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
				If[ None, Quiet@DeleteDirectory[packageDir, DeleteContents -> True], Null,
					If[ ChoiceDialog[OverwriteSM,{"Yes, overwrite the " <> packageName <>" directory"->True,
						"No, I need to do a backup first. Abort installation."->False}, WindowFloating->True, WindowTitle->"Existing SpaceMath Installation detected"],
						Quiet@DeleteDirectory[packageDir, DeleteContents -> True],
						Abort[]
					  ]
				  ]
			  ];

(*			tmpzip = $PathToSPArc; *)
			tmpzip=SMgetUrl[gitzip];
			unzipDir= tmpzip<>".dir";

			ExtractArchive[tmpzip, unzipDir];
			Quiet@DeleteFile[tmpzip];

			zipDir = FileNames["SpaceMath.m", unzipDir, Infinity];
			fullPath = DirectoryName[zipDir[[1]]];
			zipDir = Last[FileNameSplit[DirectoryName[zipDir[[1]]]]];

			CopyDirectory[fullPath,packageDir];
			Quiet@DeleteDirectory[unzipDir, DeleteContents -> True];

			WriteString["stdout", "\nInstallation complete! Loading SpaceMath ... \n"];
			Get["SpaceMath`"];

];