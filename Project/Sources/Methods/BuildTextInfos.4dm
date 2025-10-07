//%attributes = {}
C_LONGINT:C283($1; $2)
C_LONGINT:C283($Chrono1; $Chrono2)

$Chrono1:=$1
$Chrono2:=$2


<>PerfInfos2:=Get localized string:C991("Page3_PerfAndInfos2")
<>PerfInfos2:=Replace string:C233(<>PerfInfos2; "<a1>"; String:C10(Records in selection:C76([COMPANIES:1]); "### ### ##0"))
<>PerfInfos2:=Replace string:C233(<>PerfInfos2; "<a2>"; String:C10(Records in table:C83([COMPANIES:1]); "### ### ##0"))
<>PerfInfos2:=Replace string:C233(<>PerfInfos2; "<b1>"; String:C10(Records in selection:C76([CONTACTS:6]); "### ### ##0"))
<>PerfInfos2:=Replace string:C233(<>PerfInfos2; "<b2>"; String:C10(Records in table:C83([CONTACTS:6]); "### ### ##0"))

//temps de recherche

If ($Chrono1>=1000)
	$Duration:=String:C10(Round:C94($Chrono1/1000; 2); "### ### ##0")
	$Unit:=" sec."
Else 
	$Duration:=String:C10($Chrono1; "##0;-;< 1")
	$Unit:=" ms."
End if 
<>PerfInfos2:=Replace string:C233(<>PerfInfos2; "<n1>"; $Duration)
<>PerfInfos2:=Replace string:C233(<>PerfInfos2; "<Unit1>"; $Unit)

//temps de tri
If ($Chrono2>=1000)
	$Duration:=String:C10(Round:C94($Chrono2/1000; 2); "### ### ##0")
	$Unit:=" sec."
Else 
	$Duration:=String:C10($Chrono2; "##0;-;< 1")
	$Unit:=" ms."
End if 
<>PerfInfos2:=Replace string:C233(<>PerfInfos2; "<n2>"; $Duration)
<>PerfInfos2:=Replace string:C233(<>PerfInfos2; "<Unit2>"; $Unit)

