
If (<>Thermo<=0)
	
	//lance création
	
	OBJECT SET VISIBLE:C603(*; "ProgressBar@"; True:C214)
	
	$Min:="0"
	$Max:=String:C10(<>NbCompanies)
	$Unité:=String:C10(Round:C94(<>NbCompanies/4; 0))
	$Pas:=$Unité
	$Mode:="0"  //"18"
	$GradFormat:="### ### ##0"
	$Format:=$Min+";"+$Max+";"+$Unité+";"+$Pas+";"+$Mode+";"+$GradFormat
	OBJECT SET FORMAT:C236(*; "ProgressBar@"; $Format)
	
	<>Thermo:=0
	OBJECT SET TITLE:C194(*; "Btn_Launch"; Get localized string:C991("Page1_Abort"))
	SET TIMER:C645(-1)
	
Else 
	
	//interrompt l'exécution
	OBJECT SET VISIBLE:C603(*; "ProgressBar@"; False:C215)
	<>Thermo:=0
	OBJECT SET TITLE:C194(*; "Btn_Launch"; Get localized string:C991("Page1_Generate"))
	SET TIMER:C645(0)
	
End if 