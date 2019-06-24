
instance DIA_KURGAN_EXIT(C_INFO)
{
	npc = djg_708_kurgan;
	nr = 999;
	condition = dia_kurgan_exit_condition;
	information = dia_kurgan_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_kurgan_exit_condition()
{
	return TRUE;
};

func void dia_kurgan_exit_info()
{
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(biff,400);
};


instance DIA_KURGAN_HELLO(C_INFO)
{
	npc = djg_708_kurgan;
	condition = dia_kurgan_hello_condition;
	information = dia_kurgan_hello_info;
	important = TRUE;
};


func int dia_kurgan_hello_condition()
{
	return TRUE;
};

func void dia_kurgan_hello_info()
{
	AI_Output(self,other,"DIA_Kurgan_HELLO_01_00");	//Эй, ты! Смотри, куда идешь!
	AI_Output(other,self,"DIA_Kurgan_HELLO_15_01");	//Что ты этим хочешь сказать?
	AI_Output(self,other,"DIA_Kurgan_HELLO_01_02");	//Я хочу сказать, что пребывание здесь может не очень хорошо сказаться на твоем здоровье. Это место просто кишит орками и монстрами.
	AI_Output(self,other,"DIA_Kurgan_HELLO_01_03");	//Не говоря уже о драконах. Это просто дружеское предупреждение.
	b_logentry(TOPIC_DRAGONHUNTER,"У входа в Долину рудников мне встретилась группа охотников на драконов. Эти парни хорошо вооружены, но, боюсь, это не произведет особого впечатления на драконов.");
};


instance DIA_KURGAN_ELSE(C_INFO)
{
	npc = djg_708_kurgan;
	condition = dia_kurgan_else_condition;
	information = dia_kurgan_else_info;
	description = "Ты можешь сказать мне что-нибудь, чего я еще не знаю?";
};


func int dia_kurgan_else_condition()
{
	return TRUE;
};

func void dia_kurgan_else_info()
{
	AI_Output(other,self,"DIA_Kurgan_ELSE_15_00");	//Ты можешь сказать мне что-нибудь, чего я еще не знаю?
	AI_Output(self,other,"DIA_Kurgan_ELSE_01_01");	//Я могу дать тебе добрый совет, причем бесплатно.
	AI_Output(self,other,"DIA_Kurgan_ELSE_01_02");	//Нам здесь не нужны трусы, которые падают в обморок, как только почувствуют даже слабый запах дракона.
	AI_Output(self,other,"DIA_Kurgan_ELSE_01_03");	//Возвращайся домой, это работа для настоящих мужчин.
};


instance DIA_KURGAN_LEADER(C_INFO)
{
	npc = djg_708_kurgan;
	condition = dia_kurgan_leader_condition;
	information = dia_kurgan_leader_info;
	description = "Ты что здесь, за главного?";
};


func int dia_kurgan_leader_condition()
{
	return TRUE;
};

func void dia_kurgan_leader_info()
{
	AI_Output(other,self,"DIA_Kurgan_Leader_15_00");	//Ты что здесь, за главного?
	AI_Output(self,other,"DIA_Kurgan_Leader_01_01");	//Я что, похож на главного? Конечно нет. Нам здесь не нужны важничающие кретины, раздающие приказы.
	AI_Output(self,other,"DIA_Kurgan_Leader_01_02");	//Когда Сильвио попытался вести себя как командир, мы показали ему и его парням, что мы думаем об этом.
	AI_Output(self,other,"DIA_Kurgan_Leader_01_03");	//Произошла небольшая стычка. И в конце концов им пришлось убраться.
	AI_Output(self,other,"DIA_Kurgan_Leader_01_04");	//Надеюсь, Сильвио найдет свой конец в кастрюле какого-нибудь орка.
};


instance DIA_KURGAN_KILLDRAGON(C_INFO)
{
	npc = djg_708_kurgan;
	condition = dia_kurgan_killdragon_condition;
	information = dia_kurgan_killdragon_info;
	description = "Так вы хотите убить драконов?";
};


func int dia_kurgan_killdragon_condition()
{
	if(Npc_KnowsInfo(other,dia_kurgan_leader))
	{
		return TRUE;
	};
};


var int kurgan_killdragon_day;

func void dia_kurgan_killdragon_info()
{
	AI_Output(other,self,"DIA_Kurgan_KillDragon_15_00");	//(издеваясь) Так вы хотите убить драконов?
	AI_Output(self,other,"DIA_Kurgan_KillDragon_01_01");	//Надо же, какой догадливый. А ты хоть знаешь, как можно завалить дракона?
	AI_Output(self,other,"DIA_Kurgan_KillDragon_01_02");	//Ты думаешь, он будет спокойно сидеть на месте, когда ты будешь рубить его голову?
	AI_Output(self,other,"DIA_Kurgan_KillDragon_01_03");	//Такие дела требуют тщательного планирования и решительных действий.
	AI_Output(other,self,"DIA_Kurgan_KillDragon_15_04");	//Понимаю. И как вы собираетесь справиться с драконами?
	AI_Output(self,other,"DIA_Kurgan_KillDragon_01_05");	//Сначала мы должны выяснить, где они скрываются.
	AI_Output(self,other,"DIA_Kurgan_KillDragon_01_06");	//Только тогда можно будет подумать о лучшем способе атаковать их.
	KURGAN_KILLDRAGON_DAY = Wld_GetDay();
	Info_AddChoice(dia_kurgan_killdragon,"К сожалению, мне нужно идти.",dia_kurgan_killdragon_weg);
	Info_AddChoice(dia_kurgan_killdragon,"Как вы собираетесь пройти мимо орков?",dia_kurgan_killdragon_orks);
	Info_AddChoice(dia_kurgan_killdragon,"Мне кажется, вы не способны найти даже слепую овцу.",dia_kurgan_killdragon_spott);
};

func void dia_kurgan_killdragon_spott()
{
	AI_Output(other,self,"DIA_Kurgan_KillDragon_spott_15_00");	//Мне кажется, вы не способны найти даже слепую овцу.
	AI_Output(self,other,"DIA_Kurgan_KillDragon_spott_01_01");	//Что? Ты хочешь схлопотать по своей тупой физиономии?
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_kurgan_killdragon_orks()
{
	AI_Output(other,self,"DIA_Kurgan_KillDragon_orks_15_00");	//Как вы собираетесь пройти мимо орков?
	AI_Output(self,other,"DIA_Kurgan_KillDragon_orks_01_01");	//Мы рассмотрим этот вопрос позже.
};

func void dia_kurgan_killdragon_weg()
{
	AI_Output(other,self,"DIA_Kurgan_KillDragon_weg_15_00");	//Мне бы очень хотелось посмотреть, как вы будете делать это, но, к сожалению, мне нужно идти.
	AI_Output(self,other,"DIA_Kurgan_KillDragon_weg_01_01");	//Возвращайся назад, через проход. В противном случае ты рискуешь лишиться руки или ноги.
	AI_StopProcessInfos(self);
};


instance DIA_KURGAN_SEENDRAGON(C_INFO)
{
	npc = djg_708_kurgan;
	condition = dia_kurgan_seendragon_condition;
	information = dia_kurgan_seendragon_info;
	permanent = TRUE;
	description = "Ты еще не видел дракона?";
};


func int dia_kurgan_seendragon_condition()
{
	if(KURGAN_KILLDRAGON_DAY <= (Wld_GetDay() - 2))
	{
		return TRUE;
	};
};

func void dia_kurgan_seendragon_info()
{
	AI_Output(other,self,"DIA_Kurgan_SEENDRAGON_15_00");	//Ты еще не видел дракона?
	AI_Output(self,other,"DIA_Kurgan_SEENDRAGON_01_01");	//Пока нет. Но эта тварь не может скрываться вечно.
};


instance DIA_KURGAN_ALLDRAGONSDEAD(C_INFO)
{
	npc = djg_708_kurgan;
	nr = 5;
	condition = dia_kurgan_alldragonsdead_condition;
	information = dia_kurgan_alldragonsdead_info;
	permanent = FALSE;
	description = "Драконы мертвы.";
};


func int dia_kurgan_alldragonsdead_condition()
{
	if(MIS_ALLDRAGONSDEAD == TRUE)
	{
		return TRUE;
	};
};

func void dia_kurgan_alldragonsdead_info()
{
	AI_Output(other,self,"DIA_Kurgan_AllDragonsDead_15_00");	//Драконы мертвы.
	AI_Output(self,other,"DIA_Kurgan_AllDragonsDead_01_01");	//Ха! И кто, интересно, убил их? Паладины?
	AI_Output(other,self,"DIA_Kurgan_AllDragonsDead_15_02");	//Я.
	AI_Output(self,other,"DIA_Kurgan_AllDragonsDead_01_03");	//(смеется) Ха. Ты даже сам в это не веришь. Хватит нести чушь.
};


instance DIA_KURGAN_PICKPOCKET(C_INFO)
{
	npc = djg_708_kurgan;
	nr = 900;
	condition = dia_kurgan_pickpocket_condition;
	information = dia_kurgan_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_kurgan_pickpocket_condition()
{
	return c_beklauen(34,120);
};

func void dia_kurgan_pickpocket_info()
{
	Info_ClearChoices(dia_kurgan_pickpocket);
	Info_AddChoice(dia_kurgan_pickpocket,DIALOG_BACK,dia_kurgan_pickpocket_back);
	Info_AddChoice(dia_kurgan_pickpocket,DIALOG_PICKPOCKET,dia_kurgan_pickpocket_doit);
};

func void dia_kurgan_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_kurgan_pickpocket);
};

func void dia_kurgan_pickpocket_back()
{
	Info_ClearChoices(dia_kurgan_pickpocket);
};

