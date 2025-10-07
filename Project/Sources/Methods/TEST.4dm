//%attributes = {}
CREATE RECORD:C68([COMPANIES:1])
[COMPANIES:1]ID:1:=Sequence number:C244([COMPANIES:1])

ARRAY POINTER:C280($Ptr; 0)
ARRAY POINTER:C280($Ptr; 30)

$Ptr{11}:=->[COMPANIES:1]Address:3
$Ptr{12}:=->[COMPANIES:1]ZipCode:4
$Ptr{13}:=->[COMPANIES:1]City:5
$Ptr{14}:=->[COMPANIES:1]State:8
$Ptr{15}:=->[COMPANIES:1]Country:7
$Ptr{16}:=->[COMPANIES:1]Phone:6

$Ptr{21}:=->[COMPANIES:1]Name:2

FakeData_FillFields(->$Ptr)  //COMPANY FILL