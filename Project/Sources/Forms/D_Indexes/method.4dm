C_BOOLEAN:C305(<>Reload)
C_LONGINT:C283(<>Page)

Case of 
		
	: (Form event code:C388=On Load:K2:1) | (<>Reload)
		<>Reload:=False:C215
		
		READ ONLY:C145(*)
		
		If (<>Page=0)
			
			//initialisation générale
			ARRAY TEXT:C222($_Fonctions; 0)
			APPEND TO ARRAY:C911($_Fonctions; Get localized string:C991("Page0_StructureAndGeneration"))
			APPEND TO ARRAY:C911($_Fonctions; Get localized string:C991("Page0_BTreeIndexCreation"))
			APPEND TO ARRAY:C911($_Fonctions; Get localized string:C991("Page0_BTreeIndexDemo"))
			APPEND TO ARRAY:C911($_Fonctions; Get localized string:C991("Page0_ClusterIndexCreation"))
			APPEND TO ARRAY:C911($_Fonctions; Get localized string:C991("Page0_ClusterIndexDemo"))
			APPEND TO ARRAY:C911($_Fonctions; Get localized string:C991("Page0_CoompositeIndexCreation"))
			APPEND TO ARRAY:C911($_Fonctions; Get localized string:C991("Page0_CoompositeIndexDemo"))
			APPEND TO ARRAY:C911($_Fonctions; Get localized string:C991("Page0_KeywordsIndexCreation"))
			APPEND TO ARRAY:C911($_Fonctions; Get localized string:C991("Page0_KeywordsIndexDemo"))
			
			If (Shift down:C543)
				APPEND TO ARRAY:C911($_Fonctions; Get localized string:C991("Page0_GraphicSVG"))  //"Transform Images")
			End if 
			
			<>HL:=New list:C375
			For ($i; 1; Size of array:C274($_Fonctions))
				APPEND TO LIST:C376(<>HL; $_Fonctions{$i}; $i)
			End for 
			
			SetIndexButtons  //interface
			
			<>Page:=1
		End if 
		
		SELECT LIST ITEMS BY POSITION:C381(<>HL; <>Page)
		GOTO OBJECT:C206(<>HL)
		
		$resname:="Page"+String:C10(<>Page)+"_TextInfos"
		<>TextInfos:=Get localized string:C991($resname)
		
		Case of 
				
			: (<>Page=1)
				
				<>NbCompanies:=1000
				<>NbContactsMin:=5
				<>NbContactsMax:=10
				
				<>NbRecCompanies:=Records in table:C83([COMPANIES:1])
				<>NbRecContacts:=Records in table:C83([CONTACTS:6])
				
				
			: (<>Page=2)
				
				
			: (<>Page=3)
				
				ALL RECORDS:C47([COMPANIES:1])
				ALL RECORDS:C47([CONTACTS:6])
				
				vSearchCriteria1:=Get localized string:C991("Page3_SearchName")
				vsearchValue1:=""
				
				vSearchCriteria2:=Get localized string:C991("Page3_SearchName")
				vsearchValue2:=""
				
				BuildTextInfos(-1; -1)
				
				
			: (<>Page=4)
				
			: (<>Page=5)
				
				ALL RECORDS:C47([COMPANIES:1])
				REDUCE SELECTION:C351([CONTACTS:6]; 0)
				
				BuildTextInfos(-1; -1)
				
				
			: (<>Page=6)
				
			: (<>Page=7)
				
				ALL RECORDS:C47([COMPANIES:1])
				ALL RECORDS:C47([CONTACTS:6])
				
				BuildTextInfos(-1; -1)
				
			: (<>Page=8)
				
			: (<>Page=9)
				
				READ WRITE:C146([COMPANIES:1])
				ALL RECORDS:C47([COMPANIES:1])
				BuildTextInfos(-1; -1)
				
				<>CompanyInfos:=""
				
				vSearchCriteria3:=Get localized string:C991("Page9_Keyword")
				vSearchValue3:=""
				
				<>r1:=1
				<>r2:=0
				
			: (<>Page=10)
				
			: (<>Page=11)
				
		End case 
		
		
	: (Form event code:C388=On Resize:K2:27)
		<>Resize:=True:C214
		
	: (Form event code:C388=On Selection Change:K2:29)
		
		Case of 
			: (<>Page=5)
				
				If (Focus object:C278=(->[COMPANIES:1]))
					GET HIGHLIGHTED RECORDS:C902([COMPANIES:1]; "CheckedRecord")
					$n:=Records in set:C195("CheckedRecord")
					If ($n#0)
						CUT NAMED SELECTION:C334([COMPANIES:1]; "TempoSelection")
						USE SET:C118("CheckedRecord")
						
						ChronoStart
						RELATE MANY SELECTION:C340([CONTACTS:6]CompanyID:2)
						ChronoStop
						BuildTextInfos(<>Chrono; -1)
						
						USE NAMED SELECTION:C332("TempoSelection")
						HIGHLIGHT RECORDS:C656("CheckedRecord")
						CLEAR SET:C117("CheckedRecord")
					End if 
				End if 
				
			: (<>Page=9)
				
				<>CompanyInfos:=[COMPANIES:1]Information:9
				If (vSearchValue3#"")
					$p:=Position:C15(vSearchValue3; <>CompanyInfos)
					If ($p>0)
						//CHOIX SAISISSABLE(◊CompanyInfos;Vrai)
						HIGHLIGHT TEXT:C210(<>CompanyInfos; $p; $p+Length:C16(vSearchValue3))
						//CHOIX SAISISSABLE(◊CompanyInfos;Faux)
						//GENERER FRAPPE CLAVIER(Tabulation )
						//GENERER FRAPPE CLAVIER(Tabulation )
					End if 
				End if 
				
		End case 
		
	: (Form event code:C388=On Timer:K2:25)
		
		Case of 
				
			: (<>Page=1)
				
				CREATE RECORD:C68([COMPANIES:1])
				[COMPANIES:1]ID:1:=Sequence number:C244([COMPANIES:1])
				
				ARRAY POINTER:C280($Ptr; 0)
				ARRAY POINTER:C280($Ptr; 40)
				
				$Ptr{11}:=->[COMPANIES:1]Address:3  //
				$Ptr{12}:=->[COMPANIES:1]ZipCode:4  //
				$Ptr{13}:=->[COMPANIES:1]City:5  //
				$Ptr{14}:=->[COMPANIES:1]State:8  //
				$Ptr{15}:=->[COMPANIES:1]Country:7  //
				$Ptr{16}:=->[COMPANIES:1]Phone:6  //
				
				$Name:=""
				$Ptr{21}:=->[COMPANIES:1]Name:2  //
				
				$Ptr{31}:=->[COMPANIES:1]Information:9  //
				
				FakeData_FillFields(->$Ptr)  //COMPANY FILL
				
				$CompanyID:=[COMPANIES:1]ID:1
				$Name:=[COMPANIES:1]Name:2
				
				SAVE RECORD:C53([COMPANIES:1])
				
				//-------------------------------------------------------------------------------
				
				ARRAY POINTER:C280($Ptr; 0)  //réinit pointeurs
				ARRAY POINTER:C280($Ptr; 40)
				
				C_POINTER:C301($Nil)
				
				$Ptr{1}:=->[CONTACTS:6]Title:10
				$Ptr{3}:=->[CONTACTS:6]FirstName:4
				$Ptr{5}:=->[CONTACTS:6]LastName:3
				$Ptr{7}:=->[CONTACTS:6]MaidenName:16
				$Ptr{8}:=->[CONTACTS:6]Sex:13
				
				$Ptr{11}:=->[CONTACTS:6]Adress:5
				$Ptr{12}:=->[CONTACTS:6]ZipCode:6
				$Ptr{13}:=->[CONTACTS:6]City:7
				$Ptr{14}:=->[CONTACTS:6]State:18
				$Ptr{15}:=->[CONTACTS:6]Country:19
				$Ptr{16}:=->[CONTACTS:6]Phone:8
				$Ptr{19}:=->[CONTACTS:6]eMail:9
				
				$Ptr{21}:=->[COMPANIES:1]Name:2  //ne sera pas rempli, juste pour email
				
				$Ptr{22}:=->[CONTACTS:6]Job:14
				$Ptr{23}:=->[CONTACTS:6]Department:15
				
				
				$NbContacts:=<>NbContactsMin+(Random:C100%(1+<>NbContactsMax-<>NbContactsMin))
				For ($j; 1; $NbContacts)
					CREATE RECORD:C68([CONTACTS:6])
					[CONTACTS:6]ID:1:=Sequence number:C244([CONTACTS:6])
					[CONTACTS:6]CompanyID:2:=$CompanyID
					
					FakeData_FillFields(->$Ptr)  //CONTACTS FILL
					
					[CONTACTS:6]Birthday:11:=Add to date:C393(!00-00-00!; 1950; 1; 1)+(Random:C100%7300)  //1950-1970
					[CONTACTS:6]HireDate:17:=Add to date:C393(!00-00-00!; 1980; 1; 1)+(Random:C100%3650)  //1980-1990
					
					SAVE RECORD:C53([CONTACTS:6])
					
				End for 
				
				<>NbRecCompanies:=Records in table:C83([COMPANIES:1])
				<>NbRecContacts:=Records in table:C83([CONTACTS:6])
				
				<>Thermo:=<>Thermo+1
				If (<>Thermo>=<>NbCompanies)
					<>Thermo:=0
					OBJECT SET TITLE:C194(*; "Btn_Launch"; Get localized string:C991("Page1_Generate"))
					SET TIMER:C645(0)
					OBJECT SET VISIBLE:C603(*; "ProgressBar@"; False:C215)
				End if 
				
			: (<>Page=2)
				//create btree indexes
				
				Case of 
					: (<>Thermo=0)
						
						ARRAY POINTER:C280(<>_Ptr; 0)
						
						APPEND TO ARRAY:C911(<>_Ptr; ->[COMPANIES:1]ID:1)
						APPEND TO ARRAY:C911(<>_Ptr; ->[COMPANIES:1]Name:2)
						
						APPEND TO ARRAY:C911(<>_Ptr; ->[CONTACTS:6]ID:1)
						APPEND TO ARRAY:C911(<>_Ptr; ->[CONTACTS:6]LastName:3)
						APPEND TO ARRAY:C911(<>_Ptr; ->[CONTACTS:6]ZipCode:6)
						APPEND TO ARRAY:C911(<>_Ptr; ->[CONTACTS:6]City:7)
						
						$NbIndex:=6
						ARRAY TEXT:C222(<>_IndexName; $NbIndex)
						
						For ($i; 1; $NbIndex)
							<>_IndexName{$i}:="Index_Btree_"+String:C10($i; "00")
						End for 
						
					: (<>Thermo<=6)
						
						If (<>BuildIndexes)
							$PtrTable:=Table:C252(Table:C252(<>_ptr{<>Thermo}))
							ARRAY POINTER:C280($Ptr; 1)
							$Ptr{1}:=<>_Ptr{<>Thermo}
							CREATE INDEX:C966($PtrTable->; $Ptr; Standard BTree index:K58:3; <>_IndexName{<>Thermo})
							
						Else 
							DELETE INDEX:C967(<>_IndexName{<>Thermo})
							
						End if 
						
						//afin de voir quelque chose si on demande la suppression OU s'il etat deja construit :  
						DELAY PROCESS:C323(Current process:C322; 10)  //1/6 seconde
						
					: (<>Thermo>=8)  //8 pour voir le thermo passer à 7
						
						ARRAY POINTER:C280(<>_ptr; 0)
						ARRAY TEXT:C222(<>_IndexName; 0)
						
						OBJECT SET VISIBLE:C603(*; "ProgressBar@"; False:C215)
						
						SetIndexState("Btree"; <>BuildIndexes)
						SetIndexButtons
						
						SET TIMER:C645(0)
						
				End case 
				<>Thermo:=<>Thermo+1
				
			: (<>Page=3)
				
			: (<>Page=4)
				//create cluster indexes
				Case of 
					: (<>Thermo=0)
						
						ARRAY POINTER:C280(<>_Ptr; 5)
						ARRAY TEXT:C222(<>_IndexName; 5)
						
						<>_Ptr{1}:=->[COMPANIES:1]ZipCode:4
						<>_Ptr{2}:=->[COMPANIES:1]City:5
						<>_Ptr{3}:=->[COMPANIES:1]State:8
						<>_Ptr{4}:=->[COMPANIES:1]Country:7
						
						<>_Ptr{5}:=->[CONTACTS:6]CompanyID:2
						
						For ($i; 1; 5)
							<>_IndexName{$i}:="Index_Cluster_"+String:C10($i; "00")
						End for 
						
					: (<>Thermo<=5)
						
						If (<>BuildIndexes)
							$PtrTable:=Table:C252(Table:C252(<>_ptr{<>Thermo}))
							ARRAY POINTER:C280($Ptr; 1)
							$Ptr{1}:=<>_Ptr{<>Thermo}
							CREATE INDEX:C966($PtrTable->; $Ptr; Cluster BTree index:K58:4; <>_IndexName{<>Thermo})
						Else 
							DELETE INDEX:C967(<>_IndexName{<>Thermo})
						End if 
						
					: (<>Thermo>=7)  //7 de facon a voir le thermo passer à 6 !
						
						ARRAY POINTER:C280(<>_ptr; 0)
						ARRAY TEXT:C222(<>_IndexName; 0)
						
						OBJECT SET VISIBLE:C603(*; "ProgressBar@"; False:C215)
						
						SetIndexState("Cluster"; <>BuildIndexes)
						SetIndexButtons
						
						SET TIMER:C645(0)
						
				End case 
				
				//afin de voir quelque chose si on demande la suppression OU s'il etat deja construit :  
				DELAY PROCESS:C323(Current process:C322; 10)  //1/6 seconde
				<>Thermo:=<>Thermo+1
				
			: (<>Page=5)
				
			: (<>Page=6)
				
				//create composite indexes
				Case of 
					: (<>Thermo=0)  //-------------
						
						ARRAY POINTER:C280(<>_Ptr; 2)
						ARRAY TEXT:C222(<>_IndexName; 2)
						
						For ($i; 1; 2)
							<>_IndexName{$i}:="Index_Composite_"+String:C10($i; "00")
						End for 
						
					: (<>Thermo=1)  //-------------
						
						<>_Ptr{1}:=->[COMPANIES:1]State:8
						<>_Ptr{2}:=->[COMPANIES:1]City:5
						
						If (<>BuildIndexes)
							CREATE INDEX:C966([COMPANIES:1]; <>_Ptr; Standard BTree index:K58:3; <>_IndexName{<>Thermo})
						Else 
							DELETE INDEX:C967(<>_IndexName{<>Thermo})
						End if 
						
					: (<>Thermo=2)  //-------------
						
						<>_Ptr{1}:=->[CONTACTS:6]LastName:3
						<>_Ptr{2}:=->[CONTACTS:6]FirstName:4
						
						If (<>BuildIndexes)
							CREATE INDEX:C966([CONTACTS:6]; <>_Ptr; Standard BTree index:K58:3; <>_IndexName{<>Thermo})
						Else 
							DELETE INDEX:C967(<>_IndexName{<>Thermo})
						End if 
						
						
					: (<>Thermo>=4)  //4 de facon a voir le thermo passer à 3 !
						
						ARRAY POINTER:C280(<>_ptr; 0)
						ARRAY TEXT:C222(<>_IndexName; 0)
						
						OBJECT SET VISIBLE:C603(*; "ProgressBar@"; False:C215)
						
						SetIndexState("Composite"; <>BuildIndexes)
						SetIndexButtons
						
						SET TIMER:C645(0)
						
				End case 
				
				<>Thermo:=<>Thermo+1
				//afin de voir quelque chose si on demande la suppression OU s'il etat deja construit :  
				DELAY PROCESS:C323(Current process:C322; 10)  //1/6 seconde
				
				
			: (<>Page=7)
				
			: (<>Page=8)
				
				Case of 
					: (<>Thermo=0)
						ARRAY POINTER:C280(<>_Ptr; 1)
						ARRAY TEXT:C222(<>_IndexName; 1)
						
						<>_Ptr{1}:=->[COMPANIES:1]Information:9
						
						For ($i; 1; 1)
							<>_IndexName{$i}:="Index_Keywords_"+String:C10($i; "00")
						End for 
						
					: (<>Thermo<=1)
						If (<>BuildIndexes)
							
							CREATE INDEX:C966([COMPANIES:1]; <>_Ptr; Keywords index:K58:1; <>_IndexName{<>Thermo})
							
						Else 
							DELETE INDEX:C967(<>_IndexName{<>Thermo})
							
						End if 
						
					: (<>Thermo>=2)  //2 pour voir le 1
						ARRAY POINTER:C280(<>_ptr; 0)
						ARRAY TEXT:C222(<>_IndexName; 0)
						
						OBJECT SET VISIBLE:C603(*; "ProgressBar@"; False:C215)
						
						SetIndexState("Keyword"; <>BuildIndexes)
						SetIndexButtons
						
						SET TIMER:C645(0)
						
				End case 
				
				//afin de voir quelque chose si on demande la suppression OU s'il etat deja construit :  
				DELAY PROCESS:C323(Current process:C322; 10)  //1/6 seconde
				<>Thermo:=<>Thermo+1
				
			: (<>Page=9)
				
				
				
		End case 
		
		
		
	: (Form event code:C388=On Unload:K2:2)
		
		<>Page:=0
		CLEAR LIST:C377(<>HL)
		
End case 
