
instance DIA_DRAGON_FIRE_ISLAND_EXIT(C_INFO)
{
	npc = dragon_fire_island;
	nr = 999;
	condition = dia_dragon_fire_island_exit_condition;
	information = dia_dragon_fire_island_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_dragon_fire_island_exit_condition()
{
	if(DRAGONTALK_EXIT_FREE == TRUE)
	{
		return TRUE;
	};
};

func void dia_dragon_fire_island_exit_info()
{
	AI_StopProcessInfos(self);
	DRAGONTALK_EXIT_FREE = FALSE;
	self.flags = 0;
};


instance DIA_DRAGON_FIRE_ISLAND_HELLO(C_INFO)
{
	npc = dragon_fire_island;
	nr = 5;
	condition = dia_dragon_fire_island_hello_condition;
	information = dia_dragon_fire_island_hello_info;
	important = TRUE;
};


func int dia_dragon_fire_island_hello_condition()
{
	if(Npc_HasItems(other,itmi_innoseye_mis) >= 1)
	{
		return TRUE;
	};
};

func void dia_dragon_fire_island_hello_info()
{
	AI_Output(self,other,"DIA_Dragon_Fire_Island_Hello_20_00");	//Стой, человек. Все мои чувства говорят мне, что убийца моей плоти и крови стоит передо мной.
	AI_Output(other,self,"DIA_Dragon_Fire_Island_Hello_15_01");	//Да? Кого ты назвал убийцей, ты, порождение ада?
	if((hero.guild == GIL_DJG) && (DRAGONEGGCOUNTER >= 7))
	{
		AI_Output(self,other,"DIA_Dragon_Fire_Island_Hello_20_02");	//Тебе недостаточно того, что ты уничтожил почти всех наших отпрысков?
	};
	AI_Output(self,other,"DIA_Dragon_Fire_Island_Hello_20_03");	//На твоей совести также мой брат Феоматар, и ты заплатишь за это.
	if((hero.guild == GIL_DJG) && (DRAGONEGGCOUNTER >= 7))
	{
		AI_Output(other,self,"DIA_Dragon_Fire_Island_Hello_15_04");	//Я также собираюсь добраться до остальных из вашего проклятого племени.
		AI_Output(self,other,"DIA_Dragon_Fire_Island_Hello_20_05");	//Ах-х. Я с огромным удовольствием сожгу тебя заживо.
	};
	AI_Output(other,self,"DIA_Dragon_Fire_Island_Hello_15_06");	//Хватит попусту сотрясать воздух. Давай перейдем к делу.
	AI_Output(self,other,"DIA_Dragon_Fire_Island_Hello_20_07");	//Ты зашел слишком далеко, жалкий человечишка, но тебе не уйти отсюда живым.
	Npc_RemoveInvItems(other,itmi_innoseye_mis,1);
	CreateInvItems(other,itmi_innoseye_discharged_mis,1);
	AI_StopProcessInfos(self);
	b_logentry(TOPIC_HALLENVONIRDORATH,"Еще один огненный дракон. Я уже по горло сыт этими тварями. Мне всего лишь нужно перебраться через пропасть, что лежит за этим огненным драконом.");
	DRAGONTALK_EXIT_FREE = FALSE;
	self.flags = 0;
};

