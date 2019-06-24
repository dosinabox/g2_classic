
instance DIA_PEDRO_DI_EXIT(C_INFO)
{
	npc = nov_600_pedro_di;
	nr = 999;
	condition = dia_pedro_di_exit_condition;
	information = dia_pedro_di_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_pedro_di_exit_condition()
{
	return TRUE;
};

func void dia_pedro_di_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PEDRO_DI_YOU(C_INFO)
{
	npc = nov_600_pedro_di;
	nr = 2;
	condition = dia_pedro_di_you_condition;
	information = dia_pedro_di_you_info;
	description = "Предатель!";
};


func int dia_pedro_di_you_condition()
{
	return TRUE;
};

func void dia_pedro_di_you_info()
{
	AI_Output(other,self,"DIA_Pedro_DI_YOU_15_00");	//Предатель! Наконец-то я нашел тебя.
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(other,self,"DIA_Pedro_DI_YOU_15_01");	//Ты можешь не надеяться, что я пощажу тебя, потому что я паладин.
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(other,self,"DIA_Pedro_DI_YOU_15_02");	//Многие из нас, наемников, продали свою душу Белиару, и зачастую я чувствую вину, когда убиваю их. Но для тебя, подлая свинья, я сделаю исключение!
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(other,self,"DIA_Pedro_DI_YOU_15_03");	//Из всех бездушных ублюдков, что я встречал в своей жизни, ты худший. Ты позор для нашего ордена.
	};
	AI_Output(other,self,"DIA_Pedro_DI_YOU_15_04");	//Я должен убить тебя на месте.
	AI_Output(self,other,"DIA_Pedro_DI_YOU_09_05");	//Подожди. Умоляю. На меня наложили заклинание. Я никогда бы не предал монастырь по своей воле.
	AI_Output(self,other,"DIA_Pedro_DI_YOU_09_06");	//Ты не представляешь, через что я прошел за последние несколько дней. Они поместили этот голос в мою голову. Я не смог защититься от него.
	AI_Output(self,other,"DIA_Pedro_DI_YOU_09_07");	//Полковник орков допрашивал меня несколько дней. Он постоянно бил меня. Пощади. Я не виновен. Ты должен поверить мне.
	Info_ClearChoices(dia_pedro_di_you);
	Info_AddChoice(dia_pedro_di_you,"Рассказывай, что ты знаешь.",dia_pedro_di_you_verschon);
	Info_AddChoice(dia_pedro_di_you,"И слышать ничего не хочу. Я убью тебя.",dia_pedro_di_you_tot);
	Info_AddChoice(dia_pedro_di_you,"Назови хотя бы одну причину, по которой я должен поверить тебе.",dia_pedro_di_you_grund);
	if(MIS_GORAX_KILLPEDRO == LOG_RUNNING)
	{
		Info_AddChoice(dia_pedro_di_you,"Серпентес дал мне приказ убить тебя.",dia_pedro_di_you_serpentes);
	};
};

func void dia_pedro_di_you_grund()
{
	AI_Output(other,self,"DIA_Pedro_DI_YOU_grund_15_00");	//Назови хотя бы одну причину, по которой я должен поверить тебе.
	AI_Output(self,other,"DIA_Pedro_DI_YOU_grund_09_01");	//(умоляюще) Оставь меня в живых. Я могу рассказать кое-что, что поможет тебе выбраться отсюда. Ты должен выслушать меня.
};


var int pedrodi_flee;

func void dia_pedro_di_you_tot()
{
	AI_Output(other,self,"DIA_Pedro_DI_YOU_tot_15_00");	//И слышать ничего не хочу. Я убью тебя.
	AI_Output(self,other,"DIA_Pedro_DI_YOU_tot_09_01");	//Умоляю всеми богами...
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Ship");
	b_attack(self,other,AR_NONE,1);
	PEDRODI_FLEE = LOG_RUNNING;
};

func void dia_pedro_di_you_serpentes()
{
	AI_Output(other,self,"DIA_Pedro_DI_YOU_Serpentes_15_00");	//Серпентес дал мне приказ убить тебя. Это вопрос принципа. И я сделаю то, что мне приказано.
	AI_Output(self,other,"DIA_Pedro_DI_YOU_Serpentes_09_01");	//(умоляюще) Пожалуйста, нет. Ты не можешь сделать это. Я могу очень пригодиться тебе. Ты увидишь это.
	b_giveplayerxp(XP_PEDRO_SERPENTESMISSION);
	MIS_GORAX_KILLPEDRO = LOG_SUCCESS;
};

func void dia_pedro_di_you_verschon()
{
	AI_Output(other,self,"DIA_Pedro_DI_YOU_verschon_15_00");	//Рассказывай, что ты знаешь.
	AI_Output(self,other,"DIA_Pedro_DI_YOU_verschon_09_01");	//(облегченно) Да, конечно. Я расскажу тебе все, что ты хочешь знать. Но при одном условии. Ты должен забрать меня с этого проклятого острова, слышишь?
	Info_ClearChoices(dia_pedro_di_you);
	Info_AddChoice(dia_pedro_di_you,"И слышать ничего не хочу. Я убью тебя.",dia_pedro_di_you_tot);
	Info_AddChoice(dia_pedro_di_you,"Хорошо. Иди за мной, я отведу тебя на корабль.",dia_pedro_di_you_followship);
};


var int mis_pedro_di_followship;

func void dia_pedro_di_you_followship()
{
	AI_Output(other,self,"DIA_Pedro_DI_YOU_FollowShip_15_00");	//Хорошо. Иди за мной, я отведу тебя на корабль.
	AI_Output(self,other,"DIA_Pedro_DI_YOU_FollowShip_09_01");	//Спасибо. Ты не пожалеешь об этом.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"FollowShip");
	self.aivar[AIV_PARTYMEMBER] = TRUE;
	MIS_PEDRO_DI_FOLLOWSHIP = LOG_RUNNING;
};


instance DIA_PEDRO_DI_ARRIVEDATSHIP(C_INFO)
{
	npc = nov_600_pedro_di;
	nr = 4;
	condition = dia_pedro_di_arrivedatship_condition;
	information = dia_pedro_di_arrivedatship_info;
	description = "Пришли!";
};


func int dia_pedro_di_arrivedatship_condition()
{
	if((Npc_GetDistToWP(self,"SHIP") < 6000) && (MIS_PEDRO_DI_FOLLOWSHIP == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_pedro_di_arrivedatship_info()
{
	AI_Output(other,self,"DIA_Pedro_DI_ArrivedAtShip_15_00");	//Пришли!
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_09_01");	//Потрясающий корабль у тебя. Ты настоящий генерал.
	AI_Output(other,self,"DIA_Pedro_DI_ArrivedAtShip_15_02");	//Хватит болтать. Рассказывай, что я должен узнать?
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_09_03");	//Да, конечно. С чего мне начать?
	Info_ClearChoices(dia_pedro_di_arrivedatship);
	Info_AddChoice(dia_pedro_di_arrivedatship,"Я услышал достаточно.",dia_pedro_di_arrivedatship_back);
	Info_AddChoice(dia_pedro_di_arrivedatship,"Как мне попасть внутрь этого острова?",dia_pedro_di_arrivedatship_innere);
	Info_AddChoice(dia_pedro_di_arrivedatship,"А какие еще монстры населяют этот остров?",dia_pedro_di_arrivedatship_monster);
	Info_AddChoice(dia_pedro_di_arrivedatship,"Что там насчет этого полковника орков?",dia_pedro_di_arrivedatship_orkoberst);
};

func void dia_pedro_di_arrivedatship_orkoberst()
{
	AI_Output(other,self,"DIA_Pedro_DI_ArrivedAtShip_OrkOberst_15_00");	//Что там насчет этого полковника орков?
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_OrkOberst_09_01");	//Он отнял у меня последний лучик надежды когда-либо увидеть мою родную землю.
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_OrkOberst_09_02");	//С тех пор, как я прибыл сюда, он допрашивал меня о стратегическом размещении паладинов на Хоринисе.
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_OrkOberst_09_03");	//Конечно, я не мог рассказать ему много. Откуда мне знать об этом, черт возьми? Я послушник Огня.
	if(Npc_IsDead(orkelite_antipaladinorkoberst_di))
	{
		Info_AddChoice(dia_pedro_di_arrivedatship,"Полковник орков мертв.",dia_pedro_di_arrivedatship_obersttot);
	};
};

func void dia_pedro_di_arrivedatship_monster()
{
	AI_Output(other,self,"DIA_Pedro_DI_ArrivedAtShip_Monster_15_00");	//А какие еще монстры населяют этот остров?
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_Monster_09_01");	//Днем можно часто увидеть людей-ящеров, идущих к берегу. Обычно они несут с собой очень большие яйца.
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_Monster_09_02");	//Мне было плохо видно из моей камеры, но я думаю, они готовятся покинуть остров.
};

func void dia_pedro_di_arrivedatship_innere()
{
	AI_Output(other,self,"DIA_Pedro_DI_ArrivedAtShip_Innere_15_00");	//Как мне попасть внутрь этого острова?
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_Innere_09_01");	//В тронном зале полковника орков есть секретный проход.
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_Innere_09_02");	//Меня тащили через него каждый раз, когда хотели допросить. Я видел, как он работает.
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_Innere_09_03");	//Один из шаманов запускал механизм, поворачивая факелы, висящие на стенах этого холла.
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_Innere_09_04");	//М-м-м. Мне кажется, он сначала поворачивал левый факел, а затем правый, но я точно не помню.
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_Innere_09_05");	//И тогда внезапно открывался секретный проход, ведущий глубоко в горы.
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_Innere_09_06");	//Где кончается этот проход, я не знаю.
};

func void dia_pedro_di_arrivedatship_obersttot()
{
	AI_Output(other,self,"DIA_Pedro_DI_ArrivedAtShip_OberstTot_15_00");	//Полковник орков мертв.
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_OberstTot_09_01");	//Мертв? Хвала Инносу. Я никогда не забуду его ужасное лицо.
};

func void dia_pedro_di_arrivedatship_back()
{
	AI_Output(other,self,"DIA_Pedro_DI_ArrivedAtShip_Back_15_00");	//Я услышал достаточно. Иди, найди себе место на моем корабле. А мне еще кое-что нужно сделать.
	AI_Output(self,other,"DIA_Pedro_DI_ArrivedAtShip_Back_09_01");	//Да пребудет с тобой сила Инноса. Я буду молиться за тебя.
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Ship");
	self.aivar[AIV_PARTYMEMBER] = FALSE;
};


instance DIA_PEDRO_DI_PERM(C_INFO)
{
	npc = nov_600_pedro_di;
	nr = 5;
	condition = dia_pedro_di_perm_condition;
	information = dia_pedro_di_perm_info;
	permanent = TRUE;
	description = "Устал?";
};


var int pedrodi_talknomore;

func int dia_pedro_di_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_pedro_di_you) && (PEDRODI_TALKNOMORE == FALSE))
	{
		return TRUE;
	};
};

func void dia_pedro_di_perm_info()
{
	AI_Output(other,self,"DIA_Pedro_DI_PERM_15_00");	//Устал?
	if(Npc_GetDistToWP(self,"SHIP_DECK_05") < 1000)
	{
		if(PEDRODI_FLEE == LOG_RUNNING)
		{
			AI_Output(other,self,"DIA_Pedro_DI_PERM_15_01");	//Хочешь, я принесу тебе подушку?
			AI_Output(self,other,"DIA_Pedro_DI_PERM_09_02");	//Пощади меня, пожалуйста. Я буду сидеть здесь очень тихо и не издам ни звука.
			AI_Output(other,self,"DIA_Pedro_DI_PERM_15_03");	//М-м-м.
			b_giveplayerxp(XP_AMBIENT);
			PEDRODI_FLEE = LOG_SUCCESS;
		}
		else if(Npc_IsDead(dragon_undead))
		{
			AI_Output(self,other,"DIA_Pedro_DI_PERM_09_04");	//Я полностью измотан.
			AI_Output(other,self,"DIA_Pedro_DI_PERM_15_05");	//Поспи немного. Скоро мы опять выйдем в море.
			AI_Output(self,other,"DIA_Pedro_DI_PERM_09_06");	//Спасибо. Я уже чуть не падаю. Спокойной ночи.
			AI_StopProcessInfos(self);
			Npc_ExchangeRoutine(self,"SleepShip");
			self.aivar[AIV_PARTYMEMBER] = FALSE;
			PEDRODI_TALKNOMORE = TRUE;
		}
		else
		{
			AI_Output(self,other,"DIA_Pedro_DI_PERM_09_07");	//Все в порядке. Спасибо.
			AI_StopProcessInfos(self);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Pedro_DI_PERM_09_08");	//Пожалуйста, не убивай меня!
		AI_StopProcessInfos(self);
	};
};

