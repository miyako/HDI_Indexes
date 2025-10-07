//%attributes = {}
C_TEXT:C284($1)
C_BOOLEAN:C305($2)

C_TEXT:C284($IndexType)
C_BOOLEAN:C305($IndexState)

$IndexType:=$1
$IndexState:=$2

READ WRITE:C146([INDEX_SETTINGS:7])
ALL RECORDS:C47([INDEX_SETTINGS:7])
LOAD RECORD:C52([INDEX_SETTINGS:7])

Case of 
	: ($IndexType="Btree")
		[INDEX_SETTINGS:7]B_Trees:1:=$IndexState
	: ($IndexType="Cluster")
		[INDEX_SETTINGS:7]Clusters:2:=$IndexState
	: ($IndexType="Composite")
		[INDEX_SETTINGS:7]Composite:3:=$IndexState
	: ($IndexType="Keyword")
		[INDEX_SETTINGS:7]Keywords:4:=$IndexState
	Else 
		ALERT:C41("?")
End case 

SAVE RECORD:C53([INDEX_SETTINGS:7])
UNLOAD RECORD:C212([INDEX_SETTINGS:7])
READ ONLY:C145([INDEX_SETTINGS:7])
