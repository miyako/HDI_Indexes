//%attributes = {"invisible":true}
#DECLARE($pPtr : Pointer)

var $path : Text
$path:=Get localized document path:C1105("FakeData.blob")
var $fakeDataFile : 4D:C1709.File
$fakeDataFile:=File:C1566($path; fk platform path:K87:2)
var $fakeData : 4D:C1709.Blob
ARRAY TEXT:C222($t; 22; 0)
If ($fakeDataFile.exists)
	$fakeData:=$fakeDataFile.getContent()
	EXPAND BLOB:C535($fakeData)
	var $p : Pointer
	$o:=0
	$i:=0
	Repeat 
		$i+=1
		BLOB TO VARIABLE:C533($fakeData; $t{$i}; $o)
	Until (OK=0)
	DELETE FROM ARRAY:C228($t; $i)
/*
 1 road
 2 town
 3 abc
 4 region
 5 company type
 6 zip
 7 district
 8 area
 9 country
10 title m (long)
11 title m (abbreviation)
12 title f (long)
13 title f (abbreviation)
14 first name m
15 first name f
16 name
17 relation m
18 work 
19 job
20 message
21 format
*/
End if 

ARRAY POINTER:C280($Ptr; 0)
COPY ARRAY:C226($pPtr->; $Ptr)

var $src : Pointer
var $val : Text

For ($i; 1; Size of array:C274($Ptr))
	
	$p:=$Ptr{$i}
	Case of 
		: ($p=Null:C1517)
			
		: ($p=(->[COMPANIES:1]Address:3))
			
			$src:=->$t{18}
			$p->:=$src->{(Random:C100%Size of array:C274($src->))+1}
			
		: ($p=(->[COMPANIES:1]ZipCode:4))
			
			$src:=->$t{6}
			$p->:=$src->{(Random:C100%Size of array:C274($src->))+1}
			
		: ($p=(->[COMPANIES:1]City:5))
			
			$src:=->$t{4}
			$p->:=$src->{(Random:C100%Size of array:C274($src->))+1}
			
		: ($p=(->[COMPANIES:1]State:8))
			
			$src:=->$t{6}
			$p->:=$src->{(Random:C100%Size of array:C274($src->))+1}
			
		: ($p=(->[COMPANIES:1]Country:7))
			
			$src:=->$t{9}
			$p->:=$src->{(Random:C100%Size of array:C274($src->))+1}
			
		: ($p=(->[COMPANIES:1]Phone:6))
			
		: ($p=(->[COMPANIES:1]Name:2))
			
			$src:=->$t{16}
			$p->:=$src->{(Random:C100%Size of array:C274($src->))+1}
			
		: ($p=(->[COMPANIES:1]Information:9))
			
			$src:=->$t{20}
			$p->:=$src->{(Random:C100%Size of array:C274($src->))+1}
			
		: ($p=(->[CONTACTS:6]))
			
		: ($p=(->[CONTACTS:6]Birthday:11))
			
		: ($p=(->[CONTACTS:6]Title:10))
			
			$src:=->$t{13}
			$p->:=$src->{(Random:C100%Size of array:C274($src->))+1}
			
		: ($p=(->[CONTACTS:6]HireDate:17))
			
		: ($p=(->[CONTACTS:6]FirstName:4))
			
			$src:=->$t{15}
			$p->:=$src->{(Random:C100%Size of array:C274($src->))+1}
			
		: ($p=(->[CONTACTS:6]LastName:3))
			
			$src:=->$t{16}
			$p->:=$src->{(Random:C100%Size of array:C274($src->))+1}
			
		: ($p=(->[CONTACTS:6]MaidenName:16))
			
			$src:=->$t{16}
			$p->:=$src->{(Random:C100%Size of array:C274($src->))+1}
			
		: ($p=(->[CONTACTS:6]Sex:13))
			
		: ($p=(->[CONTACTS:6]Adress:5))
			
			$src:=->$t{18}
			$p->:=$src->{(Random:C100%Size of array:C274($src->))+1}
			
		: ($p=(->[CONTACTS:6]ZipCode:6))
			
			$src:=->$t{6}
			$p->:=$src->{(Random:C100%Size of array:C274($src->))+1}
			
		: ($p=(->[CONTACTS:6]City:7))
			
			$src:=->$t{4}
			$p->:=$src->{(Random:C100%Size of array:C274($src->))+1}
			
		: ($p=(->[CONTACTS:6]State:18))
			
			$src:=->$t{6}
			$p->:=$src->{(Random:C100%Size of array:C274($src->))+1}
			
		: ($p=(->[CONTACTS:6]Country:19))
			
			$src:=->$t{9}
			$p->:=$src->{(Random:C100%Size of array:C274($src->))+1}
			
		: ($p=(->[CONTACTS:6]Phone:8))
			
		: ($p=(->[CONTACTS:6]eMail:9))
			
		: ($p=(->[CONTACTS:6]Job:14))
			
			$src:=->$t{19}
			$p->:=$src->{(Random:C100%Size of array:C274($src->))+1}
			
		: ($p=(->[CONTACTS:6]Department:15))
			
			$src:=->$t{18}
			$p->:=$src->{(Random:C100%Size of array:C274($src->))+1}
			
	End case 
	
End for 

