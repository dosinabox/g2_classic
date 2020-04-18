
var int diego_coming;

instance DIA_GERBRANDT_EXIT(C_INFO)
{
	npc = vlk_403_gerbrandt;
	nr = 999;
	condition = dia_gerbrandt_exit_condition;
	information = dia_gerbrandt_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_gerbrandt_exit_condition()
{
	return TRUE;
};

func void dia_gerbrandt_exit_info()
{
	if(DIEGO_COMING == TRUE)
	{
		DIEGONW = Hlp_GetNpc(pc_thief_nw);
		if(DIEGO_ISONBOARD == FALSE)
		{
			b_startotherroutine(diegonw,"GERBRANDT");
		};
		Npc_ExchangeRoutine(self,"NEWLIFE");
		b_startotherroutine(gerbrandtsfrau,"NEWLIFE");
		DIEGO_COMING = 2;
	};
	AI_StopProcessInfos(self);
};


instance DIA_GERBRANDT_PICKPOCKET(C_INFO)
{
	npc = vlk_403_gerbrandt;
	nr = 900;
	condition = dia_gerbrandt_pickpocket_condition;
	information = dia_gerbrandt_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_40;
};


func int dia_gerbrandt_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_HasItems(self,itse_goldpocket100) >= 1) && (other.attribute[ATR_DEXTERITY] >= (30 - THEFTDIFF)) && (DIEGO_COMING != TRUE))
	{
		return TRUE;
	};
};

func void dia_gerbrandt_pickpocket_info()
{
	Info_ClearChoices(dia_gerbrandt_pickpocket);
	Info_AddChoice(dia_gerbrandt_pickpocket,DIALOG_BACK,dia_gerbrandt_pickpocket_back);
	Info_AddChoice(dia_gerbrandt_pickpocket,DIALOG_PICKPOCKET,dia_gerbrandt_pickpocket_doit);
};

func void dia_gerbrandt_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 30)
	{
		b_giveinvitems(self,other,itse_goldpocket100,1);
		self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] = TRUE;
		b_giveplayerxp(XP_AMBIENT);
		Info_ClearChoices(dia_gerbrandt_pickpocket);
	}
	else
	{
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_gerbrandt_pickpocket_back()
{
	Info_ClearChoices(dia_gerbrandt_pickpocket);
};


instance DIA_GERBRANDT_HELLO(C_INFO)
{
	npc = vlk_403_gerbrandt;
	nr = 5;
	condition = dia_gerbrandt_hello_condition;
	information = dia_gerbrandt_hello_info;
	permanent = FALSE;
	description = "Что ты делаешь здесь?";
};


func int dia_gerbrandt_hello_condition()
{
	if((hero.guild != GIL_KDF) && (hero.guild != GIL_PAL) && (DIEGO_COMING == FALSE))
	{
		return TRUE;
	};
};

func void dia_gerbrandt_hello_info()
{
	AI_Output(other,self,"DIA_Gerbrandt_Hello_15_00");	//Что ты делаешь здесь?
	AI_Output(self,other,"DIA_Gerbrandt_Hello_10_01");	//А ты кто такой? Похоже, ты недавно здесь и понятия не имеешь, с кем имеешь дело.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_10_02");	//Меня зовут Гербрандт. А для тебя я мистер Гербрандт. Понял?
	Info_ClearChoices(dia_gerbrandt_hello);
	Info_AddChoice(dia_gerbrandt_hello,"Я понял, Гербрандт.",dia_gerbrandt_hello_no);
	Info_AddChoice(dia_gerbrandt_hello,"Я понял, мистер Гербрандт.",dia_gerbrandt_hello_yes);
};

func void dia_gerbrandt_hello_no()
{
	AI_Output(other,self,"DIA_Gerbrandt_Hello_No_15_00");	//Я понял, Гербрандт.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_No_10_01");	//Попридержи язык! Тебе лучше проявлять уважение ко мне, иначе у тебя будут большие проблемы...
	AI_Output(self,other,"DIA_Gerbrandt_Hello_No_10_02");	//Здесь я вершу закон. Тому, кто создает проблемы, придется держать ответ передо мной. И лучше ему сразу бежать из города со всех ног, потому что после того, как я разберусь с ним, он пожалеет, что попался мне на глаза!
	AI_Output(self,other,"DIA_Gerbrandt_Hello_No_10_03");	//Большинство людей в порту работает на меня. И если ты ищешь работу, тебе лучше побеспокоиться, чтобы мои воспоминания о тебе были приятными.
	Info_ClearChoices(dia_gerbrandt_hello);
};

func void dia_gerbrandt_hello_yes()
{
	AI_Output(other,self,"DIA_Gerbrandt_Hello_Yes_15_00");	//Я понял, мистер Гербрандт.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_10_01");	//Ну, по крайней мере, тебе не потребовалось много времени, чтобы понять, куда здесь ветер дует.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_10_02");	//Как только бизнес опять пойдет в гору, у меня наверняка найдется работа для такого смышленого паренька, как ты.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_10_03");	//Из тебя бы получился отличный кладовщик.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_10_04");	//Ты умеешь читать?
	Info_ClearChoices(dia_gerbrandt_hello);
	Info_AddChoice(dia_gerbrandt_hello,"Нет.",dia_gerbrandt_hello_yes_no);
	Info_AddChoice(dia_gerbrandt_hello,"Мне не нужна работа.",dia_gerbrandt_hello_nojob);
	Info_AddChoice(dia_gerbrandt_hello,"Конечно.",dia_gerbrandt_hello_yes_yes);
};

func void dia_gerbrandt_hello_yes_no()
{
	AI_Output(other,self,"DIA_Gerbrandt_Hello_Yes_No_15_00");	//Нет.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_No_10_01");	//Ничего, по крайне мере, ты сможешь переложить несколько мешков с места на место.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_No_10_02");	//И если я буду доволен тобой, возможно, я даже предложу тебе постоянное место. Здесь всегда много работы.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_No_10_03");	//Что ж, тогда я жду тебя у себя, как только к пристани пришвартуется первый торговый корабль.
	Info_ClearChoices(dia_gerbrandt_hello);
};

func void dia_gerbrandt_hello_nojob()
{
	AI_Output(other,self,"DIA_Gerbrandt_Hello_NoJob_15_00");	//Мне не нужна работа.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_NoJob_10_01");	//Ты думаешь, ты ужасно крут. Смотри, никто не может получить работу здесь без моего одобрения.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_NoJob_10_02");	//И если ты продолжишь оскорблять меня, ты можешь сразу искать себе соломенный тюфяк с клопами, потому что это будет все, что ты сможешь себе позволить.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_NoJob_10_03");	//Еще придет время, когда ты будешь умолять меня дать тебе работу.
	Info_ClearChoices(dia_gerbrandt_hello);
};

func void dia_gerbrandt_hello_yes_yes()
{
	AI_Output(other,self,"DIA_Gerbrandt_Hello_Yes_Yes_15_00");	//Конечно.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_Yes_10_01");	//Отлично. В наши времена тяжело найти обученных работников.
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_Yes_10_02");	//Как насчет твоих рекомендаций?
	AI_Output(other,self,"DIA_Gerbrandt_Hello_Yes_Yes_15_03");	//Рекомендаций?
	AI_Output(self,other,"DIA_Gerbrandt_Hello_Yes_Yes_10_04");	//Хорошо, я запомню твое лицо. Когда торговля возобновится опять, приходи ко мне. Тогда я дам тебе работу.
	Info_ClearChoices(dia_gerbrandt_hello);
};

func void b_gerbrandt_pissoff()
{
	AI_Output(self,other,"B_Gerbrandt_PissOff_10_00");	//Что это все значит - ты издеваешься надо мной?
	AI_Output(self,other,"B_Gerbrandt_PissOff_10_01");	//Ты и твой приятель Диего уже и так дел натворили.
	AI_Output(self,other,"B_Gerbrandt_PissOff_10_02");	//Оставь меня в покое!
	AI_StopProcessInfos(self);
};


instance DIA_GERBRANDT_PERM(C_INFO)
{
	npc = vlk_403_gerbrandt;
	nr = 800;
	condition = dia_gerbrandt_perm_condition;
	information = dia_gerbrandt_perm_info;
	permanent = TRUE;
	description = "Есть что-нибудь новенькое?";
};


func int dia_gerbrandt_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_gerbrandt_hello))
	{
		return TRUE;
	};
};

func void dia_gerbrandt_perm_info()
{
	AI_Output(other,self,"DIA_Gerbrandt_Perm_15_00");	//Есть новости?
	if(KAPITEL <= 2)
	{
		if((hero.guild != GIL_KDF) && (hero.guild != GIL_PAL))
		{
			AI_Output(self,other,"DIA_Gerbrandt_Perm_10_01");	//Людям вроде тебя нечего делать здесь. Здесь живут порядочные члены общества, а не какие-нибудь бродяги и проходимцы.
			AI_Output(self,other,"DIA_Gerbrandt_Perm_10_02");	//Если тебе когда-нибудь удастся стать богатым и уважаемым, возможно, тебе будут более рады здесь.
		}
		else
		{
			AI_Output(self,other,"DIA_Gerbrandt_Perm_10_03");	//Мне не на что жаловаться, о, благородный рыцарь.
		};
	}
	else if(KAPITEL >= 3)
	{
		if(MIS_DIEGOSRESIDENCE != LOG_SUCCESS)
		{
			if((hero.guild != GIL_KDF) && (hero.guild != GIL_PAL))
			{
				AI_Output(self,other,"DIA_Gerbrandt_Perm_10_04");	//Много я видал таких людей как ты - вы просто не знаете своего места.
				AI_Output(self,other,"DIA_Gerbrandt_Perm_10_05");	//Мне стоит поговорить с губернатором об усилении мер безопасности в верхнем квартале.
			}
			else
			{
				AI_Output(self,other,"DIA_Gerbrandt_Perm_10_06");	//Это никого не касается, кроме меня. Я занят!
			};
		}
		else
		{
			b_gerbrandt_pissoff();
		};
	};
};


instance DIA_GERBRANDT_GREETINGSFROMDIEGO(C_INFO)
{
	npc = vlk_403_gerbrandt;
	nr = 10;
	condition = dia_gerbrandt_greetingsfromdiego_condition;
	information = dia_gerbrandt_greetingsfromdiego_info;
	permanent = FALSE;
	description = "Диего передает тебе привет.";
};


func int dia_gerbrandt_greetingsfromdiego_condition()
{
	if((MIS_DIEGOSRESIDENCE == LOG_RUNNING) && (Npc_HasItems(other,itwr_diegosletter_mis) >= 1))
	{
		return TRUE;
	};
};

func void dia_gerbrandt_greetingsfromdiego_info()
{
	AI_Output(other,self,"DIA_Gerbrandt_GreetingsFromDiego_15_00");	//Диего передает тебе привет.
	AI_Output(self,other,"DIA_Gerbrandt_GreetingsFromDiego_10_01");	//(испуганно) Что? Кто? Какой Диего?
	AI_Output(other,self,"DIA_Gerbrandt_GreetingsFromDiego_15_02");	//Он попросил меня вручить тебе это письмо.
	b_giveinvitems(other,self,itwr_diegosletter_mis,1);
	b_usefakescroll();
	AI_Output(self,other,"DIA_Gerbrandt_GreetingsFromDiego_10_03");	//(возбужденно) Этого не может быть. Мне конец!
	AI_Output(self,other,"DIA_Gerbrandt_GreetingsFromDiego_10_04");	//(в страхе) Он что, уже в городе?
	AI_Output(other,self,"DIA_Gerbrandt_GreetingsFromDiego_15_05");	//Кто?
	AI_Output(self,other,"DIA_Gerbrandt_GreetingsFromDiego_10_06");	//Диего, конечно же!
	AI_Output(other,self,"DIA_Gerbrandt_GreetingsFromDiego_15_07");	//Да, я должен скоро встретиться с ним.
	AI_Output(self,other,"DIA_Gerbrandt_GreetingsFromDiego_10_08");	//(в отчаянии, про себя) Это конец! Все пропало!
	AI_Output(self,other,"DIA_Gerbrandt_GreetingsFromDiego_10_09");	//У меня нет времени, мне нужно уходить отсюда. Быстро. Если он найдет меня здесь, мне конец!
	MIS_DIEGOSRESIDENCE = LOG_SUCCESS;
	b_giveplayerxp(XP_DIEGOSRESIDENCE);
	DIEGO_COMING = TRUE;
};

