
instance NONE_110_URSHAK(MST_DEFAULT_ORCSHAMAN)
{
	name[0] = "г№-иръ";
	guild = GIL_FRIENDLY_ORC;
	id = 110;
	voice = 18;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyShaman",DEFAULT,DEFAULT,"Orc_HeadShaman",DEFAULT,DEFAULT,-1);
	fight_tactic = FAI_ORC;
	daily_routine = rtn_prestart_110;
};


func void rtn_prestart_110()
{
	ta_stand_wp(8,0,22,0,"OW_PATH_340");
	ta_stand_wp(22,0,8,0,"OW_PATH_340");
};

func void rtn_start_110()
{
	ta_stand_wp(8,0,22,0,"OW_HOSHPAK_04");
	ta_stand_wp(22,0,8,0,"OW_HOSHPAK_04");
};

