//%attributes = {}
READ ONLY:C145([INDEX_SETTINGS:7])
ALL RECORDS:C47([INDEX_SETTINGS:7])
LOAD RECORD:C52([INDEX_SETTINGS:7])

If ([INDEX_SETTINGS:7]B_Trees:1=False:C215)
	OBJECT SET ENABLED:C1123(<>bDeleteIndexBtree; False:C215)
	OBJECT SET ENABLED:C1123(<>bCreateIndexBtree; True:C214)
Else 
	OBJECT SET ENABLED:C1123(<>bDeleteIndexBtree; True:C214)
	OBJECT SET ENABLED:C1123(<>bCreateIndexBtree; False:C215)
End if 

If ([INDEX_SETTINGS:7]Clusters:2=False:C215)
	OBJECT SET ENABLED:C1123(<>bDeleteIndexCluster; False:C215)
	OBJECT SET ENABLED:C1123(<>bCreateIndexCluster; True:C214)
Else 
	OBJECT SET ENABLED:C1123(<>bDeleteIndexCluster; True:C214)
	OBJECT SET ENABLED:C1123(<>bCreateIndexCluster; False:C215)
End if 

If ([INDEX_SETTINGS:7]Composite:3=False:C215)
	OBJECT SET ENABLED:C1123(<>bDeleteIndexComposite; False:C215)
	OBJECT SET ENABLED:C1123(<>bCreateIndexComposite; True:C214)
Else 
	OBJECT SET ENABLED:C1123(<>bDeleteIndexComposite; True:C214)
	OBJECT SET ENABLED:C1123(<>bCreateIndexComposite; False:C215)
End if 

If ([INDEX_SETTINGS:7]Keywords:4=False:C215)
	OBJECT SET ENABLED:C1123(<>bDeleteIndexKeywords; False:C215)
	OBJECT SET ENABLED:C1123(<>bCreateIndexKeywords; True:C214)
Else 
	OBJECT SET ENABLED:C1123(<>bDeleteIndexKeywords; True:C214)
	OBJECT SET ENABLED:C1123(<>bCreateIndexKeywords; False:C215)
End if 
