

InstallSpaceMath[]:=
		Module[
	     	{	unzipDir, tmpzip, packageName, packageDir, fullPath, OverwriteSM, zipDir
			},
        
			packageName = "SpaceMath";
			packageDir = FileNameJoin[{$UserBaseDirectory, "Applications","SpaceMath"}];			

			OverwriteSM="Looks like SpaceMath is already installed. Do you want to replace the content \
			of " <> packageDir <> " with the downloaded version of SpaceMath?";

			If[ DirectoryQ[packageDir],
				If[ None, Quiet@DeleteDirectory[packageDir, DeleteContents -> True], Null,
					If[ ChoiceDialog[OverwriteSM,{"Yes, overwrite the " <> packageName <>" directory"->True,
						"No, I need to do a backup first. Abort installation."->False}, WindowFloating->True, WindowTitle->"Existing SpaceMath Installation detected"],
						Quiet@DeleteDirectory[packageDir, DeleteContents -> True],
						Abort[]
					  ]
				  ]
			  ];

			tmpzip = URLSave["https://github.com/spacemathproject/SpaceMath/archive/developerTAVP.zip",CreateTemporary[]];
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