
instance DIA_XARDAS_FIRSTEXIT(C_INFO)
{
	npc = none_100_xardas;
	nr = 999;
	condition = dia_xardas_firstexit_condition;
	information = dia_xardas_firstexit_info;
	permanent = FALSE;
	description = "Я немедленно отправляюсь в путь! (КОНЕЦ)";
};


func int dia_xardas_firstexit_condition()
{
	if(Npc_KnowsInfo(other,dia_xardas_todo) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_xardas_firstexit_info()
{
	AI_Output(other,self,"DIA_Xardas_FirstEXIT_15_00");	//Я немедленно отправляюсь в путь!
	AI_Output(self,other,"DIA_Xardas_FirstEXIT_14_01");	//Хорошо! И еще одно: не говори никому, что разговаривал со мной. И, прежде всего, не говори об этом магам!
	AI_Output(self,other,"DIA_Xardas_FirstEXIT_14_02");	//С тех пор, как я отошел от них, Круг Огня считает меня мертвым - и это очень хорошо.
	AI_StopProcessInfos(self);
	b_kapitelwechsel(1,NEWWORLD_ZEN);
	Npc_ExchangeRoutine(self,"START");
};


instance DIA_XARDAS_EXIT(C_INFO)
{
	npc = none_100_xardas;
	nr = 999;
	condition = dia_xardas_exit_condition;
	information = dia_xardas_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_xardas_exit_condition()
{
	if(Npc_KnowsInfo(other,dia_xardas_firstexit) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_xardas_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_XARDAS_HELLO(C_INFO)
{
	npc = none_100_xardas;
	nr = 1;
	condition = dia_xardas_hello_condition;
	information = dia_xardas_hello_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_xardas_hello_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_xardas_hello_info()
{
	AI_Output(self,other,"DIA_Xardas_Hello_14_00");	//Наконец-то! Я много дней пытался вызвать тебя сюда.
	AI_Output(other,self,"DIA_Xardas_Hello_15_01");	//Я чувствую себя так, как будто я три недели пролежал под грудой камней.
	AI_Output(self,other,"DIA_Xardas_Hello_14_02");	//Да, так и было. Только магия твоих доспехов поддерживала жизнь в тебе - но хватит об этом. Ты скоро восстановишь свои силы.
	AI_Output(other,self,"DIA_Xardas_Hello_15_03");	//По крайней мере, у нас сейчас достаточно времени. Я сделал это. Спящий...
	AI_Output(self,other,"DIA_Xardas_Hello_14_04");	//...был изгнан. Ты победил его, да, это так - но не в наших силах остановить войну, которая разгорается сейчас.
	AI_Output(other,self,"DIA_Xardas_Hello_15_05");	//Ты говоришь об орках?
	AI_Output(self,other,"DIA_Xardas_Hello_14_06");	//Я говорю о гораздо более ужасных созданиях.
	AI_Output(self,other,"DIA_Xardas_Hello_14_07");	//Своим последним, яростным воплем, Спящий привел в движение армии тьмы.
	AI_Output(self,other,"DIA_Xardas_Hello_14_08");	//Это был приказ всем созданиям тьмы. Слово силы, которому все они обязаны повиноваться.
	AI_Output(self,other,"DIA_Xardas_Hello_14_09");	//Его последним приказом было: ИДИТЕ! И они пошли. Все. Даже драконы.
	AI_Output(other,self,"DIA_Xardas_Hello_15_10");	//(изумленно) Драконы!
	AI_Output(self,other,"DIA_Xardas_Hello_14_11");	//Это творения древней силы. Я чувствую их присутствие - даже здесь.
	AI_Output(self,other,"DIA_Xardas_Hello_14_12");	//И они собрали вокруг себя целую армию из низших существ.
	AI_Output(other,self,"DIA_Xardas_Hello_15_13");	//И где эта армия сейчас?
	AI_Output(self,other,"DIA_Xardas_Hello_14_14");	//Лагерь этой армии находится недалеко отсюда, в Долине Рудников около Хориниса, и она готовится к атаке.
	AI_Output(self,other,"DIA_Xardas_Hello_14_15");	//(задумчиво) У нас очень мало времени.
};


instance DIA_XARDAS_AWAY(C_INFO)
{
	npc = none_100_xardas;
	nr = 1;
	condition = dia_xardas_away_condition;
	information = dia_xardas_away_info;
	permanent = FALSE;
	description = "Тогда давай побыстрее уносить отсюда ноги!";
};


func int dia_xardas_away_condition()
{
	if(Npc_KnowsInfo(other,dia_xardas_hello) && !Npc_KnowsInfo(other,dia_xardas_todo) && !Npc_KnowsInfo(other,dia_xardas_firstexit) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_xardas_away_info()
{
	AI_Output(other,self,"DIA_Xardas_AWAY_15_00");	//Тогда давай побыстрее уносить отсюда ноги!
	AI_Output(self,other,"DIA_Xardas_AWAY_14_01");	//Если мы сбежим сейчас, это всего лишь отсрочит нашу встречу с драконами.
	AI_Output(self,other,"DIA_Xardas_AWAY_14_02");	//При помощи солдат и магов, живущих здесь, мы можем остановить их до того, как армия тьмы будет полностью сформирована.
	AI_Output(self,other,"DIA_Xardas_AWAY_14_03");	//У нас не будет лучшего шанса для этого.
};


instance DIA_XARDAS_TODO(C_INFO)
{
	npc = none_100_xardas;
	nr = 2;
	condition = dia_xardas_todo_condition;
	information = dia_xardas_todo_info;
	permanent = FALSE;
	description = "Что мы можем сделать?";
};


func int dia_xardas_todo_condition()
{
	if(Npc_KnowsInfo(other,dia_xardas_hello) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_xardas_todo_info()
{
	AI_Output(other,self,"DIA_Xardas_TODO_15_00");	//Что мы можем сделать?
	AI_Output(self,other,"DIA_Xardas_TODO_14_01");	//На этот раз самим нам не справиться. Только сила Инноса может помочь нам в борьбе против этих драконов.
	AI_Output(self,other,"DIA_Xardas_TODO_14_02");	//В городе Хоринис, что неподалеку отсюда, остановился отряд паладинов.
	AI_Output(self,other,"DIA_Xardas_TODO_14_03");	//Они обладают сильным артефактом, который может помочь нам победить этих драконов.
	AI_Output(self,other,"DIA_Xardas_TODO_14_04");	//"Они называют его ""Глаз Инноса"". Ты должен завладеть этим артефактом."
	AI_Output(self,other,"DIA_Xardas_TODO_14_05");	//Расскажи паладинам о надвигающейся угрозе. Ты ДОЛЖЕН убедить их предводителя поддержать нас!
	Log_CreateTopic(TOPIC_INNOSEYE,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_INNOSEYE,LOG_RUNNING);
	b_logentry(TOPIC_INNOSEYE,"В городе Хоринис расположился отряд паладинов. Они обладают сильным артефактом: Глазом Инноса. Его сила должна помочь нам избавиться от драконов. Я должен убедить паладинов, что нам нужно объединить наши усилия.");
};


instance DIA_XARDAS_WEAPON(C_INFO)
{
	npc = none_100_xardas;
	nr = 5;
	condition = dia_xardas_weapon_condition;
	information = dia_xardas_weapon_info;
	permanent = FALSE;
	description = "Мне нужно оружие.";
};


func int dia_xardas_weapon_condition()
{
	if(Npc_KnowsInfo(other,dia_xardas_hello) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_xardas_weapon_info()
{
	AI_Output(other,self,"DIA_Xardas_WEAPON_15_00");	//Мне нужно оружие.
	AI_Output(self,other,"DIA_Xardas_WEAPON_14_01");	//Я могу дать тебе только то немногое, что у меня есть здесь.
	AI_Output(self,other,"DIA_Xardas_WEAPON_14_02");	//Посмотри в моей башне. Ты можешь взять все, что покажется тебе полезным.
};


instance DIA_XARDAS_ARTEFAKT(C_INFO)
{
	npc = none_100_xardas;
	nr = 2;
	condition = dia_xardas_artefakt_condition;
	information = dia_xardas_artefakt_info;
	permanent = FALSE;
	description = "А что такое этот 'Глаз Инноса'?";
};


func int dia_xardas_artefakt_condition()
{
	if(Npc_KnowsInfo(other,dia_xardas_todo) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_xardas_artefakt_info()
{
	AI_Output(other,self,"DIA_Xardas_ARTEFAKT_15_00");	//А что такое этот 'Глаз Инноса'?
	AI_Output(self,other,"DIA_Xardas_ARTEFAKT_14_01");	//Это амулет. Легенды гласят, что сам Иннос вложил часть своей силы в этот амулет.
	AI_Output(self,other,"DIA_Xardas_ARTEFAKT_14_02");	//Он восстановит часть твоей потерянной силы и поможет нам победить драконов.
	AI_Output(self,other,"DIA_Xardas_ARTEFAKT_14_03");	//Также он обладает и другими скрытыми возможностями. Я расскажу тебе больше, когда этот амулет будет у тебя в руках.
};


instance DIA_XARDAS_PALADIN(C_INFO)
{
	npc = none_100_xardas;
	nr = 3;
	condition = dia_xardas_paladin_condition;
	information = dia_xardas_paladin_info;
	permanent = FALSE;
	description = "А почему паладины должны отдать мне этот Глаз Инноса?";
};


func int dia_xardas_paladin_condition()
{
	if(Npc_KnowsInfo(other,dia_xardas_todo) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_xardas_paladin_info()
{
	AI_Output(other,self,"DIA_Xardas_PALADIN_15_00");	//А почему паладины должны отдать мне этот Глаз Инноса?
	AI_Output(self,other,"DIA_Xardas_PALADIN_14_01");	//Потому что ты тот, кому судьбой предназначено носить его.
	AI_Output(other,self,"DIA_Xardas_PALADIN_15_02");	//А откуда тебе это известно?
	AI_Output(self,other,"DIA_Xardas_PALADIN_14_03");	//Есть несколько причин полагать это. Вот самая важная из них: ты победил Спящего. Если бы тебе не благоволили боги, ты бы давно уже был мертв.
	AI_Output(other,self,"DIA_Xardas_PALADIN_15_04");	//Предположим, что ты прав, и мне действительно предначертано носить Глаз Инноса. А откуда паладины узнают, что это правда?
	AI_Output(self,other,"DIA_Xardas_PALADIN_14_05");	//Глаз сам выбирает того, кто может носить его. Когда ты наденешь его, все сомнения паладинов рассеются.
};


instance DIA_XARDAS_KHORINIS(C_INFO)
{
	npc = none_100_xardas;
	nr = 4;
	condition = dia_xardas_khorinis_condition;
	information = dia_xardas_khorinis_info;
	permanent = FALSE;
	description = "А как мне добраться до города?";
};


func int dia_xardas_khorinis_condition()
{
	if(Npc_KnowsInfo(other,dia_xardas_todo) && (lothar.aivar[AIV_TALKEDTOPLAYER] == FALSE) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_xardas_khorinis_info()
{
	AI_Output(other,self,"DIA_Xardas_Khorinis_15_00");	//А как мне добраться до города?
	AI_Output(self,other,"DIA_Xardas_Khorinis_14_01");	//Просто иди по тропинке, ведущей отсюда через горы. Город большой, ты его не пропустишь.
	AI_Output(self,other,"DIA_Xardas_Khorinis_14_02");	//Но будь осторожен! Путь в город полон опасностей. А ты сейчас далеко не так силен, как был раньше.
};


instance DIA_XARDAS_WHEREEX(C_INFO)
{
	npc = none_100_xardas;
	nr = 6;
	condition = dia_xardas_whereex_condition;
	information = dia_xardas_whereex_info;
	permanent = FALSE;
	description = "А где именно мы сейчас находимся?";
};


func int dia_xardas_whereex_condition()
{
	if(Npc_KnowsInfo(other,dia_xardas_firstexit) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_xardas_whereex_info()
{
	AI_Output(other,self,"DIA_Xardas_Add_15_00");	//А где именно мы сейчас находимся?
	AI_Output(self,other,"DIA_Xardas_Add_14_01");	//Как я уже сказал, неподалеку от города Хоринис.
	AI_Output(self,other,"DIA_Xardas_Add_14_02");	//Я отстроил мою башню здесь.
	AI_Output(other,self,"DIA_Xardas_Add_15_03");	//Но ведь прошло всего несколько дней, с тех пор как мы были в Долине Рудников...
	AI_Output(self,other,"DIA_Xardas_Add_14_04");	//Слуги, которых я вызвал для строительства мой башни, проделали потрясающую работу...
	AI_Output(other,self,"DIA_Xardas_Add_15_05");	//Да, похоже на это.
};


instance DIA_XARDAS_EQUIPMENT(C_INFO)
{
	npc = none_100_xardas;
	nr = 7;
	condition = dia_xardas_equipment_condition;
	information = dia_xardas_equipment_info;
	permanent = FALSE;
	description = "А где я смогу найти снаряжение получше?";
};


func int dia_xardas_equipment_condition()
{
	if(Npc_KnowsInfo(other,dia_xardas_weapon) && Npc_KnowsInfo(other,dia_xardas_firstexit) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_xardas_equipment_info()
{
	AI_Output(other,self,"DIA_Xardas_EQUIPMENT_15_00");	//А где я смогу найти снаряжение получше?
	AI_Output(self,other,"DIA_Xardas_EQUIPMENT_14_01");	//Ближайшее место, где ты сможешь раздобыть приличное оружие и доспехи - город Хоринис.
	AI_Output(self,other,"DIA_Xardas_EQUIPMENT_14_02");	//Но внизу, в долине, ты сможешь найти целебные травы, которые помогут тебе, если ты будешь ранен в бою.
	AI_Output(self,other,"DIA_Xardas_EQUIPMENT_14_03");	//Видишь озеро справа от моей башни? Оттуда в долину ведет секретный проход.
};


instance DIA_XARDAS_ABOUTLESTER(C_INFO)
{
	npc = none_100_xardas;
	nr = 5;
	condition = dia_xardas_aboutlester_condition;
	information = dia_xardas_aboutlester_info;
	permanent = FALSE;
	description = "Ты уже поговорил с Лестером?";
};


func int dia_xardas_aboutlester_condition()
{
	if(Npc_KnowsInfo(other,dia_lester_send_xardas) && (Npc_GetDistToWP(lester,"NW_XARDAS_TOWER_IN1_31") <= 500) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_xardas_aboutlester_info()
{
	AI_Output(other,self,"DIA_Xardas_ABOUTLESTER_15_00");	//Ты уже поговорил с Лестером?
	AI_Output(self,other,"DIA_Xardas_ABOUTLESTER_14_01");	//Да, я просто засыпал его вопросами. Он многое смог рассказать мне, но он полностью вымотан.
	AI_Output(self,other,"DIA_Xardas_ABOUTLESTER_14_02");	//Это почти чудо, что ему удалось выжить. Я отправил его в постель.
	AI_Output(other,self,"DIA_Xardas_ABOUTLESTER_15_03");	//Что он рассказал тебе?
	AI_Output(self,other,"DIA_Xardas_ABOUTLESTER_14_04");	//Боюсь, что ничего хорошего. Он видел не только дракона, но еще и людей в черных плащах с капюшонами.
	AI_Output(other,self,"DIA_Xardas_ABOUTLESTER_15_05");	//И?
	AI_Output(self,other,"DIA_Xardas_ABOUTLESTER_14_06");	//Если эти люди существуют, то их присутствие несет определенную угрозу.
	AI_Output(self,other,"DIA_Xardas_ABOUTLESTER_14_07");	//И мне это не нравится. Вот, возьми мое кольцо. Оно защитит тебя от магии.
	b_giveinvitems(self,other,itri_prot_mage_01,1);
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_XARDAS_FIRSTPAL(C_INFO)
{
	npc = none_100_xardas;
	nr = 10;
	condition = dia_xardas_firstpal_condition;
	information = dia_xardas_firstpal_info;
	permanent = FALSE;
	description = "Я был в городе...";
};


func int dia_xardas_firstpal_condition()
{
	if((lothar.aivar[AIV_TALKEDTOPLAYER] == TRUE) && (lordhagen.aivar[AIV_TALKEDTOPLAYER] == FALSE) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_xardas_firstpal_info()
{
	AI_Output(other,self,"DIA_Xardas_FirstPal_15_00");	//Я был в городе...
	AI_Output(self,other,"DIA_Xardas_FirstPal_14_01");	//И? Ты смог поговорить с предводителем паладинов?
	AI_Output(other,self,"DIA_Xardas_FirstPal_15_02");	//Меня к нему не пропустят...
	AI_Output(self,other,"DIA_Xardas_FirstPal_14_03");	//Чушь! Должен быть способ увидеться с ним.
	AI_Output(self,other,"DIA_Xardas_FirstPal_14_04");	//Если все остальное не получится, вступи в монастырь и стань магом.
	AI_Output(self,other,"DIA_Xardas_FirstPal_14_05");	//Это, возможно, сомнительная затея с точки зрения морали, но это даст тебе то, что тебе нужно.
	AI_Output(self,other,"DIA_Xardas_FirstPal_14_06");	//Если ты будешь магом, ему придется встретиться с тобой.
};


instance DIA_XARDAS_WEITER(C_INFO)
{
	npc = none_100_xardas;
	nr = 99;
	condition = dia_xardas_weiter_condition;
	information = dia_xardas_weiter_info;
	permanent = TRUE;
	description = "И что нам делать дальше?";
};


func int dia_xardas_weiter_condition()
{
	if(Npc_KnowsInfo(other,dia_xardas_firstexit) && (KAPITEL < 3))
	{
		return TRUE;
	};
};

func void dia_xardas_weiter_info()
{
	AI_Output(other,self,"DIA_Xardas_Weiter_15_00");	//И что нам делать дальше?
	AI_Output(self,other,"DIA_Xardas_Weiter_14_01");	//Мы должны действовать согласно нашему плану. Другого пути нет.
	AI_Output(self,other,"DIA_Xardas_Weiter_14_02");	//Ты должен добыть Глаз Инноса, а я буду продолжать искать ответы.
};


instance DIA_XARDAS_KDFSECRET(C_INFO)
{
	npc = none_100_xardas;
	nr = 9;
	condition = dia_xardas_kdfsecret_condition;
	information = dia_xardas_kdfsecret_info;
	permanent = FALSE;
	description = "Почему Круг Огня не должен знать о тебе?";
};


func int dia_xardas_kdfsecret_condition()
{
	if(Npc_KnowsInfo(other,dia_xardas_firstexit))
	{
		return TRUE;
	};
};

func void dia_xardas_kdfsecret_info()
{
	AI_Output(other,self,"DIA_Xardas_KdfSecret_15_00");	//Почему Круг Огня не должен знать о тебе?
	AI_Output(self,other,"DIA_Xardas_KdfSecret_14_01");	//Когда-то я был высшим членом Круга. Даже тогда я подозревал, что демоническая магия может быть ключом к этому магическому барьеру.
	AI_Output(self,other,"DIA_Xardas_KdfSecret_14_02");	//Но мне было ни за что не убедить остальных членов Круга последовать этому пути.
	AI_Output(self,other,"DIA_Xardas_KdfSecret_14_03");	//Поэтому я покинул Круг, чтобы изучать черную магию.
	AI_Output(self,other,"DIA_Xardas_KdfSecret_14_04");	//Это преступление, которому в глазах Магов Огня, (язвительно) 'Посвященных Инноса', всегда таких 'Добрых' и 'Добродетельных', никогда не будет оправдания.
	AI_Output(self,other,"DIA_Xardas_KdfSecret_14_05");	//Они уверены, что я все еще жив, но они понятия не имеют, где искать меня - и это хорошо.
};


instance DIA_XARDAS_KAP3_EXIT(C_INFO)
{
	npc = none_100_xardas;
	nr = 999;
	condition = dia_xardas_kap3_exit_condition;
	information = dia_xardas_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_xardas_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_xardas_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_XARDAS_BACKFROMOW(C_INFO)
{
	npc = none_100_xardas;
	nr = 31;
	condition = dia_xardas_backfromow_condition;
	information = dia_xardas_backfromow_info;
	description = "Я вернулся из Долины Рудников.";
};


func int dia_xardas_backfromow_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_xardas_backfromow_info()
{
	AI_Output(other,self,"DIA_Xardas_BACKFROMOW_15_00");	//Я вернулся из Долины Рудников.
	AI_Output(self,other,"DIA_Xardas_BACKFROMOW_14_01");	//Давно бы пора. И что ты там видел?
	AI_Output(other,self,"DIA_Xardas_BACKFROMOW_15_02");	//Ты был прав. Там все кишит врагами, даже яблоку упасть негде.
	AI_Output(other,self,"DIA_Xardas_BACKFROMOW_15_03");	//Орки осаждают замок, а драконы опустошают все вокруг.
	AI_Output(other,self,"DIA_Xardas_BACKFROMOW_15_04");	//Осталось недолго, прежде чем они нападут на Хоринис, если я не ошибаюсь.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_XARDAS_DMTSINDDA(C_INFO)
{
	npc = none_100_xardas;
	nr = 32;
	condition = dia_xardas_dmtsindda_condition;
	information = dia_xardas_dmtsindda_info;
	description = "Что, черт возьми, произошло здесь?";
};


func int dia_xardas_dmtsindda_condition()
{
	if((KAPITEL == 3) && Npc_KnowsInfo(other,dia_xardas_backfromow))
	{
		return TRUE;
	};
};

func void dia_xardas_dmtsindda_info()
{
	if(Npc_KnowsInfo(other,dia_lester_backintown))
	{
		AI_Output(other,self,"DIA_Xardas_DMTSINDDA_15_00");	//Лестер сказал, что ты хотел видеть меня как можно быстрее.
	};
	AI_Output(other,self,"DIA_Xardas_DMTSINDDA_15_01");	//Что, черт возьми, произошло здесь?
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_14_02");	//Враг узнал, кем ты являешься на самом деле, и планирует завладеть Глазом Инноса.
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_14_03");	//Он распознал эту угрозу. Это заставило его выйти из тени и решиться на открытую атаку.
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_14_04");	//Игра в прятки окончена. Вчера еще никто не знал, какова будет атака врага. Но теперь это становится слишком очевидно.
	b_logentry(TOPIC_INNOSEYE,"Врагу теперь известно, что я ищу Глаз Инноса. Мне нужно побыстрее найти его, пока еще не слишком поздно.");
	Info_ClearChoices(dia_xardas_dmtsindda);
	Info_AddChoice(dia_xardas_dmtsindda,"Меня атаковали маги в черных мантиях.",dia_xardas_dmtsindda_dmt);
	Info_AddChoice(dia_xardas_dmtsindda,"Я, наконец, добыл доказательство, для лорда Хагена.",dia_xardas_dmtsindda_beweis);
};

func void dia_xardas_dmtsindda_dmt()
{
	AI_Output(other,self,"DIA_Xardas_DMTSINDDA_DMT_15_00");	//Меня атаковали маги в черных мантиях.
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_DMT_14_01");	//У врага много обличий. Ищущие - одно из них. Они те, кто подготавливает плацдарм для врага.
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_DMT_14_02");	//Они заняли позиции в стратегических местах, и теперь только ждут возможности захлопнуть ловушку.
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_DMT_14_03");	//Держись от них подальше. Они сильные маги, и они попытаются во что бы то ни стало остановить тебя.
	if(hero.guild == GIL_KDF)
	{
		Log_CreateTopic(TOPIC_DEMENTOREN,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_DEMENTOREN,LOG_RUNNING);
		b_logentry(TOPIC_DEMENTOREN,"Ксардас знает кто такие эти люди в черных рясах. Похоже именно Ищущие заправляют всем в о вражеских рядах, и они очень опасны.");
	};
};

func void dia_xardas_dmtsindda_beweis()
{
	AI_Output(other,self,"DIA_Xardas_DMTSINDDA_Beweis_15_00");	//Я, наконец, добыл доказательство, которое требовал от меня лорд Хаген.
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_Beweis_14_01");	//Что еще за доказательство?
	AI_Output(other,self,"DIA_Xardas_DMTSINDDA_Beweis_15_02");	//Я получил письмо от Гаронда, предводителя паладинов в Долине Рудников. В нем он просит о подкреплении.
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_Beweis_14_03");	//Этого должно быть достаточно, чтобы убедить воинственного ветерана. Отлично.
	Info_AddChoice(dia_xardas_dmtsindda,"И каков будет наш следующий шаг?",dia_xardas_dmtsindda_dmt_whattodo);
	b_giveplayerxp(XP_AMBIENT);
};

func void dia_xardas_dmtsindda_dmt_whattodo()
{
	AI_Output(other,self,"DIA_Xardas_DMTSINDDA_DMT_WhatToDo_15_00");	//И каков будет наш следующий шаг?
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_DMT_WhatToDo_14_01");	//Иди и отнеси Лорду Хагену письмо от Гаронда, и добейся от него, чтобы он позволил тебя взять Глаз Инноса.
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_DMT_WhatToDo_14_02");	//Затем иди в монастырь, и поговори с Пирокаром. Он должен дать тебе Глаз.
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_DMT_WhatToDo_14_03");	//Сейчас нет ничего более важного, чем обеспечить безопасность этого артефакта.
	AI_Output(self,other,"DIA_Xardas_DMTSINDDA_DMT_WhatToDo_14_04");	//Иди, пока еще не слишком поздно. Враг также попытается наложить на него свои лапы.
	b_logentry(TOPIC_INNOSEYE,"Глаз находится в монастыре магов огня. Я надеюсь, что лорд Хаген предоставит мне доступ к нему, когда я принесу ему письмо от лорда Гаронда. Верховный маг Пирокар не позволит мне надеть этот амулет без одобрения Хагена.");
};


instance DIA_XARDAS_INNOSEYEBROKEN(C_INFO)
{
	npc = none_100_xardas;
	nr = 33;
	condition = dia_xardas_innoseyebroken_condition;
	information = dia_xardas_innoseyebroken_info;
	description = "Глаз Инноса был уничтожен.";
};


func int dia_xardas_innoseyebroken_condition()
{
	if((KAPITEL == 3) && Npc_KnowsInfo(other,dia_xardas_dmtsindda) && (Npc_HasItems(other,itmi_innoseye_broken_mis) || (MIS_SCKNOWSINNOSEYEISBROKEN == TRUE)))
	{
		return TRUE;
	};
};

func void dia_xardas_innoseyebroken_info()
{
	AI_Output(other,self,"DIA_Xardas_INNOSEYEBROKEN_15_00");	//Глаз Инноса был уничтожен.
	AI_Output(self,other,"DIA_Xardas_INNOSEYEBROKEN_14_01");	//Что ты говоришь? Уничтожен!
	AI_Output(other,self,"DIA_Xardas_INNOSEYEBROKEN_15_02");	//Я нашел его в северных лесах - к сожалению, мне удалось найти только фрагменты.
	AI_Output(self,other,"DIA_Xardas_INNOSEYEBROKEN_14_03");	//Это был наш единственный шанс противостоять этим драконам. И мы провалили его!
	MIS_SCKNOWSINNOSEYEISBROKEN = TRUE;
	b_giveplayerxp(XP_AMBIENT);
	Info_ClearChoices(dia_xardas_innoseyebroken);
	Info_AddChoice(dia_xardas_innoseyebroken,"И что теперь?",dia_xardas_innoseyebroken_wasnun);
};

func void dia_xardas_innoseyebroken_wasnun()
{
	AI_Output(other,self,"DIA_Xardas_INNOSEYEBROKEN_wasnun_15_00");	//И что теперь?
	AI_Output(self,other,"DIA_Xardas_INNOSEYEBROKEN_wasnun_14_01");	//Это болезненный удар. Мы должны перестроиться. Я должен уединиться, и все взвесить.
	AI_Output(self,other,"DIA_Xardas_INNOSEYEBROKEN_wasnun_14_02");	//А тем временем, ты отправляйся в город и поговори с Ватрасом, Магом Воды. Возможно, он знает, что нужно делать.
	b_logentry(TOPIC_INNOSEYE,"Ксардас остался не очень доволен уничтожением Глаза Инноса. Маг воды Ватрас в городе Хоринис, возможно, наша единственная надежда.");
	MIS_XARDAS_GOTOVATRASINNOSEYE = LOG_RUNNING;
};


instance DIA_XARDAS_RITUALREQUEST(C_INFO)
{
	npc = none_100_xardas;
	nr = 34;
	condition = dia_xardas_ritualrequest_condition;
	information = dia_xardas_ritualrequest_info;
	description = "Ватрас отправил меня к тебе.";
};


func int dia_xardas_ritualrequest_condition()
{
	if((MIS_RITUALINNOSEYEREPAIR == LOG_RUNNING) && Npc_KnowsInfo(other,dia_xardas_innoseyebroken) && (KAPITEL == 3))
	{
		return TRUE;
	};
};

func void dia_xardas_ritualrequest_info()
{
	AI_Output(other,self,"DIA_Xardas_RITUALREQUEST_15_00");	//Ватрас отправил меня к тебе.
	AI_Output(self,other,"DIA_Xardas_RITUALREQUEST_14_01");	//Хорошо. Что он сказал?
	AI_Output(other,self,"DIA_Xardas_RITUALREQUEST_15_02");	//Он сказал, что-то о ритуале обращения в Круге Солнца.
	AI_Output(self,other,"DIA_Xardas_RITUALREQUEST_14_03");	//(смеется) Вот старый дьявол. Думаю, я знаю, что он затеял. Ты пришел, чтобы призвать меня к нему.
	AI_Output(other,self,"DIA_Xardas_RITUALREQUEST_15_04");	//Похоже на то. Когда ты отправляешься?
	if((hero.guild == GIL_KDF) || (hero.guild == GIL_DJG) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Xardas_RITUALREQUEST_14_05");	//Не стоит заставлять Ватраса ждать. Я отправляюсь немедленно. А ты должен выполнить свою задачу, а затем присоединиться ко мне опять.
		AI_StopProcessInfos(self);
		b_logentry(TOPIC_INNOSEYE,"Ксардас согласился участвовать в ритуале в Круге Солнца.");
		b_giveplayerxp(XP_AMBIENT);
		Npc_ExchangeRoutine(self,"RitualInnosEyeRepair");
		XARDAS_GOESTORITUALINNOSEYE = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Xardas_RITUALREQUEST_14_06");	//Я буду помогать в этом ритуале только когда буду уверен, что ты готов к встрече с драконами.
	};
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_XARDAS_WARUMNICHTJETZT(C_INFO)
{
	npc = none_100_xardas;
	nr = 34;
	condition = dia_xardas_warumnichtjetzt_condition;
	information = dia_xardas_warumnichtjetzt_info;
	description = "Почему бы тебе не отправиться на встречу с Ватрасом ПРЯМО СЕЙЧАС?";
};


func int dia_xardas_warumnichtjetzt_condition()
{
	if(Npc_KnowsInfo(other,dia_xardas_ritualrequest) && (XARDAS_GOESTORITUALINNOSEYE == FALSE) && ((hero.guild == GIL_MIL) || (hero.guild == GIL_SLD)))
	{
		return TRUE;
	};
};

func void dia_xardas_warumnichtjetzt_info()
{
	AI_Output(other,self,"DIA_Xardas_WARUMNICHTJETZT_15_00");	//Почему бы тебе не отправиться на встречу с Ватрасом ПРЯМО СЕЙЧАС?
	AI_Output(other,self,"DIA_Xardas_WARUMNICHTJETZT_15_01");	//Иногда я просто не понимаю тебя.
	AI_Output(self,other,"DIA_Xardas_WARUMNICHTJETZT_14_02");	//(раздраженно) Не смей говорить со мной в таком тоне. Если бы не я, твое ни на что не годное тело до сих пор бы гнило в этом храме.
	Info_AddChoice(dia_xardas_warumnichtjetzt,"Не волнуйся! Просто скажи, что мне нужно сделать.",dia_xardas_warumnichtjetzt_wastun);
	Info_AddChoice(dia_xardas_warumnichtjetzt,"Тогда, по крайней мере объясни мне, почему ты колеблешься.",dia_xardas_warumnichtjetzt_grund);
};

func void dia_xardas_warumnichtjetzt_grund()
{
	AI_Output(other,self,"DIA_Xardas_WARUMNICHTJETZT_grund_15_00");	//Тогда, по крайней мере объясни мне, почему ты колеблешься.
	AI_Output(self,other,"DIA_Xardas_WARUMNICHTJETZT_grund_14_01");	//С тех пор, как я отошел от Магов Огня, я старался держаться от них подальше.
	AI_Output(self,other,"DIA_Xardas_WARUMNICHTJETZT_grund_14_02");	//И я не собираюсь изменять этой привычке, если только у меня совсем уж не будет выбора.
	AI_Output(self,other,"DIA_Xardas_WARUMNICHTJETZT_grund_14_03");	//Но прежде, чем я предстану перед укоризненным взором этих магов, я сначала хочу убедиться, что у тебя есть хоть какие-то шансы противостоять драконам.
	AI_Output(self,other,"DIA_Xardas_WARUMNICHTJETZT_grund_14_04");	//С твоим жалким снаряжением, впрочем, тебе далеко не продвинуться. Возвращайся, когда станешь достаточно силен.
	AI_StopProcessInfos(self);
};

func void dia_xardas_warumnichtjetzt_wastun()
{
	AI_Output(other,self,"DIA_Xardas_WARUMNICHTJETZT_wastun_15_00");	//Не волнуйся! Просто скажи, что мне нужно сделать.
	AI_Output(self,other,"DIA_Xardas_WARUMNICHTJETZT_wastun_14_01");	//Ты все еще слишком слаб, чтобы сражаться с драконами. С этим снаряжением у тебя нет никаких шансов.
	AI_Output(self,other,"DIA_Xardas_WARUMNICHTJETZT_wastun_14_02");	//Не возвращайся ко мне, пока не будешь полностью готов. Вот тогда я пойду, и присоединюсь к Ватрасу.
	AI_StopProcessInfos(self);
};


instance DIA_XARDAS_BEREIT(C_INFO)
{
	npc = none_100_xardas;
	condition = dia_xardas_bereit_condition;
	information = dia_xardas_bereit_info;
	description = "Я готов к сражению с драконами.";
};


func int dia_xardas_bereit_condition()
{
	if((XARDAS_GOESTORITUALINNOSEYE == FALSE) && Npc_KnowsInfo(other,dia_xardas_ritualrequest) && ((hero.guild == GIL_DJG) || (hero.guild == GIL_PAL)))
	{
		return TRUE;
	};
};

func void dia_xardas_bereit_info()
{
	AI_Output(other,self,"DIA_Xardas_BEREIT_15_00");	//Я готов к сражению с драконами.
	AI_Output(self,other,"DIA_Xardas_BEREIT_14_01");	//Тогда не будем терять времени. Я немедленно отправляюсь к Кругу Солнца. А ты выполни свои задачи. Я встречу тебя там.
	AI_StopProcessInfos(self);
	b_logentry(TOPIC_INNOSEYE,"Ксардас согласился участвовать в ритуале в Круге Солнца.");
	b_giveplayerxp(XP_AMBIENT);
	Npc_ExchangeRoutine(self,"RitualInnosEyeRepair");
	XARDAS_GOESTORITUALINNOSEYE = TRUE;
};


instance DIA_XARDAS_BINGESPANNT(C_INFO)
{
	npc = none_100_xardas;
	nr = 35;
	condition = dia_xardas_bingespannt_condition;
	information = dia_xardas_bingespannt_info;
	permanent = TRUE;
	description = "Этот ритуал обращения сработает?";
};


func int dia_xardas_bingespannt_condition()
{
	if((MIS_RITUALINNOSEYEREPAIR == LOG_RUNNING) && (KAPITEL == 3) && (XARDAS_GOESTORITUALINNOSEYE == TRUE))
	{
		return TRUE;
	};
};

func void dia_xardas_bingespannt_info()
{
	AI_Output(other,self,"DIA_Xardas_BINGESPANNT_15_00");	//Этот ритуал обращения сработает?
	AI_Output(self,other,"DIA_Xardas_BINGESPANNT_14_01");	//Я не совсем уверен. Это зависит от того, что именно собирается сделать Ватрас.
};


instance DIA_XARDAS_PYROWILLNICHT(C_INFO)
{
	npc = none_100_xardas;
	nr = 37;
	condition = dia_xardas_pyrowillnicht_condition;
	information = dia_xardas_pyrowillnicht_info;
	description = "Пирокар отказывается принять участие в ритуале.";
};


func int dia_xardas_pyrowillnicht_condition()
{
	if((PYROKAR_DENIESINNOSEYERITUAL == TRUE) && Npc_KnowsInfo(other,dia_xardas_ritualrequest) && (KAPITEL == 3))
	{
		return TRUE;
	};
};

func void dia_xardas_pyrowillnicht_info()
{
	AI_Output(other,self,"DIA_Xardas_PYROWILLNICHT_15_00");	//Пирокар отказывается принять участие в ритуале.
	AI_Output(other,self,"DIA_Xardas_PYROWILLNICHT_15_01");	//Сначала он хочет получить доказательства того, что он может доверять тебе.
	AI_Output(self,other,"DIA_Xardas_PYROWILLNICHT_14_02");	//Ах, неужели! Пирокар. Как интересно.
	AI_Output(self,other,"DIA_Xardas_PYROWILLNICHT_14_03");	//Этот старый чудак становится совершенно невыносимым. Но я думаю, у меня есть кое-что, что поможет тебе.
	AI_Output(self,other,"DIA_Xardas_PYROWILLNICHT_14_04");	//Когда я покидал орден Магов Огня, я взял с собой из монастыря несколько вещей.
	AI_Output(self,other,"DIA_Xardas_PYROWILLNICHT_14_06");	//Я не хотел, чтобы паладины или Маги Огня перевернули все в моей башне вверх дном, и нашли эти вещи.
	AI_Output(self,other,"DIA_Xardas_PYROWILLNICHT_14_07");	//Поэтому я спрятал их в надежном месте, где магам никогда не придет в голову искать их.
	AI_Output(other,self,"DIA_Xardas_PYROWILLNICHT_15_08");	//И где же?
	AI_Output(self,other,"DIA_Xardas_PYROWILLNICHT_14_09");	//Некоторые из них лежат в запертом сундуке на ферме Секоба.
	SEKOB_ROOMFREE = TRUE;
	AI_Output(other,self,"DIA_Xardas_PYROWILLNICHT_15_10");	//Ты доверяешь этому Секобу?
	AI_Output(self,other,"DIA_Xardas_PYROWILLNICHT_14_11");	//Нет. Но его можно купить и он не будет задавать глупых вопросов. К тому же, этот сундук заперт. Вот ключ.
	CreateInvItems(self,itke_chest_sekob_xardasbook_mis,1);
	b_giveinvitems(self,other,itke_chest_sekob_xardasbook_mis,1);
	AI_Output(self,other,"DIA_Xardas_PYROWILLNICHT_14_12");	//Там, среди прочего, есть очень старая книга. Когда Пирокар увидит эту книгу, он поймет, что она от меня.
	AI_Output(self,other,"DIA_Xardas_PYROWILLNICHT_14_13");	//Она больше не нужна мне. Поэтому, пусть она послужит хоть такой цели.
	b_logentry(TOPIC_INNOSEYE,"Ксардас дал мне ключ от сундука на ферме Секоба. Я должен отнести книгу, находящуюся в нем, Пирокару.");
};


instance DIA_XARDAS_RITUALINNOSEYEREPAIRIMPORTANT(C_INFO)
{
	npc = none_100_xardas;
	nr = 36;
	condition = dia_xardas_ritualinnoseyerepairimportant_condition;
	information = dia_xardas_ritualinnoseyerepairimportant_info;
	important = TRUE;
};


func int dia_xardas_ritualinnoseyerepairimportant_condition()
{
	if((MIS_RITUALINNOSEYEREPAIR == LOG_SUCCESS) && (KAPITEL == 3))
	{
		return TRUE;
	};
};

func void dia_xardas_ritualinnoseyerepairimportant_info()
{
	AI_Output(self,other,"DIA_Xardas_Add_14_06");	//Теперь, когда Глаз Инноса восстановлен, ты должен предстать перед драконами!
	AI_Output(self,other,"DIA_Xardas_Add_14_07");	//Все они служат Белиару, богу тьмы.
	AI_Output(self,other,"DIA_Xardas_Add_14_08");	//Но должна быть также земная сила, которая контролирует их. Теперь это стало очевидным для меня.
	AI_Output(self,other,"DIA_Xardas_Add_14_09");	//Найди источник этой силы.
	AI_Output(self,other,"DIA_Xardas_Add_14_10");	//А как только ты выяснишь это, сразу же возвращайся ко мне!
	Info_ClearChoices(dia_xardas_ritualinnoseyerepairimportant);
	Info_AddChoice(dia_xardas_ritualinnoseyerepairimportant,DIALOG_ENDE,dia_xardas_ritualinnoseyerepairimportant_weiter);
};

func void dia_xardas_ritualinnoseyerepairimportant_weiter()
{
	AI_StopProcessInfos(self);
	b_startotherroutine(xardas,"Start");
	b_startotherroutine(vatras,"Start");
};


instance DIA_XARDAS_WASNUN(C_INFO)
{
	npc = none_100_xardas;
	nr = 36;
	condition = dia_xardas_wasnun_condition;
	information = dia_xardas_wasnun_info;
	permanent = TRUE;
	description = "Глаз Инноса восстановлен. Что дальше?";
};


func int dia_xardas_wasnun_condition()
{
	if((MIS_RITUALINNOSEYEREPAIR == LOG_SUCCESS) && (KAPITEL == 3))
	{
		return TRUE;
	};
};

func void dia_xardas_wasnun_info()
{
	AI_Output(other,self,"DIA_Xardas_WASNUN_15_00");	//Глаз Инноса восстановлен. Что дальше?
	AI_Output(self,other,"DIA_Xardas_WASNUN_14_01");	//Не забудь надеть его, когда ты, наконец, предстанешь перед драконами.
	if(MIS_READYFORCHAPTER4 == TRUE)
	{
		AI_Output(self,other,"DIA_Xardas_WASNUN_14_02");	//Не теряй времени. Отправляйся в Долину Рудников и убей этих драконов.
	}
	else
	{
		AI_Output(self,other,"DIA_Xardas_WASNUN_14_03");	//Иди к Пирокару, и пусть он объяснит тебе, как пользоваться Глазом.
	};
};


instance DIA_XARDAS_KAP4_EXIT(C_INFO)
{
	npc = none_100_xardas;
	nr = 999;
	condition = dia_xardas_kap4_exit_condition;
	information = dia_xardas_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_xardas_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_xardas_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_XARDAS_PERM4(C_INFO)
{
	npc = none_100_xardas;
	nr = 40;
	condition = dia_xardas_perm4_condition;
	information = dia_xardas_perm4_info;
	permanent = TRUE;
	description = "Что нового?";
};


func int dia_xardas_perm4_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_xardas_perm4_info()
{
	AI_Output(other,self,"DIA_Xardas_PERM4_15_00");	//Что нового?
	AI_Output(self,other,"DIA_Xardas_PERM4_14_01");	//Ищущие еще не ушли. Они не остановятся, пока не прикончат тебя.
	AI_Output(self,other,"DIA_Xardas_PERM4_14_02");	//Убей драконов в Долине Рудников и выясни, кто стоит за этими нападениями. В противном случае, их сила только вырастет еще больше.
};


instance DIA_XARDAS_KAP5_EXIT(C_INFO)
{
	npc = none_100_xardas;
	nr = 999;
	condition = dia_xardas_kap5_exit_condition;
	information = dia_xardas_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_xardas_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_xardas_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_XARDAS_KAP6_EXIT(C_INFO)
{
	npc = none_100_xardas;
	nr = 999;
	condition = dia_xardas_kap6_exit_condition;
	information = dia_xardas_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_xardas_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_xardas_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};

