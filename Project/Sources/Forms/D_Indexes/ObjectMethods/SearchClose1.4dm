

//identify object names (dont forget that when duplicate objects !)
$FocusRing:="FocusRing1"  //focus ring (visible or dont depending on the focus
$SearchButton:="SearchButton1"  //magnifiing glass used to select criteria
$SearchClose:="SearchClose1"  //close box to clear the critéria
$SearchCriteria:="SearchCriteria1"  //search criteria grey (help)

OBJECT SET VISIBLE:C603(*; $SearchCriteria; True:C214)
OBJECT SET VISIBLE:C603(*; $SearchClose; False:C215)

vSearchValue1:=""

ALL RECORDS:C47([COMPANIES:1])
BuildTextInfos(-1; -1)