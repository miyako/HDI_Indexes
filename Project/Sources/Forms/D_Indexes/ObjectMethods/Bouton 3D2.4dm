//interrompt l'exécution d'un éventuel minuteur
OBJECT SET VISIBLE:C603(*; "ProgressBar@"; False:C215)
<>Thermo:=0
OBJECT SET TITLE:C194(*; "Btn_Launch"; Get localized string:C991("Page1_Generate"))  //page 1
SET TIMER:C645(0)


<>Page:=<>Page+1
SELECT LIST ITEMS BY POSITION:C381(<>HL; <>Page)
<>Reload:=True:C214

FORM GOTO PAGE:C247(<>Page)
GOTO OBJECT:C206(<>HL)