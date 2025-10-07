$Min:="0"
$Max:="1"
$Unité:="1"
$Pas:=$Unité
$Mode:="0"  //"18"
$GradFormat:="### ### ##0"
$Format:=$Min+";"+$Max+";"+$Unité+";"+$Pas+";"+$Mode+";"+$GradFormat
OBJECT SET FORMAT:C236(*; "ProgressBar@"; $Format)


<>Thermo:=0
<>BuildIndexes:=False:C215
OBJECT SET TITLE:C194(*; "Btn_Launch@"; "Interrompre")
OBJECT SET VISIBLE:C603(*; "ProgressBar@"; True:C214)
SET TIMER:C645(-1)
