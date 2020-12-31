
instance DIA_PABLO_EXIT(C_INFO)
{
	npc = mil_319_pablo;
	nr = 999;
	condition = dia_pablo_exit_condition;
	information = dia_pablo_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_pablo_exit_condition()
{
	return TRUE;
};

func void dia_pablo_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PABLO_PICKPOCKET(C_INFO)
{
	npc = mil_319_pablo;
	nr = 900;
	condition = dia_pablo_pickpocket_condition;
	information = dia_pablo_pickpocket_info;
	permanent = TRUE;
	description = "(украсть этот ключ легче легкого)";
};


func int dia_pablo_pickpocket_condition()
{
	if((Npc_GetTalentSkill(other,NPC_TALENT_PICKPOCKET) == 1) && (self.aivar[AIV_PLAYERHASPICKEDMYPOCKET] == FALSE) && (Npc_HasItems(self,itke_city_tower_01) >= 1) && (other.attribute[ATR_DEXTERITY] >= (20 - THEFTDIFF)))
	{
		return TRUE;
	};
};

func void dia_pablo_pickpocket_info()
{
	Info_ClearChoices(dia_pablo_pickpocket);
	Info_AddChoice(dia_pablo_pickpocket,DIALOG_BACK,dia_pablo_pickpocket_back);
	Info_AddChoice(dia_pablo_pickpocket,DIALOG_PICKPOCKET,dia_pablo_pickpocket_doit);
};

func void dia_pablo_pickpocket_doit()
{
	if(other.attribute[ATR_DEXTERITY] >= 20)
	{
		b_giveinvitems(self,other,itke_city_tower_01,1);
		b_givethiefxp();
		Info_ClearChoices(dia_pablo_pickpocket);
	}
	else
	{
		AI_StopProcessInfos(self);
		b_attack(self,other,AR_THEFT,1);
	};
};

func void dia_pablo_pickpocket_back()
{
	Info_ClearChoices(dia_pablo_pickpocket);
};


var int pablo_belogen;

instance DIA_PABLO_WANTED(C_INFO)
{
	npc = mil_319_pablo;
	nr = 1;
	condition = dia_pablo_wanted_condition;
	information = dia_pablo_wanted_info;
	important = TRUE;
};


func int dia_pablo_wanted_condition()
{
	if((hero.guild != GIL_MIL) && (hero.guild != GIL_PAL) && (hero.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_pablo_wanted_info()
{
	AI_Output(self,other,"DIA_Pablo_WANTED_12_00");	//Эй, ты, подожди - мне кажется, я тебя знаю.
	AI_Output(other,self,"DIA_Pablo_WANTED_15_01");	//Что тебе нужно?
	AI_Output(self,other,"DIA_Pablo_WANTED_12_02");	//Я где-то уже видел твое лицо... ах - точно!
	B_UseFakeHeroFace();
	AI_Output(self,other,"DIA_Pablo_WANTED_12_03");	//Вот - мы нашли этот листок у одного из бандитов, на которых наткнулись несколько дней назад - рисунок очень похож на тебя.
	b_giveinvitems(self,other,itwr_poster_mis,1);
	AI_Output(self,other,"DIA_Pablo_WANTED_12_04");	//По-видимому, эти парни искали тебя.
	Info_ClearChoices(dia_pablo_wanted);
	Info_AddChoice(dia_pablo_wanted,"Нет, боюсь, что ты ошибаешься.",dia_pablo_wanted_nothing);
	Info_AddChoice(dia_pablo_wanted,"Хм, я сам бы об этом никогда не догадался.",dia_pablo_wanted_irony);
};

func void dia_pablo_wanted_nothing()
{
	AI_Output(other,self,"DIA_Pablo_WANTED_NOTHING_15_00");	//Нет, боюсь, что ты ошибаешься. Со мной все в порядке...
	AI_Output(self,other,"DIA_Pablo_WANTED_NOTHING_12_01");	//Как скажешь, чужеземец.
	AI_Output(self,other,"DIA_Pablo_Add_12_00");	//Но если это все же ТВОЯ физиономия - и если у тебя возникнут проблемы - постарайся решать их за городом. Здесь и без того трудностей хватает.
	AI_Output(self,other,"DIA_Pablo_WANTED_NOTHING_12_03");	//А чужаки, которые приносят в город проблемы, долго здесь не задерживаются - надеюсь, я ясно выразился.
	PABLO_BELOGEN = TRUE;
	AI_StopProcessInfos(self);
};

func void dia_pablo_wanted_irony()
{
	AI_Output(other,self,"DIA_Pablo_WANTED_IRONY_15_00");	//Хм, я сам бы об этом никогда не догадался.
	AI_Output(self,other,"DIA_Pablo_WANTED_IRONY_12_01");	//Очень смешно... что этим парням было нужно от тебя?
	AI_Output(other,self,"DIA_Pablo_Add_15_01");	//Спроси их сам. Они ведь сидят у вас за решеткой, разве нет?
	AI_Output(self,other,"DIA_Pablo_WANTED_IRONY_12_03");	//Нет - они мертвы.
	AI_Output(other,self,"DIA_Pablo_WANTED_IRONY_15_04");	//Ну, тогда мы никогда этого не узнаем.
	AI_Output(self,other,"DIA_Pablo_Add_12_02");	//Если у тебя какие-то проблемы - иди и поговори с лордом Андрэ. Возможно, он сможет помочь. Ты найдешь его в казармах.
	AI_StopProcessInfos(self);
};


instance DIA_PABLO_BANDITEN(C_INFO)
{
	npc = mil_319_pablo;
	nr = 3;
	condition = dia_pablo_banditen_condition;
	information = dia_pablo_banditen_info;
	permanent = FALSE;
	description = "Что ты знаешь об этих бандитах?";
};


func int dia_pablo_banditen_condition()
{
	return TRUE;
};

func void dia_pablo_banditen_info()
{
	AI_Output(other,self,"DIA_Pablo_Add_15_03");	//Что ты знаешь об этих бандитах?
	AI_Output(self,other,"DIA_Pablo_Add_12_04");	//Все они пришли из этой чертовой колонии. Но затем разделились на несколько групп.
	AI_Output(self,other,"DIA_Pablo_Add_12_05");	//Часть из них устроила себе логово в горах, а другие присоединились к Онару, лендлорду.
	AI_Output(self,other,"DIA_Pablo_Add_12_06");	//Но больше всего проблем доставляют бандиты около города.
	AI_Output(self,other,"DIA_Pablo_Add_12_07");	//Вот почему ни один из торговцев даже носа не высовывает за городские ворота.
};


instance DIA_PABLO_HAKONBANDITS(C_INFO)
{
	npc = mil_319_pablo;
	nr = 3;
	condition = dia_pablo_hakonbandits_condition;
	information = dia_pablo_hakonbandits_info;
	permanent = FALSE;
	description = "Что ты знаешь о бандитах, ограбивших торговца Хакона?";
};


func int dia_pablo_hakonbandits_condition()
{
	if(Npc_KnowsInfo(other,dia_hakon_miliz) && Npc_KnowsInfo(other,dia_pablo_banditen))
	{
		return TRUE;
	};
};

func void dia_pablo_hakonbandits_info()
{
	AI_Output(other,self,"DIA_Pablo_Add_15_20");	//Что ты знаешь о бандитах, ограбивших торговца Хакона?
	AI_Output(self,other,"DIA_Pablo_Add_12_21");	//Ох, ЭТО дело... Не напоминай мне...
	AI_Output(self,other,"DIA_Pablo_Add_12_22");	//Насколько я знаю, именно они ответственны за большинство нападений на торговцев.
	AI_Output(self,other,"DIA_Pablo_Banditen_12_01");	//Эти крысы уползли в свою нору и больше не высовываются оттуда.
	AI_Output(self,other,"DIA_Pablo_Banditen_12_02");	//Как-то, нам даже удалось выследить их и погнаться за ними. Но нам пришлось прервать погоню в лесу у города.
	AI_Output(self,other,"DIA_Pablo_Banditen_12_03");	//Там бродит слишком много всяких зверей и это слишком опасно.
	b_logentry(TOPIC_HAKONBANDITEN,"Бандиты, ограбившие Хакона, скрываются где-то в лесу неподалеку от города.");
	if(PABLO_ANDREMELDEN == FALSE)
	{
		AI_Output(self,other,"DIA_Pablo_Add_12_23");	//Но есть еще кое-что...
		AI_Output(self,other,"DIA_Pablo_Banditen_12_04");	//Часть украденных товаров всплыла в Хоринисе.
		AI_Output(other,self,"DIA_Pablo_Banditen_15_05");	//Это означает, что они имеют возможность контрабандой доставлять товары в город и продавать их...
		AI_Output(self,other,"DIA_Pablo_Banditen_12_06");	//Да, мы подозреваем, что у них есть свой человек в городе. Но нам пока не удалось поймать его.
		AI_Output(self,other,"DIA_Pablo_Banditen_12_07");	//Если тебе удастся выяснить что-нибудь об этом деле, помни, что Лорд Андрэ назначил награду за голову этого скупщика краденного.
		b_logentry(TOPIC_HAKONBANDITEN,"Эти бандиты, вероятно, состоят в сговоре с кем-то из городских дельцов. Лорд Андре назначил награду за голову этого дельца.");
	};
};


instance DIA_PABLO_MYBANDITS(C_INFO)
{
	npc = mil_319_pablo;
	nr = 4;
	condition = dia_pablo_mybandits_condition;
	information = dia_pablo_mybandits_info;
	permanent = FALSE;
	description = "А откуда пришли бандиты, у которых нашли листок с моим изображением?";
};


func int dia_pablo_mybandits_condition()
{
	if(Npc_KnowsInfo(other,dia_pablo_banditen) && Npc_KnowsInfo(other,dia_pablo_wanted))
	{
		return TRUE;
	};
};

func void dia_pablo_mybandits_info()
{
	AI_Output(other,self,"DIA_Pablo_Add_15_08");	//А откуда пришли бандиты, у которых нашли листок с моим изображением?
	if(PABLO_BELOGEN == TRUE)
	{
		AI_Output(self,other,"DIA_Pablo_Add_12_09");	//А-ГА! Так это все же ТВОЯ физиономия там. А почему ты сразу это не признал, а?
		AI_Output(self,other,"DIA_Pablo_Add_12_10");	//(требовательно) За что тебя разыскивают?
		AI_Output(other,self,"DIA_Pablo_Add_15_11");	//Я не знаю - честно!
		AI_Output(self,other,"DIA_Pablo_Add_12_12");	//Да, да. Конечно. Я хочу, чтобы ты кое-что понял. Если бы я думал, что ты был сообщником этих бандитов, ты бы уже отдыхал за решеткой.
		AI_Output(self,other,"DIA_Pablo_Add_12_13");	//Но се же, мне лучше доложить об этом инциденте лорду Андрэ...
		PABLO_ANDREMELDEN = TRUE;
		AI_Output(self,other,"DIA_Pablo_Add_12_14");	//Но - отвечая на твой вопрос...
	};
	AI_Output(self,other,"DIA_Pablo_Add_12_15");	//Мы нашли их неподалеку от поместья лендлорда.
	AI_Output(self,other,"DIA_Pablo_Add_12_16");	//Но они были не похожи на людей Онара.
	AI_Output(self,other,"DIA_Pablo_Add_12_17");	//Я думаю, они были частью банды, которая засела в горах около фермы Онара.
	AI_Output(self,other,"DIA_Pablo_Add_12_18");	//Но если ты захочешь отправиться туда, позволь мне тебя предупредить. Эти головорезы могут сделать котлету из кого угодно!
	AI_Output(other,self,"DIA_Pablo_Add_15_19");	//Я запомню это.
};


instance DIA_PABLO_PERM(C_INFO)
{
	npc = mil_319_pablo;
	nr = 1;
	condition = dia_pablo_perm_condition;
	information = dia_pablo_perm_info;
	permanent = TRUE;
	description = "Как ситуация?";
};


func int dia_pablo_perm_condition()
{
	return TRUE;
};

func void dia_pablo_perm_info()
{
	AI_Output(other,self,"DIA_Pablo_Perm_15_00");	//Как обстановка?
	if(KAPITEL == 3)
	{
		if(MIS_RESCUEBENNET != LOG_SUCCESS)
		{
			if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
			{
				AI_Output(self,other,"DIA_Pablo_Perm_12_01");	//Я всегда говорил, что этим наемникам нельзя доверять.
				AI_Output(self,other,"DIA_Pablo_Perm_12_02");	//Пришло время преподать этому сброду урок. Беннет не мог провернуть все это в одиночку.
			}
			else if(hero.guild == GIL_KDF)
			{
				AI_Output(self,other,"DIA_Pablo_Perm_12_03");	//Я глубоко потрясен убийством достопочтенного паладина Лотара.
				AI_Output(self,other,"DIA_Pablo_Perm_12_04");	//Но я знаю, что церковь подберет справедливое наказание для этого злодей.
			}
			else
			{
				AI_Output(self,other,"DIA_Pablo_Perm_12_05");	//Что ты тут ошиваешься? Если ты собираешься освободить своего дружка наемника, лучше тебе забыть об этом.
			};
		}
		else
		{
			AI_Output(self,other,"DIA_Pablo_Perm_12_06");	//Это тревожит меня. Теперь они пытаются стравить нас друг с другом.
			AI_Output(self,other,"DIA_Pablo_Perm_12_07");	//Если бы тебе не удалось найти настоящего убийцу, оркам даже не пришлось бы ничего делать.
		};
	}
	else if(KAPITEL == 5)
	{
		AI_Output(self,other,"DIA_Pablo_Perm_12_08");	//Я не знаю, что будет с нами, если паладины уйдут отсюда.
	}
	else if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Pablo_Perm_12_09");	//Ты можешь рассчитывать на нас, мы сделаем все возможное, чтобы этот город не превратился в притон для бандитов.
	}
	else if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Pablo_Perm_12_10");	//Постарайся вести себя как подобает. Мы глаз не спускаем с таких как ты.
	}
	else
	{
		AI_Output(self,other,"DIA_Pablo_Perm_12_11");	//Пока все спокойно. Только бандиты у города доставляют нам небольшие проблемы.
	};
};

