
prototype MST_DEFAULT_ORCSHAMAN(C_NPC)
{
	name[0] = "Орк-шаман";
	guild = GIL_ORC;
	aivar[AIV_MM_REAL_ID] = ID_ORCSHAMAN;
	voice = 18;
	level = 30;
	attribute[ATR_STRENGTH] = 60;
	attribute[ATR_DEXTERITY] = 60;
	attribute[ATR_HITPOINTS_MAX] = 200;
	attribute[ATR_HITPOINTS] = 200;
	attribute[ATR_MANA_MAX] = 100;
	attribute[ATR_MANA] = 100;
	protection[PROT_BLUNT] = 30;
	protection[PROT_EDGE] = 30;
	protection[PROT_POINT] = 30;
	protection[PROT_FIRE] = 30;
	protection[PROT_FLY] = 30;
	protection[PROT_MAGIC] = 30;
	hitchance[NPC_TALENT_1H] = 60;
	hitchance[NPC_TALENT_2H] = 60;
	hitchance[NPC_TALENT_BOW] = 60;
	hitchance[NPC_TALENT_CROSSBOW] = 60;
	damagetype = DAM_EDGE;
	fight_tactic = FAI_ORC;
	senses = SENSE_HEAR | SENSE_SEE | SENSE_SMELL;
	senses_range = PERC_DIST_ORC_ACTIVE_MAX;
	aivar[AIV_MM_FOLLOWTIME] = FOLLOWTIME_MEDIUM;
	aivar[AIV_MM_FOLLOWINWATER] = FALSE;
};

func void b_setvisuals_orcshaman()
{
	Mdl_SetVisual(self,"Orc.mds");
	Mdl_SetVisualBody(self,"Orc_BodyShaman",DEFAULT,DEFAULT,"Orc_HeadShaman",DEFAULT,DEFAULT,-1);
};


instance ORCSHAMAN_SIT(MST_DEFAULT_ORCSHAMAN)
{
	b_setvisuals_orcshaman();
	EquipItem(self,itmw_2h_orcaxe_01);
	start_aistate = zs_mm_allscheduler;
	aivar[AIV_MM_ORCSITSTART] = ONLYROUTINE;
};

instance ORCSHAMAN_HOSH_PAK(MST_DEFAULT_ORCSHAMAN)
{
	name[0] = "Хош-Пак";
	b_setvisuals_orcshaman();
	EquipItem(self,itmw_2h_orcaxe_01);
	start_aistate = zs_mm_allscheduler;
	aivar[AIV_MM_ORCSITSTART] = ONLYROUTINE;
};

