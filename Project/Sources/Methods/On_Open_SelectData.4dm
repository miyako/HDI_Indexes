//%attributes = {}
//SET DATABASE LOCALIZATION("en")

var $name : Text  //4D Indexes
$name:=Path to object:C1547(Structure file:C489).name

var $dataFileName; $CurLang : Text
$CurLang:=Get database localization:C1009(Current localization:K5:22)
$dataFileName:=[$name; $CurLang; "4DD"].join(".")

var $dataFile : 4D:C1709.File
$dataFile:=File:C1566("/DATA/"+$dataFileName)

If (File:C1566(Data file:C490; fk platform path:K87:2).fullName#$dataFileName) && ($dataFile.exists)
	OPEN DATA FILE:C312($dataFile.platformPath)
End if 

//$DataFile:=Data file

//$find:="."+$CurLang+".4dd"
//$p:=Position($find; $DataFile)

//If ($p<=0)

////The current data does not match the current system langage

//$Sep:=System folder[[Length(System folder)]]
//$StructurePath:=Structure file
//$n:=Length($StructurePath)
//Repeat 
//$n:=$n-1
//Until ($StructurePath[[$n]]=$Sep)
//$StructureFolder:=Substring($StructurePath; 1; $n)

//$StructureName:=Substring($StructurePath; $n+1)
//$p:=Position("."; $StructureName)
//If ($p>0)
//$StructureName:=Substring($StructureName; 1; $p-1)
//End if 

//$SearchedData:=$StructureFolder+$StructureName+"."+$CurLang+".4DD"

//If (Test path name($SearchedData)=Is a document)
//OPEN DATA FILE($SearchedData)
//Else 
////a data that would match the current langage does not exist. so we resign and continue using the current one.
//End if 

//Else 
////The current data matches the current language ...
//End if 


