
func int C_CanRemoveKey()
{
	if(Hlp_IsItem(item,itke_evt_undead_02))
	{
		return FALSE;
	};
	Print(ConcatStrings(PRINT_Used,item.description));
	return TRUE;
};

