

InstallSpaceMath[]:=
		Module[
	     	{ 
	     	 DecompressTempFolder, TempCompressFolder, packageName, PackageLocation, fullPath, OverwritePackage, zipDir
			},
        
			packageName = "SpaceMath";
			PackageLocation = FileNameJoin[{$UserBaseDirectory, "Applications","SpaceMath"}];			

			OverwritePackage="Looks like SpaceMath is already installed. Do you want to replace the content \
			of " <> PackageLocation <> " with the downloaded version of SpaceMath?";

			If[ DirectoryQ[PackageLocation],
				If[ None, Quiet@DeleteDirectory[PackageLocation, DeleteContents -> True], Null,
					If[ ChoiceDialog[OverwritePackage,{"Yes, overwrite the " <> packageName <>" directory"->True,
						"No, I need to do a backup first. Abort installation."->False}, WindowFloating->True, WindowTitle->"Existing SpaceMath Installation detected"],
						Quiet@DeleteDirectory[PackageLocation, DeleteContents -> True],
						Abort[]
					  ]
				  ]
			  ];

			TempCompressFolder = URLSave["https://github.com/spacemathproject/SpaceMath/archive/developerTAVP.zip",CreateTemporary[]];
			DecompressTempFolder= TempCompressFolder<>".dir";

			ExtractArchive[TempCompressFolder, DecompressTempFolder];
			Quiet@DeleteFile[TempCompressFolder];

			zipDir = FileNames["SpaceMath.m", DecompressTempFolder, Infinity];
			fullPath = DirectoryName[zipDir[[1]]];
			zipDir = Last[FileNameSplit[DirectoryName[zipDir[[1]]]]];

			CopyDirectory[fullPath,PackageLocation];
			Quiet@DeleteDirectory[DecompressTempFolder, DeleteContents -> True];

			WriteString["stdout", "\nInstallation complete! Loading SpaceMath ... \n"];
			Get["SpaceMath`"];

];