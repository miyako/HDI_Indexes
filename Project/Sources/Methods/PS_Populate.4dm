//%attributes = {}
C_LONGINT:C283($1)
C_LONGINT:C283(<>PS_Populate)

If (Count parameters:C259=0)
	If (Process state:C330(<>PS_Populate)<=0)
		<>PS_Populate:=New process:C317("PS_Populate"; 32000; "PS_Populate"; 0)
	Else 
		BRING TO FRONT:C326(<>PS_Populate)
	End if 
	
Else 
	SET MENU BAR:C67(1)
	//your code here
	READ WRITE:C146([CONTACTS:6])
	READ WRITE:C146([COMPANIES:1])
	
	$Window:=Open form window:C675("D_Indexes"; Plain form window:K39:10; Horizontally centered:K39:1; Vertically centered:K39:4)
	<>Page:=0
	DIALOG:C40("D_Indexes")
	CLOSE WINDOW:C154($Window)
	//end of your code
	<>PS_Populate:=0
End if 