Case of 
	: (Form event code:C388=On Load:K2:1)
		
		<>NbCompanies:=1000
		<>NbContactsMin:=5
		<>NbContactsMax:=10
		
		<>NbRecCompanies:=Records in table:C83([COMPANIES:1])
		<>NbRecContacts:=Records in table:C83([CONTACTS:6])
		
	: (Form event code:C388=On Timer:K2:25)
		
		CREATE RECORD:C68([COMPANIES:1])
		[COMPANIES:1]ID:1:=Sequence number:C244([COMPANIES:1])
		
		ARRAY POINTER:C280($Ptr; 0)
		ARRAY POINTER:C280($Ptr; 30)
		//$Ptr{1} := pointer on TITLE
		//$Ptr{2} := pointer on ABREVIATED TITLE
		//$Ptr{3} := pointer on FIRSTNAME
		//$Ptr{4} := pointer on SECONDNAME
		//$Ptr{5} := pointer on LASTNAME
		//$Ptr{6} := pointer on SUFFIX (ex: Jr)
		//$Ptr{7} := pointer on MAIDEN NAME
		//$Ptr{8} := pointeur on GENDER (`false = male; true = female) ->BOOLEAN
		//$Ptr{9} := ---- unused yet ---
		//$Ptr{10} := ---- unused yet ---
		
		//$Ptr{11} := pointer on ADRESS
		//$Ptr{12 } = pointer on ZIPCODE
		//$Ptr{13} := pointer on CITY
		//$Ptr{14} := pointer on STATE
		//$Ptr{15} := pointer on COUNTRY
		//$Ptr{16} := pointer on PHONE
		//$Ptr{17} := pointer on MOBILE
		//$Ptr{18} := pointer on FAX
		//$Ptr{19} := pointer on email
		//$Ptr{20} := ---- unused yet ---
		
		//$Ptr{21} := pointer on COMPANY NAME
		//$Ptr{22} := pointer on JOB TYPE
		//$Ptr{23} := pointer on DEPARTMENT NAME
		//$Ptr{24} := ---- unused yet ---
		//$Ptr{25} := ---- unused yet ---
		//$Ptr{26} := ---- unused yet ---
		//$Ptr{27} := ---- unused yet ---
		//$Ptr{28} := ---- unused yet ---
		//$Ptr{29} := ---- unused yet ---
		//$Ptr{30} := ---- unused yet ---
		
		
		$Ptr{11}:=->[COMPANIES:1]Address:3
		$Ptr{12}:=->[COMPANIES:1]ZipCode:4
		$Ptr{13}:=->[COMPANIES:1]City:5
		$Ptr{14}:=->[COMPANIES:1]State:8
		$Ptr{15}:=->[COMPANIES:1]Country:7
		$Ptr{16}:=->[COMPANIES:1]Phone:6
		
		$Ptr{21}:=->[COMPANIES:1]Name:2
		
		FakeData_FillFields(->$Ptr)  //COMPANY FILL
		
		//-------------------------------------------------------------------------------
		
		ARRAY POINTER:C280($Ptr; 0)  //réinit pointeurs
		ARRAY POINTER:C280($Ptr; 30)
		
		C_POINTER:C301($Nil)
		
		$Ptr{1}:=->[CONTACTS:6]Title:10
		$Ptr{2}:=->[CONTACTS:6]HireDate:17
		$Ptr{3}:=->[CONTACTS:6]FirstName:4
		//$Ptr{4}:=->[CONTACTS]SecondPrénom
		$Ptr{5}:=->[CONTACTS:6]LastName:3
		//$Ptr{6}:=->[CONTACTS]Suffixe
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
			[CONTACTS:6]CompanyID:2:=[COMPANIES:1]ID:1
			If (Random:C100>25000)
				$Ptr{4}:=->[CONTACTS:6]Birthday:11
			Else 
				$Ptr{4}:=$Nil
			End if 
			
			If (Random:C100>30000)
				$Ptr{6}:=->[CONTACTS:6]
			Else 
				$Ptr{6}:=$Nil
			End if 
			
			FakeData_FillFields(->$Ptr)  //CONTACTS FILL
			
			SAVE RECORD:C53([CONTACTS:6])
			
		End for 
		
		SAVE RECORD:C53([COMPANIES:1])
		
		<>NbRecCompanies:=Records in table:C83([COMPANIES:1])
		<>NbRecContacts:=Records in table:C83([CONTACTS:6])
		
		<>Thermo:=<>Thermo+1
		If (<>Thermo>=<>NbCompanies)
			<>Thermo:=0
			OBJECT SET TITLE:C194(*; "Btn_Launch"; "Générer")
			SET TIMER:C645(0)
			OBJECT SET VISIBLE:C603(*; "ProgressBar"; False:C215)
		End if 
		
End case 
