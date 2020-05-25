(* Automatic install *)

InstallSpaceMath[]:=
		Module[
	     	{
	     	 packageName,
	     	 PackageLocation,
	     	 OverwritePackage, 	 
	     	 TempCompressFolder, 	     	     	      	 	     		
	     	 DecompressTempFolder, 
	     	 PathPackage, 
	     	 CompressFolder
			},

			WriteString["stdout", "\n Please wait a moment while installing the package SpaceMath is performed. \n"];			
        
			packageName = "SpaceMath";
			PackageLocation = FileNameJoin[{$UserBaseDirectory, "Applications","SpaceMath"}];			

			OverwritePackage = "Looks like SpaceMath is already installed. Do you want to replace the current content of " <> PackageLocation <> 
			" with the downloaded version of SpaceMath?";

			If[ DirectoryQ[PackageLocation],
				If[ None, Quiet@DeleteDirectory[PackageLocation, DeleteContents -> True], Null,
					If[ ChoiceDialog[OverwritePackage,{"Yes, overwrite the " <> packageName <>" directory"->True,
						"No, I need to do a backup first. Abort installation."->False}, WindowFloating->True, WindowTitle->
						"Existing SpaceMath Installation detected"],
						Quiet@DeleteDirectory[PackageLocation, DeleteContents -> True],
						Abort[]
					  ]
				  ]
			  ];

			TempCompressFolder = URLSave["https://github.com/spacemathproject/SpaceMath/archive/developerTAVP.zip",CreateTemporary[]];
			DecompressTempFolder = TempCompressFolder<>".dir";

			ExtractArchive[TempCompressFolder, DecompressTempFolder];
			Quiet@DeleteFile[TempCompressFolder];

			CompressFolder = FileNames["SpaceMath.m", DecompressTempFolder, Infinity];
			PathPackage = DirectoryName[CompressFolder[[1]]];
			CompressFolder = Last[FileNameSplit[DirectoryName[CompressFolder[[1]]]]];

			CopyDirectory[PathPackage,PackageLocation];
			Quiet@DeleteDirectory[DecompressTempFolder, DeleteContents -> True];

			WriteString["stdout", "\n Installation complete! Loading SpaceMath package ... \n"];
			Get["SpaceMath`"];

];