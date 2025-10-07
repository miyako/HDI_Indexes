//%attributes = {}
If (Shift down:C543)
	TRACE:C157
End if 

On_Open_SelectData  //change éventuellement de fichier data

DISABLE MENU ITEM:C150(1; 0)  //file
DISABLE MENU ITEM:C150(2; 0)  //édition
DISABLE MENU ITEM:C150(3; 0)  //mode

If (Records in table:C83([INDEX_SETTINGS:7])=0)
	
	CREATE RECORD:C68([INDEX_SETTINGS:7])
	
	[INDEX_SETTINGS:7]B_Trees:1:=False:C215
	[INDEX_SETTINGS:7]Clusters:2:=False:C215
	[INDEX_SETTINGS:7]Composite:3:=False:C215
	[INDEX_SETTINGS:7]Keywords:4:=False:C215
	
	SAVE RECORD:C53([INDEX_SETTINGS:7])
	UNLOAD RECORD:C212([INDEX_SETTINGS:7])
	
End if 

If (Records in table:C83([COMPANIES:1])=0)
	
	DELETE INDEX:C967("Index_Btree_01")
	DELETE INDEX:C967("Index_Btree_02")
	DELETE INDEX:C967("Index_Btree_03")
	DELETE INDEX:C967("Index_Btree_04")
	DELETE INDEX:C967("Index_Btree_05")
	DELETE INDEX:C967("Index_Btree_06")
	
	DELETE INDEX:C967("Index_Cluster_01")
	DELETE INDEX:C967("Index_Cluster_02")
	DELETE INDEX:C967("Index_Cluster_03")
	DELETE INDEX:C967("Index_Cluster_04")
	DELETE INDEX:C967("Index_Cluster_05")
	
	DELETE INDEX:C967("Index_Composite_01")
	DELETE INDEX:C967("Index_Composite_02")
	
	DELETE INDEX:C967("Index_Keywords_01")
	
	//Index Settings
	
	READ WRITE:C146([INDEX_SETTINGS:7])
	ALL RECORDS:C47([INDEX_SETTINGS:7])
	LOAD RECORD:C52([INDEX_SETTINGS:7])
	[INDEX_SETTINGS:7]B_Trees:1:=False:C215
	[INDEX_SETTINGS:7]Clusters:2:=False:C215
	[INDEX_SETTINGS:7]Composite:3:=False:C215
	[INDEX_SETTINGS:7]Keywords:4:=False:C215
	SAVE RECORD:C53([INDEX_SETTINGS:7])
	UNLOAD RECORD:C212([INDEX_SETTINGS:7])
	READ ONLY:C145([INDEX_SETTINGS:7])
	
End if 

//If (Demo_Open)

PS_IndexesDemo

//Else 
//DISABLE MENU ITEM(1; 1)  //fermer fenetre
//End if 
