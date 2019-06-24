
var int foundvinoskellerei;

func void evt_vinoskellerei_func_s1()
{
	if(FOUNDVINOSKELLEREI == FALSE)
	{
		FOUNDVINOSKELLEREI = TRUE;
		b_giveplayerxp(XP_FOUNDVINOSKELLEREI);
	};
};

