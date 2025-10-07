//%attributes = {}

C_LONGINT:C283($1)
C_LONGINT:C283(<>PS_IndexesDemo)

If (Count parameters:C259=0)
	If (Process state:C330(<>PS_IndexesDemo)<0) | (<>PS_IndexesDemo=0)
		<>PS_IndexesDemo:=New process:C317("PS_IndexesDemo"; 0; "PS_IndexesDemo"; 0)
	Else 
		BRING TO FRONT:C326(<>PS_IndexesDemo)
	End if 
Else 
	SET MENU BAR:C67(1)
	
	$Window:=Open form window:C675("D_Indexes"; Plain form window:K39:10; Horizontally centered:K39:1; Vertically centered:K39:4)
	SET WINDOW TITLE:C213(""; $Window)
	<>Page:=0
	
	ENABLE MENU ITEM:C149(1; 1)  //fermer fenetre
	DISABLE MENU ITEM:C150(2; 0)  //édition
	ENABLE MENU ITEM:C149(3; 0)  //mode
	
	DIALOG:C40("D_Indexes")
	
	DISABLE MENU ITEM:C150(1; 1)  //fermer fenetre
	
	<>PS_IndexesDemo:=0
	
End if 