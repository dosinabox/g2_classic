
instance VLK_416_MATTEO(NPC_DEFAULT)
{
	name[0] = "Маттео";
	guild = GIL_VLK;
	id = 416;
	voice = 9;
	flags = 0;
	npctype = NPCTYPE_MAIN;
	b_setattributestochapter(self,3);
	fight_tactic = FAI_HUMAN_COWARD;
	EquipItem(self,itmw_1h_vlk_sword);
	b_setnpcvisual(self,MALE,"Hum_Head_Bald",FACE_N_GOMEZ,BODYTEX_N,itar_vlk_m);
	Mdl_SetModelFatness(self,1.8);
	Mdl_ApplyOverlayMds(self,"Humans_Arrogance.mds");
	b_givenpctalents(self);
	b_setfightskills(self,35);
	daily_routine = rtn_start_416;
};


func void rtn_start_416()
{
	ta_stand_armscrossed(8,0,22,0,"NW_CITY_MATTEO");
	ta_sleep(22,0,8,0,"NW_CITY_BED_MATTEO");
};

