

//identify object names (dont forget that when duplicate objects !)
$FocusRing:="FocusRing3"  //focus ring (visible or dont depending on the focus
$SearchButton:="SearchButton3"  //magnifiing glass used to select criteria
$SearchClose:="SearchClose3"  //close box to clear the critéria
$SearchCriteria:="SearchCriteria3"  //search criteria grey (help)

OBJECT SET VISIBLE:C603(*; $SearchCriteria; True:C214)
OBJECT SET VISIBLE:C603(*; $SearchClose; False:C215)

vSearchValue3:=""

ALL RECORDS:C47([COMPANIES:1])
BuildTextInfos(-1; -1)