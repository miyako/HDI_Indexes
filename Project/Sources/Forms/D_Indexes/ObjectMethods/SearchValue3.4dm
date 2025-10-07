$event:=Form event code:C388

//identify object names (dont forget that when duplicate objects !)
$FocusRing:="FocusRing3"  //focus ring (visible or dont depending on the focus
$SearchButton:="SearchButton3"  //magnifiing glass used to select criteria
$SearchClose:="SearchClose3"  //close box to clear the critéria
$SearchCriteria:="SearchCriteria3"  //search criteria grey (help)

Case of 
	: ($event=On Load:K2:1)
		
		OBJECT SET VISIBLE:C603(*; $FocusRing; False:C215)
		
	: ($event=On After Keystroke:K2:26)
		
		$CurrentText:=Get edited text:C655
		If ($CurrentText#"")
			OBJECT SET VISIBLE:C603(*; $SearchCriteria; False:C215)
			OBJECT SET VISIBLE:C603(*; $SearchClose; True:C214)
		Else 
			OBJECT SET VISIBLE:C603(*; $SearchCriteria; True:C214)
			OBJECT SET VISIBLE:C603(*; $SearchClose; False:C215)
		End if 
		
		
		If ($CurrentText="")
			ALL RECORDS:C47([COMPANIES:1])
			BuildTextInfos(-1; -1)
		Else 
			
			If (<>r1=1)
				$CurrentText:=$CurrentText+"@"
			End if 
			
			ChronoStart
			QUERY:C277([COMPANIES:1]; [COMPANIES:1]Information:9%$CurrentText)
			ChronoStop
			
			BuildTextInfos(<>Chrono; -1)
		End if 
		
	: ($event=On Getting Focus:K2:7)
		OBJECT SET VISIBLE:C603(*; $FocusRing; True:C214)
		
		
	: ($event=On Losing Focus:K2:8)
		OBJECT SET VISIBLE:C603(*; $FocusRing; False:C215)
		
		$CurrentText:=Get edited text:C655
		If ($CurrentText#"")
			OBJECT SET VISIBLE:C603(*; $SearchCriteria; False:C215)
			OBJECT SET VISIBLE:C603(*; $SearchClose; True:C214)
		Else 
			OBJECT SET VISIBLE:C603(*; $SearchCriteria; True:C214)
			OBJECT SET VISIBLE:C603(*; $SearchClose; False:C215)
		End if 
		
		
End case 
