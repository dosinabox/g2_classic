
instance DIA_VLK_17_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_vlk_17_exit_condition;
	information = dia_vlk_17_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_vlk_17_exit_condition()
{
	return TRUE;
};

func void dia_vlk_17_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_VLK_17_JOIN(C_INFO)
{
	nr = 4;
	condition = dia_vlk_17_join_condition;
	information = dia_vlk_17_join_info;
	permanent = TRUE;
	description = "Что нужно для того, чтобы стать гражданином этого города?";
};


func int dia_vlk_17_join_condition()
{
	if((hero.guild == GIL_NONE) && (PLAYER_ISAPPRENTICE == APP_NONE))
	{
		return TRUE;
	};
};

func void dia_vlk_17_join_info()
{
	AI_Output(other,self,"DIA_VLK_17_JOIN_15_00");	//Что нужно для того, чтобы стать гражданином этого города?
	AI_Output(self,other,"DIA_VLK_17_JOIN_17_01");	//Мастера-ремесленники из нижней части города имеют очень большое влияние здесь, в Хоринисе. Тебе стоит поговорить с одним из них.
};


instance DIA_VLK_17_PEOPLE(C_INFO)
{
	nr = 3;
	condition = dia_vlk_17_people_condition;
	information = dia_vlk_17_people_info;
	permanent = TRUE;
	description = "А кто имеет наибольшее влияние в этом городе?";
};


func int dia_vlk_17_people_condition()
{
	return TRUE;
};

func void dia_vlk_17_people_info()
{
	AI_Output(other,self,"DIA_VLK_17_PEOPLE_15_00");	//А кто имеет наибольшее влияние в этом городе?
	AI_Output(self,other,"DIA_VLK_17_PEOPLE_17_01");	//С тех пор, как в город пришли паладины, они взяли в свои руки всю власть.
	AI_Output(self,other,"DIA_VLK_17_PEOPLE_17_02");	//Лорд Андрэ представляет закон. Ты найдешь его в казармах.
	AI_Output(self,other,"DIA_VLK_17_PEOPLE_17_03");	//Но тебе нужно идти к нему, только если ты нарушил закон или хочешь вступить в ополчение.
};


instance DIA_VLK_17_LOCATION(C_INFO)
{
	nr = 2;
	condition = dia_vlk_17_location_condition;
	information = dia_vlk_17_location_info;
	permanent = TRUE;
	description = "В Хоринисе есть интересные места?";
};


func int dia_vlk_17_location_condition()
{
	return TRUE;
};

func void dia_vlk_17_location_info()
{
	AI_Output(other,self,"DIA_VLK_17_LOCATION_15_00");	//В Хоринисе есть интересные места?
	AI_Output(self,other,"DIA_VLK_17_LOCATION_17_01");	//(смеется) Вероятно, тебе лучше спросить об этом мужчин. Если тебе нужны развлечения, попытай счастья в порту.
	AI_Output(self,other,"DIA_VLK_17_LOCATION_17_02");	//Но если ты хочешь что-нибудь купить, иди на рыночную площадь у восточных ворот, или в нижнюю часть города.
};


instance DIA_VLK_17_STANDARD(C_INFO)
{
	nr = 1;
	condition = dia_vlk_17_standard_condition;
	information = dia_vlk_17_standard_info;
	permanent = TRUE;
	description = "Что нового?";
};


func int dia_vlk_17_standard_condition()
{
	return TRUE;
};

func void dia_vlk_17_standard_info()
{
	AI_Output(other,self,"DIA_VLK_17_STANDARD_15_00");	//Что новенького?
	if((KAPITEL == 1) || (KAPITEL == 2))
	{
		AI_Output(self,other,"DIA_VLK_17_STANDARD_17_01");	//Интересно, зачем сюда прибыли паладины? Они заняли городскую ратушу, казармы и гавань, но пока не сделали ровным счетом ничего.
		AI_Output(self,other,"DIA_VLK_17_STANDARD_17_02");	//Если бы они прибыли сюда защищать нас от орков или бандитов, они бы давным-давно расправились с ними. Должно быть, у них какая-то другая причина...
	};
	if(KAPITEL == 3)
	{
		AI_Output(self,other,"DIA_VLK_17_STANDARD_17_03");	//Я только что поняла, что делают здесь паладины. Это все из-за руды. Уж лучше бы они вместо этого защищали город.
	};
	if(KAPITEL == 4)
	{
		AI_Output(self,other,"DIA_VLK_17_STANDARD_17_04");	//Надеюсь, эти слухи о драконах окажутся правдой. Тогда лорду Хагену придется что-то предпринять. Не может же он вот так просто отдать нас на съедение драконам.
	};
	if(KAPITEL == 5)
	{
		AI_Output(self,other,"DIA_VLK_17_STANDARD_17_05");	//Теперь, когда все драконы мертвы, паладины быстро расправятся с оставшимся сбродом.
	};
};

func void b_assignambientinfos_vlk_17(var C_NPC slf)
{
	dia_vlk_17_exit.npc = Hlp_GetInstanceID(slf);
	dia_vlk_17_join.npc = Hlp_GetInstanceID(slf);
	dia_vlk_17_people.npc = Hlp_GetInstanceID(slf);
	dia_vlk_17_location.npc = Hlp_GetInstanceID(slf);
	dia_vlk_17_standard.npc = Hlp_GetInstanceID(slf);
};

