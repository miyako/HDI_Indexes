
//interrompt l'exécution
OBJECT SET VISIBLE:C603(*; "ProgressBar@"; False:C215)
<>Thermo:=0
OBJECT SET TITLE:C194(*; "Btn_Launch"; Get localized string:C991("Page1_Generate"))  //page 1
SET TIMER:C645(0)

<>Page:=Selected list items:C379(<>HL)

<>Reload:=True:C214

FORM GOTO PAGE:C247(<>Page)
GOTO OBJECT:C206(Self:C308->)
