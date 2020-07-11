
instance DIA_DRAGON_ICE_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_dragon_ice_exit_condition;
	information = dia_dragon_ice_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_dragon_ice_exit_condition()
{
	if(DRAGONTALK_EXIT_FREE == TRUE)
	{
		return TRUE;
	};
};

func void dia_dragon_ice_exit_info()
{
	Npc_RemoveInvItems(other,itmi_innoseye_mis,1);
	CreateInvItems(other,itmi_innoseye_discharged_mis,1);
	AI_Output(self,other,"DIA_Dragon_Ice_Exit_20_00");	//Сила Глаза угасла, и твое время вышло.
	AI_StopProcessInfos(self);
	DRAGONTALK_EXIT_FREE = FALSE;
	self.flags = 0;
	if(DJG_BIFF_STAY == TRUE)
	{
		b_startotherroutine(biff,"Follow");
		DJG_BIFF_STAY = FALSE;
	};
	Wld_InsertNpc(draconian,"FP_ROAM_OW_ICEREGION_29_02");
	Wld_InsertNpc(draconian,"FP_ROAM_OW_ICEREGION_30_01");
	Wld_InsertNpc(draconian,"FP_ROAM_OW_BLOODFLY_05_01");
	Wld_InsertNpc(draconian,"FP_ROAM_OW_BLOODFLY_05_01");
};


instance DIA_DRAGON_ICE_HELLO(C_INFO)
{
	nr = 1;
	condition = dia_dragon_ice_hello_condition;
	information = dia_dragon_ice_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_dragon_ice_hello_condition()
{
	if(Npc_HasItems(other,itmi_innoseye_mis) >= 1)
	{
		return TRUE;
	};
};

func void dia_dragon_ice_hello_info()
{
	AI_Output(self,other,"DIA_Dragon_Ice_Hello_20_00");	//Зачем ты потревожил мой сон? Мне что, закопаться еще глубже, чтобы вы, надоедливые мухи, наконец, оставили меня в покое?
	if(MIS_KILLEDDRAGONS == 0)
	{
		AI_Output(other,self,"DIA_Dragon_Ice_Hello_15_01");	//Говорящий дракон. Спасибо Глазу Инноса.
	};
	AI_Output(self,other,"DIA_Dragon_Ice_Hello_20_02");	//Вы, люди, забавные существа. Даже если вас всех сдуют ледяные ветра смерти, всегда найдется хотя бы один, кто поднимется из пепла, думая, что ему судьбой предназначено стать героем.
	AI_Output(self,other,"DIA_Dragon_Ice_Hello_20_03");	//Но скоро все будет кончено. Я лично позабочусь, чтобы никто из вас больше не поднялся.
	AI_Output(other,self,"DIA_Dragon_Ice_Hello_15_04");	//Молчать! Силой священного Глаза, что дарована мне свыше, я приказываю тебе отвечать на мои вопросы.
	AI_Output(self,other,"DIA_Dragon_Ice_Hello_20_05");	//Ха-ха-ха. Тогда спрашивай. Но твои знания не помогут тебе.
};


instance DIA_DRAGON_ICE_WERBISTDU(C_INFO)
{
	nr = 5;
	condition = dia_dragon_ice_werbistdu_condition;
	information = dia_dragon_ice_werbistdu_info;
	description = "Кто ты?";
};


func int dia_dragon_ice_werbistdu_condition()
{
	if(Npc_KnowsInfo(other,dia_dragon_ice_hello))
	{
		return TRUE;
	};
};

func void dia_dragon_ice_werbistdu_info()
{
	AI_Output(other,self,"DIA_Dragon_Ice_WERBISTDU_15_00");	//Кто ты?
	AI_Output(self,other,"DIA_Dragon_Ice_WERBISTDU_20_01");	//Я Финкрег. Повелитель льда и снега, Страж Конгресса и твоя неминуемая смерть.
};


instance DIA_DRAGON_ICE_BELIAR(C_INFO)
{
	nr = 6;
	condition = dia_dragon_ice_beliar_condition;
	information = dia_dragon_ice_beliar_info;
	description = "Какому богу ты служишь?";
};


func int dia_dragon_ice_beliar_condition()
{
	if(Npc_KnowsInfo(other,dia_dragon_ice_hello))
	{
		return TRUE;
	};
};

func void dia_dragon_ice_beliar_info()
{
	AI_Output(other,self,"DIA_Dragon_Ice_BELIAR_15_00");	//Какому богу ты служишь?
	AI_Output(other,self,"DIA_Dragon_Ice_BELIAR_15_01");	//Какой проклятый бог мог позволить таким презренным созданиям, как ты, ходить по этой земле?
	AI_Output(self,other,"DIA_Dragon_Ice_BELIAR_20_02");	//Не пытайся понять смысл нашего появления здесь, жалкий герой.
	AI_Output(self,other,"DIA_Dragon_Ice_BELIAR_20_03");	//Белиар не только позволил нам появиться здесь - он приказал это.
	AI_Output(self,other,"DIA_Dragon_Ice_BELIAR_20_04");	//Воодушевленные его святыми словами, мы не знаем отдыха, пока его воля не воплотится в жизнь.
};

func void b_assigndragontalk_ice(var C_NPC slf)
{
	dia_dragon_ice_exit.npc = Hlp_GetInstanceID(slf);
	dia_dragon_ice_hello.npc = Hlp_GetInstanceID(slf);
	dia_dragon_ice_werbistdu.npc = Hlp_GetInstanceID(slf);
	dia_dragon_ice_beliar.npc = Hlp_GetInstanceID(slf);
	b_assigndragontalk_main(slf);
};

