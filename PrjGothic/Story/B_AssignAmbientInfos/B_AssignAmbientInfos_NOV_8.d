
instance DIA_NOV_8_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_nov_8_exit_condition;
	information = dia_nov_8_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_nov_8_exit_condition()
{
	return TRUE;
};

func void dia_nov_8_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_NOV_8_FEGEN(C_INFO)
{
	nr = 2;
	condition = dia_nov_8_fegen_condition;
	information = dia_nov_8_fegen_info;
	permanent = TRUE;
	description = "Мне нужна помощь, чтобы подмести кельи послушников.";
};


func int dia_nov_8_fegen_condition()
{
	if((KAPITEL == 1) && (MIS_KLOSTERARBEIT == LOG_RUNNING) && (NOV_HELFER < 4))
	{
		return TRUE;
	};
};


var int feger3_permanent;

func void dia_nov_8_fegen_info()
{
	AI_Output(other,self,"DIA_NOV_8_Fegen_15_00");	//Мне нужна помощь, чтобы подмести кельи послушников.
	if(Hlp_GetInstanceID(feger3) == Hlp_GetInstanceID(self))
	{
		if(FEGER3_PERMANENT == FALSE)
		{
			AI_Output(self,other,"DIA_NOV_8_Fegen_08_01");	//Ох, парень. Ты только недавно появился здесь и уже заставляешь других делать свою работу?
			AI_Output(self,other,"DIA_NOV_8_Fegen_08_02");	//Не расстраивайся, у меня были такие же проблемы, когда я пришел сюда. Поэтому я помогу тебе. Было бы смешно, если бы мы не справились с этим.
			NOV_HELFER = NOV_HELFER + 1;
			FEGER3_PERMANENT = TRUE;
			b_giveplayerxp(XP_FEGER);
			AI_StopProcessInfos(self);
			Npc_ExchangeRoutine(self,"FEGEN");
			b_logentry(TOPIC_PARLANFEGEN,"Я нашел послушника, желающего помочь мне подметать комнаты.");
		}
		else
		{
			AI_Output(self,other,"DIA_NOV_8_Fegen_08_03");	//Брат, я понимаю твое состояние. И я уже сказал тебе, что помогу тебе. Именно этим я и занимаюсь.
		};
	};
	if(Hlp_GetInstanceID(feger3) == Hlp_GetInstanceID(self) == FALSE)
	{
		AI_Output(self,other,"DIA_NOV_8_Fegen_08_04");	//Эй, я был бы не против, но я очень занят.
	};
};


instance DIA_NOV_8_WURST(C_INFO)
{
	nr = 3;
	condition = dia_nov_8_wurst_condition;
	information = dia_nov_8_wurst_info;
	permanent = TRUE;
	description = "Как насчет вкусной бараньей колбасы?";
};


func int dia_nov_8_wurst_condition()
{
	if((KAPITEL == 1) && (MIS_GORAXESSEN == LOG_RUNNING) && (Npc_HasItems(self,itfo_schafswurst) == 0) && (Npc_HasItems(other,itfo_schafswurst) >= 1))
	{
		return TRUE;
	};
};

func void dia_nov_8_wurst_info()
{
	var string novizetext;
	var string novizeleft;
	AI_Output(other,self,"DIA_NOV_8_Wurst_15_00");	//Как насчет вкусной бараньей колбасы?
	AI_Output(self,other,"DIA_NOV_8_Wurst_08_01");	//Не надейся, не откажусь. Спасибо - это именно то, что мне было нужно.
	b_giveinvitems(other,self,itfo_schafswurst,1);
	WURST_GEGEBEN = WURST_GEGEBEN + 1;
	CreateInvItems(self,itfo_sausage,1);
	b_useitem(self,itfo_sausage);
	novizeleft = IntToString(13 - WURST_GEGEBEN);
	novizetext = ConcatStrings(novizeleft,PRINT_NOVIZENLEFT);
	AI_PrintScreen(novizetext,-1,YPOS_GOLDGIVEN,FONT_SCREENSMALL,3);
};


instance DIA_NOV_8_JOIN(C_INFO)
{
	nr = 4;
	condition = dia_nov_8_join_condition;
	information = dia_nov_8_join_info;
	permanent = TRUE;
	description = "Как мне стать магом?";
};


func int dia_nov_8_join_condition()
{
	if(hero.guild == GIL_NOV)
	{
		return TRUE;
	};
};

func void dia_nov_8_join_info()
{
	AI_Output(other,self,"DIA_NOV_8_JOIN_15_00");	//Как мне стать магом?
	AI_Output(self,other,"DIA_NOV_8_JOIN_08_01");	//Ты станешь Избранным Инноса, только когда высшие маги Огня позволят это.
	AI_Output(self,other,"DIA_NOV_8_JOIN_08_02");	//Послушникам запрещено изучать рунную магию, а старые писания можно почитать только с разрешения магов.
};


instance DIA_NOV_8_PEOPLE(C_INFO)
{
	nr = 5;
	condition = dia_nov_8_people_condition;
	information = dia_nov_8_people_info;
	permanent = TRUE;
	description = "Кто управляет монастырем?";
};


func int dia_nov_8_people_condition()
{
	return TRUE;
};

func void dia_nov_8_people_info()
{
	AI_Output(other,self,"DIA_NOV_8_PEOPLE_15_00");	//Кто управляет монастырем?
	AI_Output(self,other,"DIA_NOV_8_PEOPLE_08_01");	//Высший Совет. Он состоит из трех самых сильных магов нашего ордена. Днем они находятся в церкви.
	AI_Output(self,other,"DIA_NOV_8_PEOPLE_08_02");	//Избранные Инноса - все маги. Иннос дал им этот дар, чтобы они могли претворять в жизнь его волю на земле.
};


instance DIA_NOV_8_LOCATION(C_INFO)
{
	nr = 6;
	condition = dia_nov_8_location_condition;
	information = dia_nov_8_location_info;
	permanent = TRUE;
	description = "Расскажи мне об этом монастыре.";
};


func int dia_nov_8_location_condition()
{
	return TRUE;
};

func void dia_nov_8_location_info()
{
	AI_Output(other,self,"DIA_NOV_8_LOCATION_15_00");	//Расскажи мне об этом монастыре.
	AI_Output(self,other,"DIA_NOV_8_LOCATION_08_01");	//Он очень древний. Его история восходит к временам Робара Первого.
	AI_Output(self,other,"DIA_NOV_8_LOCATION_08_02");	//Под этим монастырем находятся катакомбы. Они простираются далеко вглубь горы.
};


instance DIA_NOV_8_STANDARD(C_INFO)
{
	nr = 10;
	condition = dia_nov_8_standard_condition;
	information = dia_nov_8_standard_info;
	permanent = TRUE;
	description = "Есть что-нибудь новенькое?";
};


func int dia_nov_8_standard_condition()
{
	return TRUE;
};

func void dia_nov_8_standard_info()
{
	AI_Output(other,self,"DIA_NOV_8_STANDARD_15_00");	//Есть что-нибудь новенькое?
	if(KAPITEL == 1)
	{
		if(other.guild == GIL_KDF)
		{
			AI_Output(self,other,"DIA_NOV_8_STANDARD_08_01");	//Можно сказать и так. Уже более ста лет ни один послушник не попадал так быстро в Круг Огня.
			AI_Output(self,other,"DIA_NOV_8_STANDARD_08_02");	//Надеюсь, что я тоже когда-нибудь удостоюсь этой чести. Я готов усердно трудиться ради этого.
		}
		else
		{
			AI_Output(self,other,"DIA_NOV_8_STANDARD_08_03");	//Паладины прибыли на Хоринис совсем недавно. Один из них находится здесь, в монастыре, и проводит время в молитвах.
		};
	};
	if((KAPITEL == 2) || (KAPITEL == 3))
	{
		if((PEDRO_TRAITOR == TRUE) && (MIS_NOVIZENCHASE != LOG_SUCCESS))
		{
			AI_Output(self,other,"DIA_NOV_3_STANDARD_08_04");	//Я все еще не могу поверить в это. Один из нас предал монастырь и украл Глаз Инноса.
			AI_Output(self,other,"DIA_NOV_3_STANDARD_08_05");	//От нашего труда зависит благополучие братства, но мы еще слишком слабы. Вот почему Белиару удалось перетянуть одного из нас на свою сторону.
		}
		else if(MIS_NOVIZENCHASE == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_NOV_3_STANDARD_08_06");	//Слава Инносу, мы смогли вырвать Глаз из лап врага.
			AI_Output(self,other,"DIA_NOV_3_STANDARD_08_07");	//Твое мужество может послужить примером для многих отчаявшихся душ и помочь им выжить в эти темные времена.
		}
		else if(MIS_OLDWORLD == LOG_SUCCESS)
		{
			AI_Output(self,other,"DIA_NOV_8_STANDARD_08_08");	//Я слышал о драконах и об армии Зла. Да пребудет с нами Иннос!
		}
		else
		{
			AI_Output(self,other,"DIA_NOV_8_STANDARD_08_09");	//Высший Совет очень обеспокоен ситуацией, в которую попали наши паладины. Вот уже долгое время нет никаких известий из Долины Рудников.
		};
	};
	if(KAPITEL == 4)
	{
		AI_Output(self,other,"DIA_NOV_8_STANDARD_08_10");	//Нет. И я благодарю нашего Владыку за это. С Глазом Инноса мы сможем уничтожить драконов!
	};
	if(KAPITEL >= 5)
	{
		AI_Output(self,other,"DIA_NOV_8_STANDARD_08_11");	//Да. Мы добились победы над драконами! Иннос показал нам, что никогда не стоит опускать руки. Надежда есть всегда.
		AI_Output(self,other,"DIA_NOV_8_STANDARD_08_12");	//Осталось еще немало теней, и нам придется зажечь много огней, чтобы изгнать их.
	};
};

func void b_assignambientinfos_nov_8(var C_NPC slf)
{
	dia_nov_8_exit.npc = Hlp_GetInstanceID(slf);
	dia_nov_8_join.npc = Hlp_GetInstanceID(slf);
	dia_nov_8_people.npc = Hlp_GetInstanceID(slf);
	dia_nov_8_location.npc = Hlp_GetInstanceID(slf);
	dia_nov_8_standard.npc = Hlp_GetInstanceID(slf);
	dia_nov_8_fegen.npc = Hlp_GetInstanceID(slf);
	dia_nov_8_wurst.npc = Hlp_GetInstanceID(slf);
};

