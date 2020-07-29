
instance DIA_PYROKAR_EXIT(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 999;
	condition = dia_pyrokar_exit_condition;
	information = dia_pyrokar_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_pyrokar_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_pyrokar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PYROKAR_WELCOME(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 2;
	condition = dia_pyrokar_welcome_condition;
	information = dia_pyrokar_welcome_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_pyrokar_welcome_condition()
{
	if(Npc_IsInState(self,zs_talk) && (KNOWS_FIRE_CONTEST == FALSE) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_pyrokar_welcome_info()
{
	AI_Output(self,other,"DIA_Pyrokar_WELCOME_11_00");	//Итак, у нас новый послушник. Я полагаю, ты уже получил задание у мастера Парлана.
	AI_Output(self,other,"DIA_Pyrokar_WELCOME_11_01");	//(слегка укоризненно) Ты же знаешь, что все в Братстве Огня должны выполнять свои обязанности согласно воле Инноса.
};


instance DIA_PYROKAR_HAGEN(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 10;
	condition = dia_pyrokar_hagen_condition;
	information = dia_pyrokar_hagen_info;
	permanent = FALSE;
	description = "Я должен поговорить с паладинами. Это срочно.";
};


func int dia_pyrokar_hagen_condition()
{
	if(other.guild == GIL_NOV)
	{
		return TRUE;
	};
};

func void dia_pyrokar_hagen_info()
{
	AI_Output(other,self,"DIA_Pyrokar_Hagen_15_00");	//Я должен поговорить с паладинами. Это срочно.
	AI_Output(self,other,"DIA_Pyrokar_Hagen_11_01");	//Ты кажешь нам, о чем ты собираешься говорить с ними?
	AI_Output(other,self,"DIA_Pyrokar_Hagen_15_02");	//У меня для них важное сообщение.
	AI_Output(self,other,"DIA_Pyrokar_Hagen_11_03");	//Что это за сообщение?
	AI_Output(other,self,"DIA_Pyrokar_Hagen_15_04");	//Армия зла собирается в Долине Рудников. Ее возглавляют драконы! Мы должны остановить их, пока это еще возможно.
	AI_Output(self,other,"DIA_Pyrokar_Hagen_11_05");	//Хм. Мы должны обдумать твои слова, послушник. Когда придет время, мы дадим тебе знать, что по этому поводу решил Совет.
	AI_Output(self,other,"DIA_Pyrokar_Hagen_11_06");	//А пока, тебе лучше уделить самое пристальное внимание своим обязанностям послушника.
	if(Npc_KnowsInfo(other,dia_pyrokar_auge))
	{
		AI_Output(self,other,"DIA_Pyrokar_ALL_11_07");	//Мы больше не будем отрывать тебя от работы - ты можешь идти.
		AI_StopProcessInfos(self);
	};
};


instance DIA_PYROKAR_AUGE(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 10;
	condition = dia_pyrokar_auge_condition;
	information = dia_pyrokar_auge_info;
	permanent = FALSE;
	description = "Я ищу Глаз Инноса.";
};


func int dia_pyrokar_auge_condition()
{
	if((KNOWS_FIRE_CONTEST == FALSE) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_pyrokar_auge_info()
{
	AI_Output(other,self,"DIA_Pyrokar_Auge_15_00");	//Я ищу Глаз Инноса.
	AI_Output(self,other,"DIA_Pyrokar_Auge_11_01");	//Любой, кто полагает, что он может не только найти этот священный амулет, но также и носить его - идиот.
	AI_Output(self,other,"DIA_Pyrokar_Auge_11_02");	//Этот амулет сам выбирает своего хозяина - только тот, кто судьбой предназначен для этого, способен носить его.
	AI_Output(other,self,"DIA_Pyrokar_Auge_15_03");	//Я все же хотел бы попробовать.
	AI_Output(self,other,"DIA_Pyrokar_Auge_11_04");	//Обязанность послушника проявлять смирение - не желания.
	b_logentry(TOPIC_INNOSEYE,"Я не думал, что это будет так непросто, но Пирокар не отдаст Глаз добровольно, здесь не обойтись без помощи паладинов.");
	if(Npc_KnowsInfo(other,dia_pyrokar_hagen))
	{
		AI_Output(self,other,"DIA_Pyrokar_ALL_11_05");	//Что ж, мы больше не будем отрывать тебя от работы - ты можешь идти.
		AI_StopProcessInfos(self);
	};
};


instance DIA_PYROKAR_GOAWAY(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 10;
	condition = dia_pyrokar_goaway_condition;
	information = dia_pyrokar_goaway_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_pyrokar_goaway_condition()
{
	if(Npc_IsInState(self,zs_talk) && Npc_KnowsInfo(hero,dia_pyrokar_hagen) && Npc_KnowsInfo(hero,dia_pyrokar_auge) && (KNOWS_FIRE_CONTEST == FALSE) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_pyrokar_goaway_info()
{
	AI_Output(self,other,"DIA_Pyrokar_GOAWAY_11_00");	//(раздраженно) Смирение - благодетель, которой тебе еще предстоит научиться. Так или иначе.
	AI_StopProcessInfos(self);
};


instance DIA_PYROKAR_FIRE(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 1;
	condition = dia_pyrokar_fire_condition;
	information = dia_pyrokar_fire_info;
	permanent = FALSE;
	description = "Я хочу пройти Испытание Огнем.";
};


func int dia_pyrokar_fire_condition()
{
	if((KNOWS_FIRE_CONTEST == TRUE) && (other.guild == GIL_NOV) && Npc_KnowsInfo(other,dia_pyrokar_hagen))
	{
		return TRUE;
	};
};

func void dia_pyrokar_fire_info()
{
	AI_Output(other,self,"DIA_Pyrokar_FIRE_15_00");	//Я хочу пройти Испытание Огнем.
	AI_Output(self,other,"DIA_Pyrokar_FIRE_11_01");	//(удивленно) Так ты знаешь о... ты хочешь пройти Испытание Огнем?
	AI_Output(other,self,"DIA_Pyrokar_FIRE_15_02");	//Да, я ссылаюсь на Закон Огня, который гласит...
	AI_Output(self,other,"DIA_Pyrokar_FIRE_11_03");	//(резко прерывает) Мы знаем Закон Огня. Мы также видели, как множество послушников погибли при прохождении этого испытания. Ты должен пересмотреть свое решение.
	AI_Output(other,self,"DIA_Pyrokar_FIRE_15_04");	//Я хочу пройти это испытание - и я пройду его.
	AI_Output(self,other,"DIA_Pyrokar_FIRE_11_05");	//(предупреждающе) Если ты категорически настаиваешь, Высший Совет подвергнет тебя этому испытанию.
	AI_Output(other,self,"DIA_Pyrokar_FIRE_15_06");	//Я настаиваю на прохождении Испытания Огнем.
	AI_Output(self,other,"DIA_Pyrokar_FIRE_11_07");	//В таком случае - так тому и быть. Когда ты будешь готов, каждый из магов Высшего Совета даст тебе задание, которое ты должен будешь выполнить.
	AI_Output(self,other,"DIA_Pyrokar_FIRE_11_08");	//Да сжалится Иннос над твоей душой.
	b_logentry(TOPIC_FIRECONTEST,"Я потребовал у Пирокара пройти испытание огнем. Теперь я должен выполнить три задания Высшего совета.");
};


instance DIA_PYROKAR_TEST(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 10;
	condition = dia_pyrokar_test_condition;
	information = dia_pyrokar_test_info;
	permanent = FALSE;
	description = "Я готов пройти твое испытание, мастер.";
};


func int dia_pyrokar_test_condition()
{
	if(Npc_KnowsInfo(hero,dia_pyrokar_fire) && (MIS_SCHNITZELJAGD == FALSE) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_pyrokar_test_info()
{
	AI_Output(other,self,"DIA_Pyrokar_TEST_15_00");	//Я готов пройти испытание, Мастер.
	AI_Output(self,other,"DIA_Pyrokar_TEST_11_01");	//И только одному Инносу ведомо, пройдешь ли ты его. Ты будешь подвергнут тому же испытанию, что и избранные послушники.
	AI_Output(self,other,"DIA_Pyrokar_TEST_11_02");	//Испытанию Магией. (надменно) Ты, вероятно, знаешь, что только ОДИН из послушников сможет пройти это испытание.
	AI_Output(other,self,"DIA_Pyrokar_TEST_15_03");	//Понимаю. А кто мои соперники?
	AI_Output(self,other,"DIA_Pyrokar_TEST_11_04");	//Иннос в своей мудрости выбрал троих послушников, которые должны подвергнуться этому испытанию: Агон, Игарац и Ульф. Они уже приступили к поискам.
	AI_Output(self,other,"DIA_Pyrokar_TEST_11_05");	//(лаконично) Но хватит об этом! Услышь слова этого испытания: 'Следуй знакам Инноса и принеси то, что верующий находит в конце пути'.
	AI_Output(self,other,"DIA_Pyrokar_TEST_11_06");	//Тебе понадобится этот ключ.
	AI_Output(self,other,"DIA_Pyrokar_TEST_11_07");	//Это все, что мы можем сказать тебе.
	Log_CreateTopic(TOPIC_SCHNITZELJAGD,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_SCHNITZELJAGD,LOG_RUNNING);
	b_logentry(TOPIC_SCHNITZELJAGD,"Пирокар дает мне Испытание Магией. Это то же самое испытание, что должны пройти избранные послушники Ульф, Игарац и Агон.");
	b_logentry(TOPIC_SCHNITZELJAGD,"Я должен следовать знакам Инноса и 'принести то, что верующий находит в конце пути'. Также он дал мне ключ.");
	CreateInvItems(self,itke_magicchest,1);
	b_giveinvitems(self,other,itke_magicchest,1);
	b_startotherroutine(igaraz,"CONTEST");
	AI_Teleport(igaraz,"NW_TAVERNE_BIGFARM_05");
	CreateInvItems(igaraz,itke_magicchest,1);
	igaraz.aivar[AIV_DROPDEADANDKILL] = TRUE;
	igaraz.aivar[AIV_NEWSOVERRIDE] = TRUE;
	b_startotherroutine(nov607,"EXCHANGE");
	b_startotherroutine(agon,"GOLEMDEAD");
	AI_Teleport(agon,"NW_MAGECAVE_RUNE");
	CreateInvItems(agon,itke_magicchest,1);
	agon.aivar[AIV_DROPDEADANDKILL] = TRUE;
	agon.aivar[AIV_NEWSOVERRIDE] = TRUE;
	b_startotherroutine(ulf,"SUCHE");
	AI_Teleport(ulf,"NW_TROLLAREA_PATH_42");
	CreateInvItems(ulf,itke_magicchest,1);
	ulf.aivar[AIV_DROPDEADANDKILL] = TRUE;
	ulf.aivar[AIV_NEWSOVERRIDE] = TRUE;
	MIS_SCHNITZELJAGD = LOG_RUNNING;
	AI_StopProcessInfos(self);
};


instance DIA_PYROKAR_RUNNING(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 20;
	condition = dia_pyrokar_running_condition;
	information = dia_pyrokar_running_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_pyrokar_running_condition()
{
//	if((MIS_SCHNITZELJAGD == LOG_RUNNING) && Npc_IsInState(self,zs_talk) && (other.guild == GIL_NOV) && Mob_HasItems("MAGICCHEST",itmi_runeblank))
	if((MIS_SCHNITZELJAGD == LOG_RUNNING) && Npc_IsInState(self,zs_talk) && (other.guild == GIL_NOV))
	{
		if(!Npc_HasItems(other,itmi_runeblank) && !Npc_HasItems(other,itru_firebolt))
		{
			return TRUE;
		};
	};
};

func void dia_pyrokar_running_info()
{
	var int randomizer;
	randomizer = Hlp_Random(3);
	if(randomizer == 0)
	{
		AI_Output(self,other,"DIA_Pyrokar_RUNNING_11_00");	//Пока ты не пройдешь это испытание, нам нечего сказать тебе.
	}
	else if(randomizer == 1)
	{
		AI_Output(self,other,"DIA_Pyrokar_RUNNING_11_01");	//Чего ты ждешь? Иди, проходи испытание!
	}
	else if(randomizer == 2)
	{
		AI_Output(self,other,"DIA_Pyrokar_RUNNING_11_02");	//Пришло время подтвердить твои громкие слова делами. Тебе так не кажется, послушник?
	};
	AI_StopProcessInfos(self);
};


instance DIA_PYROKAR_SUCCESS(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 2;
	condition = dia_pyrokar_success_condition;
	information = dia_pyrokar_success_info;
	permanent = FALSE;
	description = "Я нашел рунный камень.";
};


func int dia_pyrokar_success_condition()
{
//	if((MIS_SCHNITZELJAGD == LOG_RUNNING) && (hero.guild == GIL_NOV) && !Mob_HasItems("MAGICCHEST",itmi_runeblank) && ((Npc_HasItems(other,itmi_runeblank) >= 1) || (Npc_HasItems(other,itru_firebolt) >= 1)))
	if((MIS_SCHNITZELJAGD == LOG_RUNNING) && (hero.guild == GIL_NOV))
	{
		if(Npc_HasItems(other,itmi_runeblank) || Npc_HasItems(other,itru_firebolt))
		{
			return TRUE;
		};
	};
};

func void dia_pyrokar_success_info()
{
	AI_Output(other,self,"DIA_Pyrokar_SUCCESS_15_00");	//Я нашел рунный камень.
	AI_Output(self,other,"DIA_Pyrokar_SUCCESS_11_01");	//(недоверчиво) Ты... сделал это?! Ты следовал знакам и нашел скрытый портал...
	AI_Output(other,self,"DIA_Pyrokar_SUCCESS_15_02");	//... и одной левой победил всех тех монстров, что уже считали меня своей добычей.
	AI_Output(self,other,"DIA_Pyrokar_SUCCESS_11_03");	//А другие послушники? Что насчет Агона? Они не опередили тебя?
	AI_Output(other,self,"DIA_Pyrokar_SUCCESS_15_04");	//Они не смогли. Я думаю, им было не суждено пройти это испытание.
	AI_Output(self,other,"DIA_Pyrokar_SUCCESS_11_05");	//Что ж, в таком случае, мы объявляем, что ты прошел это испытание. А этот рунный камень теперь твой.
	MIS_SCHNITZELJAGD = LOG_SUCCESS;
	b_giveplayerxp(XP_SCHNITZELJAGD);
};


instance DIA_PYROKAR_TODO(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 2;
	condition = dia_pyrokar_todo_condition;
	information = dia_pyrokar_todo_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_pyrokar_todo_condition()
{
	if((MIS_SCHNITZELJAGD == LOG_SUCCESS) && Npc_IsInState(self,zs_talk) && (other.guild == GIL_NOV) && ((MIS_RUNE != LOG_SUCCESS) || (MIS_GOLEM != LOG_SUCCESS)))
	{
		return TRUE;
	};
};

func void dia_pyrokar_todo_info()
{
	AI_Output(self,other,"DIA_Pyrokar_Todo_11_00");	//Ты прошел испытание, которому подверг тебя я.
	AI_Output(self,other,"DIA_Pyrokar_Todo_11_01");	//Но...
	if(MIS_RUNE != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Pyrokar_Todo_11_02");	//... тебе еще необходимо пройти испытание Ультара.
	};
	if(MIS_GOLEM != LOG_SUCCESS)
	{
		AI_Output(self,other,"DIA_Pyrokar_Todo_11_03");	//... тебе еще необходимо выполнить задание Серпентеса.
	};
	AI_StopProcessInfos(self);
};


instance DIA_PYROKAR_MAGICAN(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 3;
	condition = dia_pyrokar_magican_condition;
	information = dia_pyrokar_magican_info;
	permanent = FALSE;
	description = "Теперь я буду принят в Гильдию Магов?";
};


func int dia_pyrokar_magican_condition()
{
	if((MIS_SCHNITZELJAGD == LOG_SUCCESS) && (MIS_RUNE == LOG_SUCCESS) && (MIS_GOLEM == LOG_SUCCESS) && (other.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_pyrokar_magican_info()
{
	AI_Output(other,self,"DIA_Pyrokar_MAGICAN_15_00");	//Теперь я буду принят в Гильдию Магов?
	AI_Output(self,other,"DIA_Pyrokar_MAGICAN_11_01");	//Ты сделал это. Ты прошел Испытание Огнем. Мы с самого начала были уверены, что ты преуспеешь в этом.
	AI_Output(self,other,"DIA_Pyrokar_MAGICAN_11_02");	//(настойчиво) Мы также уверены, что ты продолжишь прилагать все усилия, чтобы стать ДОСТОЙНЫМ слугой Инноса.
	AI_Output(self,other,"DIA_Pyrokar_MAGICAN_11_03");	//Итак, если ты готов принять Клятву Огня, ты будешь принят в наши ряды.
};


instance DIA_PYROKAR_OATH(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 1;
	condition = dia_pyrokar_oath_condition;
	information = dia_pyrokar_oath_info;
	permanent = FALSE;
	description = "Я готов вступить в Круг Огня.";
};


func int dia_pyrokar_oath_condition()
{
	if(Npc_KnowsInfo(hero,dia_pyrokar_magican) && (hero.guild == GIL_NOV))
	{
		return TRUE;
	};
};

func void dia_pyrokar_oath_info()
{
	AI_Output(other,self,"DIA_Pyrokar_OATH_15_00");	//Я готов вступить в Круг Огня.
	AI_Output(self,other,"DIA_Pyrokar_OATH_11_01");	//Хорошо, тогда принеси Клятву Огня.
	AI_Output(self,other,"DIA_Pyrokar_OATH_11_02");	//(торжественно) Клянешься ли ты, перед лицом Инноса Всемогущего, его слуг и Священного Огня...
	AI_Output(self,other,"DIA_Pyrokar_OATH_11_03");	//... что с этого момента и до конца дней вся жизнь твоя будет едина с огнем...
	AI_Output(self,other,"DIA_Pyrokar_OATH_11_04");	//... до тех пор пока твое тело и душа не найдут покой в этих священных чертогах и пламя твоей жизни не угаснет?
	AI_Output(other,self,"DIA_Pyrokar_OATH_15_05");	//Клянусь.
	AI_Output(self,other,"DIA_Pyrokar_OATH_11_06");	//Произнеся слова этой клятвы, ты присоединился к Соглашению Огня.
	AI_Output(self,other,"DIA_Pyrokar_OATH_11_07");	//Носи эту робу в знак этих вечных уз.
	CreateInvItems(hero,itar_kdf_l,1);
	AI_EquipArmor(hero,itar_kdf_l);
	other.guild = GIL_KDF;
	Npc_SetTrueGuild(other,GIL_KDF);
	FIRE_CONTEST = TRUE;
	Snd_Play("LEVELUP");
	KDF_AUFNAHME = LOG_SUCCESS;
	SLD_AUFNAHME = LOG_OBSOLETE;
	MIL_AUFNAHME = LOG_OBSOLETE;
	b_giveplayerxp(XP_BECOMEMAGE);
	AI_Output(self,other,"DIA_Pyrokar_OATH_11_08");	//Теперь, когда ты был принят в наши ряды, ты можешь поговорить с лордом Хагеном, главнокомандующим паладинов.
	AI_Output(self,other,"DIA_Pyrokar_OATH_11_09");	//Нам также очень интересно знать, как он оценивает ситуацию. Так что ты теперь можешь отправляться в Хоринис.
	AI_Output(self,other,"DIA_Pyrokar_OATH_11_10");	//Мы ожидаем, что ты принесешь его ответ немедленно.
};


instance DIA_PYROKAR_LERNEN(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 2;
	condition = dia_pyrokar_lernen_condition;
	information = dia_pyrokar_lernen_info;
	permanent = FALSE;
	description = "Что я могу изучить теперь?";
};


func int dia_pyrokar_lernen_condition()
{
	if(other.guild == GIL_KDF)
	{
		return TRUE;
	};
};

func void dia_pyrokar_lernen_info()
{
	AI_Output(other,self,"DIA_Pyrokar_Lernen_15_00");	//Что я могу изучить теперь?
	AI_Output(self,other,"DIA_Pyrokar_Lernen_11_01");	//Прежде всего, теперь ты имеешь право изучать Круги Магии. Они дадут тебе власть над рунами.
	AI_Output(self,other,"DIA_Pyrokar_Lernen_11_02");	//Чем выше ты будешь подниматься в шести Кругах Магии, тем более сильными заклинаниями ты сможешь овладеть.
	AI_Output(self,other,"DIA_Pyrokar_Lernen_11_03");	//Ты сможешь узнать формулы заклинаний у наших братьев в монастыре. Каждый из них специализируется в определенной области.
	AI_Output(self,other,"DIA_Pyrokar_Lernen_11_04");	//Каррас, например, мастер вызова, а Хиглас обучит тебя магии огня.
	AI_Output(self,other,"DIA_Pyrokar_Lernen_11_05");	//Никто не знает больше о силах льда, чем Мардук. Парлан может обучить тебя другим различным заклинаниям - и он введет тебя в первые круги.
	AI_Output(self,other,"DIA_Pyrokar_Lernen_11_06");	//Но каждый из них будет учить тебя только формулам - руны ты должен будешь создавать сам.
	Log_CreateTopic(TOPIC_KLOSTERTEACHER,LOG_NOTE);
	b_logentry(TOPIC_KLOSTERTEACHER,"Мастер Парлан посвятит меня в первые круги магии.");
	b_logentry(TOPIC_KLOSTERTEACHER,"Брат Каррас обучает формулам вызова.");
	b_logentry(TOPIC_KLOSTERTEACHER,"Брат Хиглас может посвятить меня в тайны огня.");
	b_logentry(TOPIC_KLOSTERTEACHER,"Брат Мардук может посвятить меня в тайны льда и грома.");
	b_logentry(TOPIC_KLOSTERTEACHER,"Брат Парлан обучает множеству различных формул.");
};


instance DIA_PYROKAR_WUNSCH(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 2;
	condition = dia_pyrokar_wunsch_condition;
	information = dia_pyrokar_wunsch_info;
	permanent = FALSE;
	description = "Я хотел бы высказать пожелание...";
};


func int dia_pyrokar_wunsch_condition()
{
	if((other.guild == GIL_KDF) && (KAPITEL < 2))
	{
		return TRUE;
	};
};

func void dia_pyrokar_wunsch_info()
{
	AI_Output(other,self,"DIA_Pyrokar_Wunsch_15_00");	//Я хотел бы высказать пожелание...
	AI_Output(self,other,"DIA_Pyrokar_Wunsch_11_01");	//После принятия в наши ряды, каждый маг обладает правом на первый шаг.
	AI_Output(self,other,"DIA_Pyrokar_Wunsch_11_02");	//Итак, каким же будет твой первый шаг в качестве мага?
	Info_ClearChoices(dia_pyrokar_wunsch);
	Info_AddChoice(dia_pyrokar_wunsch,"Никаким.",dia_pyrokar_wunsch_nothing);
	if(MIS_HELPBABO == LOG_RUNNING)
	{
		Info_AddChoice(dia_pyrokar_wunsch,"Позволь послушнику Бабо возглавить монастырский сад.",dia_pyrokar_wunsch_babo);
	};
	if(MIS_HELPOPOLOS == LOG_RUNNING)
	{
		Info_AddChoice(dia_pyrokar_wunsch,"Позволь послушнику Ополосу получить доступ в библиотеку.",dia_pyrokar_wunsch_opolos);
	};
	if(MIS_HELPDYRIAN == LOG_RUNNING)
	{
		Info_AddChoice(dia_pyrokar_wunsch,"Позволь послушнику Дуриану остаться в монастыре.",dia_pyrokar_wunsch_dyrian);
	};
};

func void dia_pyrokar_wunsch_nothing()
{
	AI_Teleport(dyrian,"TAVERNE");
	AI_Output(other,self,"DIA_Pyrokar_Wunsch_Nothing_15_00");	//Никаким.
	AI_Output(self,other,"DIA_Pyrokar_Wunsch_Nothing_11_01");	//(изумленно) Да будет так. Новый маг отказывается от первого шага.
	b_startotherroutine(dyrian,"NOFAVOUR");
	if(MIS_HELPDYRIAN == LOG_RUNNING)
	{
		MIS_HELPDYRIAN = LOG_FAILED;
	};
	if(MIS_HELPOPOLOS == LOG_RUNNING)
	{
		MIS_HELPOPOLOS = LOG_FAILED;
	};
	if(MIS_HELPBABO == LOG_RUNNING)
	{
		MIS_HELPBABO = LOG_FAILED;
	};
	Info_ClearChoices(dia_pyrokar_wunsch);
};

func void dia_pyrokar_wunsch_dyrian()
{
	AI_Output(other,self,"DIA_Pyrokar_Wunsch_Dyrian_15_00");	//Позволь послушнику Дуриану остаться в монастыре.
	AI_Output(self,other,"DIA_Pyrokar_Wunsch_Dyrian_11_01");	//Да будет так.
	AI_Output(self,other,"DIA_Pyrokar_Wunsch_Dyrian_11_02");	//Этому послушнику будет позволено остаться в монастыре, и он займет место садовника, которое сейчас вакантно.
	b_giveplayerxp(XP_HELPDYRIAN);
	b_startotherroutine(dyrian,"FAVOUR");
	MIS_HELPDYRIAN = LOG_SUCCESS;
	if(MIS_HELPOPOLOS == LOG_RUNNING)
	{
		MIS_HELPOPOLOS = LOG_FAILED;
	};
	if(MIS_HELPBABO == LOG_RUNNING)
	{
		MIS_HELPBABO = LOG_FAILED;
	};
	Info_ClearChoices(dia_pyrokar_wunsch);
};

func void dia_pyrokar_wunsch_babo()
{
	AI_Teleport(dyrian,"TAVERNE");
	AI_Output(other,self,"DIA_Pyrokar_Wunsch_Babo_15_00");	//Позволь послушнику Бабо возглавить монастырский сад.
	AI_Output(self,other,"DIA_Pyrokar_Wunsch_Babo_11_01");	//Да будет так.
	AI_Output(self,other,"DIA_Pyrokar_Wunsch_Babo_11_02");	//С сего момента, послушник Бабо будет отвечать за монастырский сад.
	b_giveplayerxp(XP_HELPBABO);
	b_startotherroutine(babo,"FAVOUR");
	b_startotherroutine(dyrian,"NOFAVOUR");
	MIS_HELPBABO = LOG_SUCCESS;
	if(MIS_HELPDYRIAN == LOG_RUNNING)
	{
		MIS_HELPDYRIAN = LOG_FAILED;
	};
	if(MIS_HELPOPOLOS == LOG_RUNNING)
	{
		MIS_HELPOPOLOS = LOG_FAILED;
	};
	Info_ClearChoices(dia_pyrokar_wunsch);
};

func void dia_pyrokar_wunsch_opolos()
{
	AI_Teleport(dyrian,"TAVERNE");
	AI_Output(other,self,"DIA_Pyrokar_Wunsch_Opolos_15_00");	//Позволь послушнику Ополосу получить доступ в библиотеку.
	AI_Output(self,other,"DIA_Pyrokar_Wunsch_Opolos_11_01");	//Да будет так.
	AI_Output(self,other,"DIA_Pyrokar_Wunsch_Opolos_11_02");	//С сего момента послушнику Ополосу будет позволено изучать писания Инноса.
	b_giveplayerxp(XP_HELPOPOLOS);
	b_startotherroutine(opolos,"FAVOUR");
	b_startotherroutine(dyrian,"NOFAVOUR");
	MIS_HELPOPOLOS = LOG_SUCCESS;
	if(MIS_HELPDYRIAN == LOG_RUNNING)
	{
		MIS_HELPDYRIAN = LOG_FAILED;
	};
	if(MIS_HELPBABO == LOG_RUNNING)
	{
		MIS_HELPBABO = LOG_FAILED;
	};
	Info_ClearChoices(dia_pyrokar_wunsch);
};


instance DIA_PYROKAR_NACHRICHT(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 2;
	condition = dia_pyrokar_nachricht_condition;
	information = dia_pyrokar_nachricht_info;
	permanent = FALSE;
	description = "Я принес новости от лорда Хагена.";
};


func int dia_pyrokar_nachricht_condition()
{
	if((MIS_OLDWORLD == LOG_RUNNING) && (other.guild == GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_pyrokar_nachricht_info()
{
	AI_Output(other,self,"DIA_Pyrokar_Nachricht_15_00");	//Я принес новости от лорда Хагена. Он хочет получить доказательства присутствия драконов и армии Зла.
	if(ENTEROW_KAPITEL2 == FALSE)
	{
		AI_Teleport(sergio,"NW_MONASTERY_PLACE_09");
		AI_Output(other,self,"DIA_Pyrokar_Nachricht_15_01");	//Поэтому я должен отправиться в Долину Рудников и доставить ему эти доказательства.
		AI_Output(self,other,"DIA_Pyrokar_Nachricht_11_02");	//Хорошо. Ты выполнишь этот приказ. Паладин Сержио сопроводит тебя к Проходу.
		AI_Output(self,other,"DIA_Pyrokar_Nachricht_11_03");	//Да хранит тебя Иннос.
		SERGIO_FOLLOW = TRUE;
		AI_StopProcessInfos(self);
		b_startotherroutine(sergio,"WAITFORPLAYER");
	}
	else
	{
		AI_Output(other,self,"DIA_Pyrokar_Nachricht_15_04");	//Я отправляюсь в Долину Рудников.
		AI_Output(self,other,"DIA_Pyrokar_Nachricht_11_05");	//Хорошо. Так как ты уже знаешь путь в долину, тебе не нужен эскорт.
		AI_Output(self,other,"DIA_Pyrokar_Nachricht_11_06");	//Выполни это задание лорда Хагена - да хранит тебя Иннос.
	};
};


instance DIA_PYROKAR_TEACH(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 4;
	condition = dia_pyrokar_teach_condition;
	information = dia_pyrokar_teach_info;
	permanent = TRUE;
	description = "Обучи меня последнему Кругу Магии.";
};


func int dia_pyrokar_teach_condition()
{
	if((Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) == 5) && (KAPITEL >= 5))
	{
		return TRUE;
	};
};

func void dia_pyrokar_teach_info()
{
	AI_Output(other,self,"DIA_Pyrokar_TEACH_15_00");	//Обучи меня последнему Кругу Магии.
	if(MIS_SCKNOWSWAYTOIRDORATH == TRUE)
	{
		if(b_teachmagiccircle(self,other,6))
		{
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_01");	//Много времени прошло с тех пор, как ты связал себя с огнем. Многое произошло с тех пор, но покоя все нет.
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_02");	//Ты Избранный Инноса. И тебе понадобятся все твои силы, чтобы победить в этой битве.
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_03");	//Я посвящаю тебя, о, Избранный. Ты входишь в шестой Круг - да принесешь ты с собой свет и рассеешь тьму.
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_04");	//Теперь ты можешь узнать формулы этого последнего круга от меня, если ты того желаешь.
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_05");	//Ох - и еще одно. Мне понадобилось некоторое время, чтобы признать тебя.
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_06");	//Ты получил это письмо от меня, когда они швырнули тебя за Барьер.
			AI_Output(other,self,"DIA_Pyrokar_TEACH_15_07");	//Да, ты таким образом избавил меня от пустой болтовни судьи.
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_08");	//И ты Избранный Инноса.
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_09");	//Получи же теперь мое благословение, о Избранный!
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_10");	//Иннос, свет солнца и огонь дерева, благослови этого человека, твоего избранного слугу.
			AI_Output(self,other,"DIA_Pyrokar_TEACH_11_11");	//Дай ему мужество, силу и мудрость следовать по пути, который ты предначертал ему.
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Pyrokar_TEACH_11_12");	//Время для этого еще не пришло. Когда ты пройдешь чуть дальше по пути, который Иннос покажет тебе, я обучу тебя.
	};
};


instance DIA_PYROKAR_SPELLS(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 2;
	condition = dia_pyrokar_spells_condition;
	information = dia_pyrokar_spells_info;
	permanent = TRUE;
	description = "Обучи меня (созданию рун)";
};


func int dia_pyrokar_spells_condition()
{
	if(Npc_GetTalentSkill(hero,NPC_TALENT_MAGE) >= 6)
	{
		return TRUE;
	};
};

func void dia_pyrokar_spells_info()
{
	var int abletolearn;
	abletolearn = 0;
	AI_Output(other,self,"DIA_Pyrokar_SPELLS_15_00");	//Обучи меня.
	Info_ClearChoices(dia_pyrokar_spells);
	Info_AddChoice(dia_pyrokar_spells,DIALOG_BACK,dia_pyrokar_spells_back);
	if(PLAYER_TALENT_RUNES[SPL_FIRERAIN] == FALSE)
	{
		Info_AddChoice(dia_pyrokar_spells,b_buildlearnstring(NAME_SPL_FIRERAIN,b_getlearncosttalent(other,NPC_TALENT_RUNES)),dia_pyrokar_spells_firerain);
		abletolearn = abletolearn + 1;
	};
	if(PLAYER_TALENT_RUNES[SPL_BREATHOFDEATH] == FALSE)
	{
		Info_AddChoice(dia_pyrokar_spells,b_buildlearnstring(NAME_SPL_BREATHOFDEATH,b_getlearncosttalent(other,NPC_TALENT_RUNES)),dia_pyrokar_spells_breathofdeath);
		abletolearn = abletolearn + 1;
	};
	if(PLAYER_TALENT_RUNES[SPL_MASSDEATH] == FALSE)
	{
		Info_AddChoice(dia_pyrokar_spells,b_buildlearnstring(NAME_SPL_MASSDEATH,b_getlearncosttalent(other,NPC_TALENT_RUNES)),dia_pyrokar_spells_massdeath);
		abletolearn = abletolearn + 1;
	};
	if(PLAYER_TALENT_RUNES[SPL_SHRINK] == FALSE)
	{
		Info_AddChoice(dia_pyrokar_spells,b_buildlearnstring(NAME_SPL_SHRINK,b_getlearncosttalent(other,NPC_TALENT_RUNES)),dia_pyrokar_spells_shrink);
		abletolearn = abletolearn + 1;
	};
	if(abletolearn < 1)
	{
		AI_Output(self,other,"DIA_Pyrokar_SPELLS_11_01");	//Мне больше нечему учить тебя.
	};
};

func void dia_pyrokar_spells_back()
{
	Info_ClearChoices(dia_pyrokar_spells);
};

func void dia_pyrokar_spells_firerain()
{
	b_teachplayertalentrunes(self,other,SPL_FIRERAIN);
};

func void dia_pyrokar_spells_breathofdeath()
{
	b_teachplayertalentrunes(self,other,SPL_BREATHOFDEATH);
};

func void dia_pyrokar_spells_massdeath()
{
	b_teachplayertalentrunes(self,other,SPL_MASSDEATH);
};

func void dia_pyrokar_spells_shrink()
{
	b_teachplayertalentrunes(self,other,SPL_SHRINK);
};


instance DIA_PYROKAR_PARLAN(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 99;
	condition = dia_pyrokar_parlan_condition;
	information = dia_pyrokar_parlan_info;
	permanent = FALSE;
	description = "Меня прислал Парлан.";
};


func int dia_pyrokar_parlan_condition()
{
	if(((hero.guild == GIL_KDF) || (hero.guild == GIL_NOV) || (hero.guild == GIL_PAL)) && (PARLAN_SENDS == TRUE))
	{
		return TRUE;
	};
};

func void dia_pyrokar_parlan_info()
{
	AI_Output(other,self,"DIA_Pyrokar_Parlan_15_00");	//Меня прислал Парлан. Я хочу повысить мои магические способности
	AI_Output(self,other,"DIA_Pyrokar_Parlan_11_01");	//Что ж, ты многое узнал, и твоя сила выросла. С этого момента, ты будешь учиться у меня.
};


instance DIA_PYROKAR_TEACH_MANA(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 99;
	condition = dia_pyrokar_teach_mana_condition;
	information = dia_pyrokar_teach_mana_info;
	permanent = TRUE;
	description = "Я хочу повысить мои магические способности.";
};


func int dia_pyrokar_teach_mana_condition()
{
	if(((hero.guild == GIL_KDF) || (hero.guild == GIL_NOV) || (hero.guild == GIL_PAL)) && Npc_KnowsInfo(hero,dia_pyrokar_parlan) && (other.attribute[ATR_MANA_MAX] <= 250))
	{
		return TRUE;
	};
};

func void dia_pyrokar_teach_mana_info()
{
	AI_Output(other,self,"DIA_Pyrokar_TEACH_MANA_15_00");	//Я хочу повысить мои магические способности.
	Info_ClearChoices(dia_pyrokar_teach_mana);
	Info_AddChoice(dia_pyrokar_teach_mana,DIALOG_BACK,dia_pyrokar_teach_mana_back);
	Info_AddChoice(dia_pyrokar_teach_mana,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_pyrokar_teach_mana_1);
	Info_AddChoice(dia_pyrokar_teach_mana,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_pyrokar_teach_mana_5);
};

func void dia_pyrokar_teach_mana_back()
{
	if(other.attribute[ATR_MANA_MAX] >= 250)
	{
		AI_Output(self,other,"DIA_Pyrokar_TEACH_MANA_11_00");	//Я чувствую, как магическая энергия течет через тебя, не зная преград. Даже я не могу показать тебе, как повысить ее еще больше.
	};
	Info_ClearChoices(dia_pyrokar_teach_mana);
};

func void dia_pyrokar_teach_mana_1()
{
	b_teachattributepoints(self,other,ATR_MANA_MAX,1,250);
	Info_ClearChoices(dia_pyrokar_teach_mana);
	Info_AddChoice(dia_pyrokar_teach_mana,DIALOG_BACK,dia_pyrokar_teach_mana_back);
	Info_AddChoice(dia_pyrokar_teach_mana,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_pyrokar_teach_mana_1);
	Info_AddChoice(dia_pyrokar_teach_mana,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_pyrokar_teach_mana_5);
};

func void dia_pyrokar_teach_mana_5()
{
	b_teachattributepoints(self,other,ATR_MANA_MAX,5,250);
	Info_ClearChoices(dia_pyrokar_teach_mana);
	Info_AddChoice(dia_pyrokar_teach_mana,DIALOG_BACK,dia_pyrokar_teach_mana_back);
	Info_AddChoice(dia_pyrokar_teach_mana,b_buildlearnstring(PRINT_LEARNMANA1,b_getlearncostattribute(other,ATR_MANA_MAX)),dia_pyrokar_teach_mana_1);
	Info_AddChoice(dia_pyrokar_teach_mana,b_buildlearnstring(PRINT_LEARNMANA5,b_getlearncostattribute(other,ATR_MANA_MAX) * 5),dia_pyrokar_teach_mana_5);
};


instance DIA_PYROKAR_PERM(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 900;
	condition = dia_pyrokar_perm_condition;
	information = dia_pyrokar_perm_info;
	permanent = TRUE;
	description = "(благословение)";
};


func int dia_pyrokar_perm_condition()
{
	if(KAPITEL >= 2)
	{
		return TRUE;
	};
};

func void dia_pyrokar_perm_info()
{
	if(hero.guild == GIL_KDF)
	{
		AI_Output(other,self,"DIA_Pyrokar_PERM_15_00");	//Благослови меня, мастер.
	}
	else
	{
		AI_Output(other,self,"DIA_Pyrokar_PERM_15_01");	//Как насчет благословения? Мне оно не помешало бы.
	};
	if((KAPITEL == 5) && (MIS_PYROKARCLEARDEMONTOWER == LOG_SUCCESS))
	{
		AI_Output(self,other,"DIA_Pyrokar_PERM_11_02");	//Да увенчается успехом твоя последняя битва против нашего заклятого врага. Да пребудет с тобой Иннос.
	}
	else
	{
		AI_Output(self,other,"DIA_Pyrokar_PERM_11_03");	//Да встанет Иннос между тобой и болью на всех нечестивых путях, по которым тебе суждено пройти.
	};
};


instance DIA_PYROKAR_KAP3_EXIT(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 999;
	condition = dia_pyrokar_kap3_exit_condition;
	information = dia_pyrokar_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_pyrokar_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_pyrokar_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PYROKAR_BACKFROMOW(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 30;
	condition = dia_pyrokar_backfromow_condition;
	information = dia_pyrokar_backfromow_info;
	description = "Я пришел из старой Долины Рудников.";
};


func int dia_pyrokar_backfromow_condition()
{
	if(KAPITEL >= 3)
	{
		return TRUE;
	};
};

func void dia_pyrokar_backfromow_info()
{
	AI_Output(other,self,"DIA_Pyrokar_BACKFROMOW_15_00");	//Я пришел из старой Долины Рудников.
	AI_Output(self,other,"DIA_Pyrokar_BACKFROMOW_11_01");	//Что ты можешь доложить?
	AI_Output(other,self,"DIA_Pyrokar_BACKFROMOW_15_02");	//Враг сформировал там армию из орков и драконов.
	AI_Output(self,other,"DIA_Pyrokar_BACKFROMOW_11_03");	//Мы уже узнали это от Милтена - но что насчет королевского груза руды?
	AI_Output(other,self,"DIA_Pyrokar_BACKFROMOW_15_04");	//Шахты, в которых идет добыча в долине, не могут удовлетворить потребности короля.
	AI_Output(self,other,"DIA_Pyrokar_BACKFROMOW_11_05");	//Дни становятся темнее, а свет солнца все тусклее.
	AI_Output(other,self,"DIA_Pyrokar_BACKFROMOW_15_06");	//На меня напали люди в черных рясах.
	AI_Output(self,other,"DIA_Pyrokar_BACKFROMOW_11_07");	//Я знаю. Это Ищущие. Приспешники Белиара из преисподней. Остерегайся их. Они попытаются овладеть тобой.
	AI_Output(self,other,"DIA_Pyrokar_BACKFROMOW_11_08");	//Будучи одержимым, ты больше не будешь самим собой. Только здесь, в монастыре сможешь ты найти помощь. Так что будь осторожен.
	if(hero.guild == GIL_KDF)
	{
		Log_CreateTopic(TOPIC_DEMENTOREN,LOG_MISSION);
		Log_SetTopicStatus(TOPIC_DEMENTOREN,LOG_RUNNING);
		b_logentry(TOPIC_DEMENTOREN,"Пирокар рассказал мне об Ищущих, людях в черных рясах. Это приспешники Белиара. Он предупредил меня, что они могут сделать меня одержимым. Если это произойдет, я должен немедленно возвращаться в монастырь.");
	};
	if((Npc_IsDead(karras) == FALSE) && (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Pyrokar_BACKFROMOW_11_09");	//Я попросил Карраса заняться этим вопросом. Ему наверняка скоро удастся лучше понять эту проблему, что позволит нам видеть яснее.
		PYROKARTOLDKARRASTORESEARCHDMT = TRUE;
		b_logentry(TOPIC_DEMENTOREN,"Пирокар приказал Каррасу ликвидировать угрозу, исходящую от Ищущих.");
	};
	AI_Output(self,other,"DIA_Pyrokar_Add_11_00");	//Вот - эта руна всегда перенесет тебя прямо в монастырь, если тебе понадобится помощь.
	b_giveinvitems(self,other,itru_teleportmonastery,1);
	AI_Output(self,other,"DIA_Pyrokar_BACKFROMOW_11_10");	//Помни, мы должны сопротивляться, иначе нам всем настанет конец.
};


instance DIA_PYROKAR_GIVEINNOSEYE(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 31;
	condition = dia_pyrokar_giveinnoseye_condition;
	information = dia_pyrokar_giveinnoseye_info;
	description = "Я пришел, чтобы забрать Глаз Инноса.";
};


func int dia_pyrokar_giveinnoseye_condition()
{
	if((KAPITEL == 3) && Npc_HasItems(other,itwr_permissiontowearinnoseye_mis))
	{
		return TRUE;
	};
};

func void dia_pyrokar_giveinnoseye_info()
{
	AI_Output(other,self,"DIA_Pyrokar_GIVEINNOSEYE_15_00");	//Я пришел, чтобы забрать Глаз Инноса.
	b_giveinvitems(other,self,itwr_permissiontowearinnoseye_mis,1);
	AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_11_01");	//Я вижу, ты получил позволение лично от лорда Хагена носить Глаз Инноса.
	AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_11_02");	//Но боюсь, мне придется разочаровать тебя. Мы стали жертвами вероломного плана врага.
	AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_11_03");	//Глаз Инноса был нагло украден из этих священных стен.
	if(hero.guild == GIL_KDF)
	{
		Info_AddChoice(dia_pyrokar_giveinnoseye,"Кто мог совершить столь дерзкий поступок, мастер?",dia_pyrokar_giveinnoseye_wer);
	}
	else
	{
		Info_AddChoice(dia_pyrokar_giveinnoseye,"Кто сделал это?",dia_pyrokar_giveinnoseye_wer);
	};
};

func void dia_pyrokar_giveinnoseye_wer()
{
	if(hero.guild == GIL_KDF)
	{
		AI_Output(other,self,"DIA_Pyrokar_GIVEINNOSEYE_wer_15_00");	//Кто мог совершить столь дерзкий поступок, мастер?
	}
	else
	{
		AI_Output(other,self,"DIA_Pyrokar_GIVEINNOSEYE_wer_15_01");	//Кто сделал это?
	};
	AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_wer_11_02");	//Зло коварно, и обычно действует тайно. Крайне редко можно видеть, как оно выползает на свет божий, чтобы открыто проводить в жизнь свои махинации.
	AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_wer_11_03");	//Но в эти дни все стало по-другому. Враг теперь действует в открытую на каждой улице, в каждом доме и на каждой площади.
	AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_wer_11_04");	//Это может означать только, что он больше не боится своего противника, и не собирается отступать ни перед чем.
	AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_wer_11_05");	//Один из наших самых верных последователей, кандидат на священную робу Мага Огня, неожиданно изменил свою веру и сделал это в вызывающе дьявольской манере. Это Педро.
	AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_wer_11_06");	//Враг овладел им, нанеся тем самым ужасное поражение всем нам.
	AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_wer_11_07");	//Педро пробил себе дорогу мечом в наши самые священные покои и украл Глаз.
	AI_Output(self,other,"DIA_Pyrokar_GIVEINNOSEYE_wer_11_08");	//Я боюсь, что он просто слишком много времени проводил наедине, за воротами и защитными стенами монастыря, открытый для опасностей всякого рода.
	pedro.flags = 0;
	PEDRO_TRAITOR = TRUE;
	b_logentry(TOPIC_INNOSEYE,"Невероятно. Хотя я ожидал чего-то подобного. Я опоздал, эти тупицы из монастыря позволили какому-то послушнику украсть Глаз, и теперь мне придется гнаться за предателем Педро и надеяться, что он еще не продал Глаз кому-нибудь.");
	b_logentry(TOPIC_TRAITORPEDRO,"Предатель Педро украл Глаз Инноса из монастыря. Как я понимаю, маги огня теперь из кожи вон лезут, чтобы найти этого предателя.");
};


instance DIA_PYROKAR_NOVIZENCHASE(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 34;
	condition = dia_pyrokar_novizenchase_condition;
	information = dia_pyrokar_novizenchase_info;
	description = "Куда побежал этот вор?";
};


func int dia_pyrokar_novizenchase_condition()
{
	if((KAPITEL == 3) && (PEDRO_TRAITOR == TRUE))
	{
		return TRUE;
	};
};

func void dia_pyrokar_novizenchase_info()
{
	AI_Output(other,self,"DIA_Pyrokar_NOVIZENCHASE_15_00");	//Куда побежал этот вор?
	AI_Output(self,other,"DIA_Pyrokar_NOVIZENCHASE_11_01");	//Педро убил несколько послушников, пытавшихся остановить его, и растворился в утреннем тумане.
	AI_Output(self,other,"DIA_Pyrokar_NOVIZENCHASE_11_02");	//Многие послушники бросились за ним в погоню, чтобы вернуть Глаз назад, на его законное место.
	AI_Output(self,other,"DIA_Pyrokar_NOVIZENCHASE_11_03");	//Если ты хочешь догнать их, то поторопись, пока Педро не стал недосягаемым.
	MIS_NOVIZENCHASE = LOG_RUNNING;
};


instance DIA_PYROKAR_FOUNDINNOSEYE(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 35;
	condition = dia_pyrokar_foundinnoseye_condition;
	information = dia_pyrokar_foundinnoseye_info;
	description = "Я нашел Глаз Инноса.";
};


func int dia_pyrokar_foundinnoseye_condition()
{
	if((KAPITEL == 3) && (MIS_NOVIZENCHASE == LOG_RUNNING) && (Npc_HasItems(other,itmi_innoseye_broken_mis) || (MIS_SCKNOWSINNOSEYEISBROKEN == TRUE)))
	{
		return TRUE;
	};
};

func void dia_pyrokar_foundinnoseye_info()
{
	AI_Output(other,self,"DIA_Pyrokar_FOUNDINNOSEYE_15_00");	//Я нашел Глаз Инноса. Он поврежден.
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_11_01");	//Но... этого не может быть. Что произошло?
	AI_Output(other,self,"DIA_Pyrokar_FOUNDINNOSEYE_15_02");	//Его заполучили в свои руки заказчики весьма отвратительного вида. Так получилось, что я прибыл слишком поздно.
	AI_Output(other,self,"DIA_Pyrokar_FOUNDINNOSEYE_15_03");	//Они выполняли странный обряд на пьедестале в форме полумесяца в здешнем лесу.
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_11_04");	//Да пребудет с нами Иннос! Они осквернили наш Круг Солнца.
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_11_05");	//Даже в своих худших кошмарах не мог я представить, что они обладают такой силой.
	MIS_SCKNOWSINNOSEYEISBROKEN = TRUE;
	MIS_NOVIZENCHASE = LOG_SUCCESS;
	b_giveplayerxp(XP_AMBIENT);
	Info_ClearChoices(dia_pyrokar_foundinnoseye);
	Info_AddChoice(dia_pyrokar_foundinnoseye,"Что мы теперь можем сделать?",dia_pyrokar_foundinnoseye_was);
};

func void dia_pyrokar_foundinnoseye_was()
{
	AI_Output(other,self,"DIA_Pyrokar_FOUNDINNOSEYE_was_15_00");	//Что мы теперь можем сделать?
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_was_11_01");	//Враг стал очень силен. Но все же, этот древний артефакт представлял серьезную угрозу для него.
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_was_11_02");	//Мы должны исцелить Глаз и восстановить его былую силу. Но время работает против нас.
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_was_11_03");	//Я даже представить себе не могу, что теперь ждет всех нас. Без защиты Глаза, мы беспомощны и находимся полностью в руках врага.
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_was_11_04");	//Иди в город, к Ватрасу, магу Воды. В этой ужасной ситуации, только он знает, что нужно делать. Отнеси Глаз ему, и поторопись.
	Info_AddChoice(dia_pyrokar_foundinnoseye,DIALOG_BACK,dia_pyrokar_foundinnoseye_weiter);
	if(hero.guild == GIL_KDF)
	{
		Info_AddChoice(dia_pyrokar_foundinnoseye,"Почему Ватрас?",dia_pyrokar_foundinnoseye_was_vatras);
	};
	Info_AddChoice(dia_pyrokar_foundinnoseye,"Что такое Круг Солнца?",dia_pyrokar_foundinnoseye_sonnenkreis);
	b_logentry(TOPIC_INNOSEYE,"Пирокар хочет, чтобы я спросил у мага воды Ватраса, находящегося в городе, совета о том, что можно сделать с поврежденным Глазом.");
	MIS_PYROKAR_GOTOVATRASINNOSEYE = LOG_RUNNING;
};

func void dia_pyrokar_foundinnoseye_was_vatras()
{
	AI_Output(other,self,"DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_15_00");	//Почему Ватрас?
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_11_01");	//Привилегия ношения робы мага не дает тебе права обсуждать мои приказы, брат.
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_11_02");	//Ватрас слуга Аданоса. Только знания Магов Воды могут принести нам прояснение в этот мрачный час.
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_was_vatras_11_03");	//Это все, что тебе нужно знать.
};

func void dia_pyrokar_foundinnoseye_sonnenkreis()
{
	AI_Output(other,self,"DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_15_00");	//Что такое Круг Солнца?
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_11_01");	//Каждый год все маги и послушники монастыря отправляются к этому месту во время солнцестояния, чтобы отметить начало нового цикла.
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_11_02");	//Это место наполняется безмерной силой солнца.
	AI_Output(self,other,"DIA_Pyrokar_FOUNDINNOSEYE_sonnenkreis_11_03");	//У меня никогда даже мысль такая не появлялась, что эту силу можно обратить. И все же это произошло.
};

func void dia_pyrokar_foundinnoseye_weiter()
{
	Info_ClearChoices(dia_pyrokar_foundinnoseye);
};


instance DIA_PYROKAR_SPOKETOVATRAS(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 30;
	condition = dia_pyrokar_spoketovatras_condition;
	information = dia_pyrokar_spoketovatras_info;
	description = "Я говорил с Ватрасом.";
};


func int dia_pyrokar_spoketovatras_condition()
{
	if((MIS_RITUALINNOSEYEREPAIR == LOG_RUNNING) && (KAPITEL == 3))
	{
		return TRUE;
	};
};

func void dia_pyrokar_spoketovatras_info()
{
	AI_Output(other,self,"DIA_Pyrokar_SPOKETOVATRAS_15_00");	//Я говорил с Ватрасом.
	AI_Output(self,other,"DIA_Pyrokar_SPOKETOVATRAS_11_01");	//Ах, хорошо. Где он?
	AI_Output(other,self,"DIA_Pyrokar_SPOKETOVATRAS_15_02");	//Он готовит ритуал в Круге Солнца, чтобы исцелить Глаз Инноса.
	AI_Output(self,other,"DIA_Pyrokar_SPOKETOVATRAS_11_03");	//Если это правда, то, может быть, у нас все же сеть надежда.
	AI_Output(other,self,"DIA_Pyrokar_SPOKETOVATRAS_15_04");	//Ватрас хочет, чтобы Ксардас и ты помогли ему в этом.
	AI_Output(self,other,"DIA_Pyrokar_SPOKETOVATRAS_11_05");	//ЧТО? Ксардас тоже будет там? Ты ведь это не серьезно.
	AI_Output(other,self,"DIA_Pyrokar_SPOKETOVATRAS_15_06");	//Послушай. Это не мое решение. Ватрас настаивает.
	AI_Output(self,other,"DIA_Pyrokar_SPOKETOVATRAS_11_07");	//Всегда и всюду этот Ксардас. Я устал от этого. Ничего не может быть хуже.
	AI_Output(self,other,"DIA_Pyrokar_SPOKETOVATRAS_11_08");	//Откуда мне знать, что этот Ксардас не в союзе с нашим врагом?
	AI_Output(self,other,"DIA_Pyrokar_SPOKETOVATRAS_11_09");	//Я не могу доверять Ксардасу. И не важно, что мы так нуждаемся в нем.
	AI_Output(self,other,"DIA_Pyrokar_SPOKETOVATRAS_11_10");	//Извини, но я не могу помочь Ватрасу при таких условиях.
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_PYROKAR_XARDASVERTRAUEN(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 30;
	condition = dia_pyrokar_xardasvertrauen_condition;
	information = dia_pyrokar_xardasvertrauen_info;
	description = "Без тебя ничего не получится. Ватрас не сможет провести этот ритуал.";
};


func int dia_pyrokar_xardasvertrauen_condition()
{
	if(Npc_KnowsInfo(other,dia_pyrokar_spoketovatras) && (KAPITEL == 3))
	{
		return TRUE;
	};
};

func void dia_pyrokar_xardasvertrauen_info()
{
	AI_Output(other,self,"DIA_Pyrokar_XARDASVERTRAUEN_15_00");	//Без тебя ничего не получится. Ватрас не сможет провести этот ритуал.
	AI_Output(other,self,"DIA_Pyrokar_XARDASVERTRAUEN_15_01");	//Ты должен довериться Ксардасу.
	AI_Output(self,other,"DIA_Pyrokar_XARDASVERTRAUEN_11_02");	//Я ничего не могу поделать, ты слышишь? У меня нет ни малейшего доказательства, что Ксардас не работает против нас. Я не могу сделать это.
	AI_Output(other,self,"DIA_Pyrokar_XARDASVERTRAUEN_15_03");	//А что если я принесу тебе доказательство?
	AI_Output(self,other,"DIA_Pyrokar_XARDASVERTRAUEN_11_04");	//Боюсь, это невозможно. Это должно быть что-то, что действительно потрясет меня.
	AI_Output(self,other,"DIA_Pyrokar_XARDASVERTRAUEN_11_05");	//Что касается Ксардаса, то у меня большие сомнения насчет того, что он вообще может произвести на меня впечатление.
	b_logentry(TOPIC_INNOSEYE,"Пирокара прямо в дрожь бросает, когда он слышит о Ксардасе. Я должен обсудить с Ксардасом, как заставить Пирокара принять участие в ритуале в Круге Солнца.");
	PYROKAR_DENIESINNOSEYERITUAL = TRUE;
};


instance DIA_PYROKAR_BUCHZURUECK(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 30;
	condition = dia_pyrokar_buchzurueck_condition;
	information = dia_pyrokar_buchzurueck_info;
	description = "Я принес эту книгу от Ксардаса.";
};


func int dia_pyrokar_buchzurueck_condition()
{
	if(Npc_HasItems(other,itwr_xardasbookforpyrokar_mis) && (KAPITEL == 3))
	{
		return TRUE;
	};
};

func void dia_pyrokar_buchzurueck_info()
{
	AI_Output(other,self,"DIA_Pyrokar_BUCHZURUECK_15_00");	//Я принес эту книгу от Ксардаса.
	AI_Output(other,self,"DIA_Pyrokar_BUCHZURUECK_15_01");	//Это знак его доверия.
	AI_Output(self,other,"DIA_Pyrokar_BUCHZURUECK_11_02");	//Покажи.
	b_giveinvitems(other,self,itwr_xardasbookforpyrokar_mis,1);
	Npc_RemoveInvItems(self,itwr_xardasbookforpyrokar_mis,1);
	AI_Output(self,other,"DIA_Pyrokar_BUCHZURUECK_11_03");	//(пораженно) Но это невероятно! Ты имеешь хоть малейшее представление о том, что ты только что дал мне?
	AI_Output(other,self,"DIA_Pyrokar_BUCHZURUECK_15_04");	//Ээээ. Нет.
	AI_Output(self,other,"DIA_Pyrokar_BUCHZURUECK_11_05");	//(сердито) Это древний, давно потерянный том из давно прошедших дней.
	AI_Output(self,other,"DIA_Pyrokar_BUCHZURUECK_11_06");	//Мы все думали, что он утерян навсегда, и теперь я узнаю, что Ксардас все это время знал, что сталось с ним.
	AI_Output(other,self,"DIA_Pyrokar_BUCHZURUECK_15_07");	//Так ты будешь присутствовать на ритуале?
	AI_Output(self,other,"DIA_Pyrokar_BUCHZURUECK_11_08");	//Да, я отправляюсь в Круг Солнца, но, конечно, не потому, что я убедился в добрых намерениях Ксардаса.
	AI_Output(self,other,"DIA_Pyrokar_BUCHZURUECK_11_09");	//На самом деле, я собираюсь заставить этого шакала объяснить, где он прятал эту книгу столько долгих лет. На этот раз он, определенно, зашел слишком далеко.
	AI_Output(self,other,"DIA_Pyrokar_BUCHZURUECK_11_10");	//Увидимся в Круге Солнца.
	AI_StopProcessInfos(self);
	AI_UseMob(self,"THRONE",-1);
	Npc_ExchangeRoutine(self,"RitualInnosEyeRepair");
	b_logentry(TOPIC_INNOSEYE,"Пирокар, наконец, согласился отправиться к Кругу Солнца.");
	PYROKAR_GOESTORITUALINNOSEYE = TRUE;
};


instance DIA_PYROKAR_PRERITUAL(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 30;
	condition = dia_pyrokar_preritual_condition;
	information = dia_pyrokar_preritual_info;
	permanent = TRUE;
	description = "Ты думаешь, вы сможете восстановить Глаз?";
};


func int dia_pyrokar_preritual_condition()
{
	if((PYROKAR_GOESTORITUALINNOSEYE == TRUE) && (MIS_RITUALINNOSEYEREPAIR == LOG_RUNNING) && (KAPITEL == 3))
	{
		return TRUE;
	};
};

func void dia_pyrokar_preritual_info()
{
	AI_Output(other,self,"DIA_Pyrokar_PRERITUAL_15_00");	//Ты думаешь, вы сможете восстановить Глаз?
	AI_Output(self,other,"DIA_Pyrokar_PRERITUAL_11_01");	//Трудно сказать. Поживем - увидим.
};


instance DIA_PYROKAR_AUGEGEHEILT(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 30;
	condition = dia_pyrokar_augegeheilt_condition;
	information = dia_pyrokar_augegeheilt_info;
	description = "Вы сделали это. Глаз Инноса исцелен.";
};


func int dia_pyrokar_augegeheilt_condition()
{
	if((MIS_RITUALINNOSEYEREPAIR == LOG_SUCCESS) && (KAPITEL == 3))
	{
		return TRUE;
	};
};

func void dia_pyrokar_augegeheilt_info()
{
	AI_Output(other,self,"DIA_Pyrokar_AUGEGEHEILT_15_00");	//Вы сделали это. Глаз Инноса исцелен.
	AI_Output(self,other,"DIA_Pyrokar_AUGEGEHEILT_11_01");	//Я почти не верил, что это возможно.
	if(hero.guild == GIL_KDF)
	{
		AI_Output(other,self,"DIA_Pyrokar_AUGEGEHEILT_15_02");	//Да, мастер.
		AI_Output(self,other,"DIA_Pyrokar_AUGEGEHEILT_11_03");	//Ты уже неоднократно доказал, что готов к вступлению в Высший Орден Магов Огня.
		AI_Output(self,other,"DIA_Pyrokar_AUGEGEHEILT_11_04");	//С этого дня ты являешься членом Совета и будешь представлять наш Орден по всему свету. Теперь ты один из высших Магов Огня.
		AI_Output(self,other,"DIA_Pyrokar_AUGEGEHEILT_11_05");	//Носи эту священную робу с достоинством и неси в мир порядок, честь и славу, брат мой.
		CreateInvItem(hero,itar_kdf_h);
		AI_EquipArmor(hero,itar_kdf_h);
		HEROGIL_KDF2 = TRUE;
	};
};


instance DIA_PYROKAR_KAP3_READY(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 30;
	condition = dia_pyrokar_kap3_ready_condition;
	information = dia_pyrokar_kap3_ready_info;
	description = "Что мне остается сделать здесь?";
};


func int dia_pyrokar_kap3_ready_condition()
{
	if((KAPITEL == 3) && Npc_KnowsInfo(other,dia_pyrokar_augegeheilt))
	{
		return TRUE;
	};
};

func void dia_pyrokar_kap3_ready_info()
{
	AI_Output(other,self,"DIA_Pyrokar_KAP3_READY_15_00");	//Что мне остается сделать здесь?
	AI_Output(self,other,"DIA_Pyrokar_KAP3_READY_11_01");	//Не трать свое время на тривиальные вещи. Иди и уничтожь драконов. Вот, возьми Глаз.
	CreateInvItems(self,itmi_innoseye_mis,1);
	b_giveinvitems(self,other,itmi_innoseye_mis,1);
	AI_Output(self,other,"DIA_Pyrokar_KAP3_READY_11_02");	//Помни, что тебе нужно сначала поговорить с драконом, прежде чем ты сможешь атаковать его.
	AI_Output(self,other,"DIA_Pyrokar_Add_11_01");	//Сила Глаза заставит драконов говорить с тобой, и говорить правду.
	AI_Output(self,other,"DIA_Pyrokar_Add_11_02");	//Кроме того, он дает защиту от их атак.
	AI_Output(self,other,"DIA_Pyrokar_KAP3_READY_11_05");	//Однако, его сила не вечна. Тебе придется снова пополнять его магической энергией.
	AI_Output(self,other,"DIA_Pyrokar_KAP3_READY_11_06");	//Для этого тебе понадобится эссенция из сердца дракона, которую нужно объединить с Глазом на алхимическом столе.
	AI_Output(self,other,"DIA_Pyrokar_KAP3_READY_11_07");	//Только тогда ты сможешь приблизиться к очередному дракону.
	AI_Output(other,self,"DIA_Pyrokar_KAP3_READY_15_08");	//Спасибо. Я запомню это.
	AI_Output(self,other,"DIA_Pyrokar_KAP3_READY_11_09");	//Теперь у тебя есть все необходимое. Иди же. У тебя не так много времени.
	PLAYER_TALENT_ALCHEMY[CHARGE_INNOSEYE] = TRUE;
	PrintScreen(PRINT_LEARNALCHEMYINNOSEYE,-1,-1,FONT_SCREEN,2);
	TOPIC_END_INNOSEYE = TRUE;
	b_giveplayerxp(XP_AMBIENT);
	CreateInvItems(gorax,itmi_runeblank,1);
	Log_CreateTopic(TOPIC_DRACHENJAGD,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DRACHENJAGD,LOG_RUNNING);
	b_logentry(TOPIC_DRACHENJAGD,"Теперь я готов к встрече с драконами. Глаз Инноса поможет мне уничтожить их. Но прежде чем вступать в битву с драконами, я должен не забыть надеть его. Я должен поговорить с драконами, прежде чем начинать сражение. Проблема состоит в том, что Глаз теряет свою силу каждый раз, когда я разговариваю с одним из них. Чтобы восстановить силу этого амулета, мне необходимо сердце дракона и пустая мензурка. Я должен объединить ослабленный камень и экстракт из драконьего сердца на алхимическом столе, прежде чем противостоять другому дракону.");
	MIS_READYFORCHAPTER4 = TRUE;
	b_npc_isalivecheck(NEWWORLD_ZEN);
	AI_StopProcessInfos(self);
	Npc_ExchangeRoutine(self,"Start");
};


instance DIA_PYROKAR_BUCHDERBESSENEN(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 39;
	condition = dia_pyrokar_buchderbessenen_condition;
	information = dia_pyrokar_buchderbessenen_info;
	description = "Я нашел странный альманах.";
};


func int dia_pyrokar_buchderbessenen_condition()
{
	if(Npc_KnowsInfo(other,dia_pyrokar_backfromow) && Npc_HasItems(other,itwr_dementorobsessionbook_mis))
	{
		return TRUE;
	};
};

func void dia_pyrokar_buchderbessenen_info()
{
	AI_Output(other,self,"DIA_Pyrokar_BUCHDERBESSENEN_15_00");	//Я нашел странный альманах.
	AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_01");	//Да? Что это за альманах?
	AI_Output(other,self,"DIA_Pyrokar_BUCHDERBESSENEN_15_02");	//Я не уверен. Я думал, ты можешь знать, что делать с ним.
	b_giveinvitems(other,self,itwr_dementorobsessionbook_mis,1);
	AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_03");	//Воистину, это очень тревожный знак. Я рад, что ты принес его мне. Это было мудро.
	b_giveplayerxp(XP_AMBIENT);
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_04");	//Я полагаю, что он не единственный. Иди и найди еще эти книги проклятия.
		AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_05");	//Я подозреваю, что это инструмент Ищущих.
		AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_06");	//Они используют его, чтобы контролировать потерянные души своих жертв.
		AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_07");	//Они, очевидно, записывают имена тех, кем они планируют овладеть, в эти книги.
		AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_08");	//Послушай. Я дам тебе это магическое письмо. Оно покажет тебе имена, записанные в этих книгах.
		CreateInvItems(self,itwr_pyrokarsobsessionlist,1);
		b_giveinvitems(self,other,itwr_pyrokarsobsessionlist,1);
		AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_09");	//Найди этих жертв и принеси мне их книги. Я избавлюсь от них.
		if(Npc_IsDead(karras) == FALSE)
		{
			AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_10");	//Но сначала ты должен показать хотя бы одну из них Каррасу. Может, это поможет ему в его исследованиях.
		};
		AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_11");	//И не сделай ошибку, попытавшись уничтожить их самостоятельно. Ты еще не готов выдержать их силу.
		b_logentry(TOPIC_DEMENTOREN,"Пирокар хочет, чтобы Альманах Одержимых не принес вреда. Он дал мне список всех, кого Ищущие планируют сделать одержимыми. В этом списке Пирокара позднее могут появиться новые имена.");
	};
	AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_12");	//Не приближайся к Ищущим, иначе они овладеют тобой.
	AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_13");	//Если ты все же поймешь, что не в состоянии сопротивляться их зову, возвращайся ко мне как можно скорее.
	AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_14");	//Только здесь, в монастыре, твоя душа может быть спасена.
	if((Npc_IsDead(karras) == FALSE) && (hero.guild == GIL_KDF))
	{
		AI_Output(other,self,"DIA_Pyrokar_BUCHDERBESSENEN_15_15");	//А от их ментальных атак нет никакой защиты?
		AI_Output(self,other,"DIA_Pyrokar_BUCHDERBESSENEN_11_16");	//Защита возможна. Каррас может знать что-нибудь об этом.
		PYROKAR_ASKKARRASABOUTDMTAMULETT = TRUE;
		b_logentry(TOPIC_DEMENTOREN,"Каррас должен помочь мне найти защиту от ментальных атак Ищущих.");
	};
};


instance DIA_PYROKAR_SCOBSESSED(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 70;
	condition = dia_pyrokar_scobsessed_condition;
	information = dia_pyrokar_scobsessed_info;
	permanent = TRUE;
	description = "(Вылечить одержимость)";
};


func int dia_pyrokar_scobsessed_condition()
{
	if(SC_ISOBSESSED == TRUE)
	{
		return TRUE;
	};
};


var int got_healobsession_day;

func void dia_pyrokar_scobsessed_info()
{
	if(((GOT_HEALOBSESSION_DAY <= (Wld_GetDay() - 2)) || (GOT_HEALOBSESSION_DAY == 0)) && (Npc_HasItems(other,itpo_healobsession_mis) == FALSE))
	{
		if(hero.guild == GIL_KDF)
		{
			AI_Output(other,self,"DIA_Pyrokar_SCOBSESSED_15_00");	//Исцели меня, мастер, ибо я одержим.
			AI_Output(self,other,"DIA_Pyrokar_SCOBSESSED_11_01");	//Да будет так! Возьми это зелье. Оно избавит тебя от ночных кошмаров.
			AI_Output(self,other,"DIA_Pyrokar_SCOBSESSED_11_02");	//Да избавит тебя Иннос от этой напасти.
			AI_Output(self,other,"DIA_Pyrokar_SCOBSESSED_11_03");	//Действуй от его имени и остерегайся черного взгляда врага.
			if(SC_OBSESSIONTIMES > 3)
			{
				AI_Output(self,other,"DIA_Pyrokar_SCOBSESSED_11_04");	//Но я предостерегаю тебя - если ты будешь попадать в их сети слишком часто, может статься так, что возврата уже не будет. Всегда помни об этом.
			};
			CreateInvItems(self,itpo_healobsession_mis,2);
			b_giveinvitems(self,other,itpo_healobsession_mis,2);
			GOT_HEALOBSESSION_DAY = Wld_GetDay();
		}
		else
		{
			AI_Output(other,self,"DIA_Pyrokar_SCOBSESSED_15_05");	//Я думаю, я одержим. Ты можешь исцелить меня?
			AI_Output(self,other,"DIA_Pyrokar_SCOBSESSED_11_06");	//При условии проявления твоего уважения к этому монастырю, сын мой. 300 золотых.
			Info_ClearChoices(dia_pyrokar_scobsessed);
			Info_AddChoice(dia_pyrokar_scobsessed,"Это слишком много.",dia_pyrokar_scobsessed_nein);
			Info_AddChoice(dia_pyrokar_scobsessed,"Отлично. Вот деньги.",dia_pyrokar_scobsessed_ok);
		};
	}
	else
	{
		AI_Output(self,other,"DIA_Pyrokar_SCOBSESSED_11_07");	//Но ты только что получил исцеляющее зелье. Обратись ко мне, только если тебе действительно понадобится помощь.
	};
};

func void dia_pyrokar_scobsessed_ok()
{
	AI_Output(other,self,"DIA_Pyrokar_SCOBSESSED_ok_15_00");	//Отлично. Вот деньги.
	if(b_giveinvitems(other,self,itmi_gold,300))
	{
		AI_Output(self,other,"DIA_Pyrokar_SCOBSESSED_ok_11_01");	//Вот, выпей это. Да избавит тебя Иннос от этой напасти.
		CreateInvItems(self,itpo_healobsession_mis,2);
		b_giveinvitems(self,other,itpo_healobsession_mis,2);
		GOT_HEALOBSESSION_DAY = Wld_GetDay();
	}
	else
	{
		AI_Output(self,other,"DIA_Pyrokar_SCOBSESSED_ok_11_02");	//Принеси мне деньги, и я смогу помочь тебе.
	};
	Info_ClearChoices(dia_pyrokar_scobsessed);
};

func void dia_pyrokar_scobsessed_nein()
{
	AI_Output(other,self,"DIA_Pyrokar_SCOBSESSED_nein_15_00");	//Это слишком много.
	Info_ClearChoices(dia_pyrokar_scobsessed);
};


instance DIA_PYROKAR_ALMANACHBRINGEN(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 5;
	condition = dia_pyrokar_almanachbringen_condition;
	information = dia_pyrokar_almanachbringen_info;
	permanent = TRUE;
	description = "Я могу рассказать еще кое-что об этих одержимых.";
};


func int dia_pyrokar_almanachbringen_condition()
{
	if((KAPITEL >= 3) && (Npc_HasItems(other,itwr_dementorobsessionbook_mis) >= 1) && (hero.guild == GIL_KDF) && Npc_KnowsInfo(other,dia_pyrokar_buchderbessenen))
	{
		return TRUE;
	};
};


var int almanachcounter;
var int dia_pyrokar_almanachbringen_onetime;

func void dia_pyrokar_almanachbringen_info()
{
	var int almanachcount;
	var int xp_kdf_bringalmanachs;
	var int almanachgeld;
	var int pyrokarsalmanachoffer;
	AI_Output(other,self,"DIA_Pyrokar_AlmanachBringen_15_00");	//Я могу рассказать еще кое-что об этих одержимых.
	AI_Output(self,other,"DIA_Pyrokar_AlmanachBringen_11_01");	//Говори, брат.
	pyrokarsalmanachoffer = 400;
	almanachcount = Npc_HasItems(other,itwr_dementorobsessionbook_mis);
	if(almanachcount == 1)
	{
		AI_Output(other,self,"DIA_Pyrokar_AlmanachBringen_15_02");	//Я нашел еще один альманах.
		b_giveplayerxp(XP_KDF_BRINGALMANACH);
		b_giveinvitems(other,self,itwr_dementorobsessionbook_mis,1);
		ALMANACHCOUNTER = ALMANACHCOUNTER + 1;
	}
	else
	{
		AI_Output(other,self,"DIA_Pyrokar_AlmanachBringen_15_03");	//Я нашел еще несколько книг Ищущих.
		b_giveinvitems(other,self,itwr_dementorobsessionbook_mis,almanachcount);
		xp_kdf_bringalmanachs = almanachcount * XP_KDF_BRINGALMANACH;
		ALMANACHCOUNTER = ALMANACHCOUNTER + almanachcount;
		b_giveplayerxp(xp_kdf_bringalmanachs);
	};
	if(ALMANACHCOUNTER <= 5)
	{
		AI_Output(self,other,"DIA_Pyrokar_AlmanachBringen_11_04");	//Это хорошо. Боюсь, впрочем, что это далеко не все. Продолжай поиски.
	}
	else if(ALMANACHCOUNTER <= 8)
	{
		AI_Output(self,other,"DIA_Pyrokar_AlmanachBringen_11_05");	//Многие из них уже найдены. Но я не думаю, что мы изъяли их все.
	}
	else
	{
		AI_Output(self,other,"DIA_Pyrokar_AlmanachBringen_11_06");	//Ты уже принес целую кучу этих вражеских книг.
		AI_Output(self,other,"DIA_Pyrokar_AlmanachBringen_11_07");	//Я буду удивлен, если тебе удастся найти еще.
	};
	AI_Output(self,other,"DIA_Pyrokar_AlmanachBringen_11_08");	//Вот, возьми. Это дар от монастыря, который поможет тебе противостоять злу.
	if(DIA_PYROKAR_ALMANACHBRINGEN_ONETIME == FALSE)
	{
		AI_Output(self,other,"DIA_Pyrokar_AlmanachBringen_11_09");	//И не забывай время от времени заглядывать в мое магическое письмо.
		AI_Output(self,other,"DIA_Pyrokar_AlmanachBringen_11_10");	//Возможно, они попытаются проделать это с другими, чьи имена пока еще не вписаны в альманахи.
		DIA_PYROKAR_ALMANACHBRINGEN_ONETIME = TRUE;
	};
	almanachgeld = almanachcount * pyrokarsalmanachoffer;
	CreateInvItems(self,itmi_gold,almanachgeld);
	b_giveinvitems(self,other,itmi_gold,almanachgeld);
};


instance DIA_PYROKAR_KAP4_EXIT(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 999;
	condition = dia_pyrokar_kap4_exit_condition;
	information = dia_pyrokar_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_pyrokar_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_pyrokar_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PYROKAR_KAP5_EXIT(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 999;
	condition = dia_pyrokar_kap5_exit_condition;
	information = dia_pyrokar_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_pyrokar_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_pyrokar_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PYROKAR_DRACHENTOT(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 2;
	condition = dia_pyrokar_drachentot_condition;
	information = dia_pyrokar_drachentot_info;
	description = "Все драконы мертвы.";
};


func int dia_pyrokar_drachentot_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_pyrokar_drachentot_info()
{
	AI_Output(other,self,"DIA_Pyrokar_DRACHENTOT_15_00");	//Все драконы мертвы.
	AI_Output(self,other,"DIA_Pyrokar_DRACHENTOT_11_01");	//Это воистину хорошие новости. Но это совершенно не меняет наше положение, которое кажется безнадежным.
	AI_Output(self,other,"DIA_Pyrokar_DRACHENTOT_11_02");	//Ищущие все еще не ушли. Скорее наоборот. Я слышу все больше и больше сообщений о том, что за последние несколько дней, их численность даже увеличилась.
	AI_Output(self,other,"DIA_Pyrokar_DRACHENTOT_11_03");	//Уничтожение драконов нанесло врагу серьезный удар, но этого недостаточно. Нам нужно вырвать это зло с корнем.
};


instance DIA_PYROKAR_DERMEISTER(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 2;
	condition = dia_pyrokar_dermeister_condition;
	information = dia_pyrokar_dermeister_info;
	description = "Я говорил с драконами.";
};


func int dia_pyrokar_dermeister_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_pyrokar_dermeister_info()
{
	AI_Output(other,self,"DIA_Pyrokar_DERMEISTER_15_00");	//Я говорил с драконами.
	AI_Output(self,other,"DIA_Pyrokar_DERMEISTER_11_01");	//Что они сказали?
	AI_Output(other,self,"DIA_Pyrokar_DERMEISTER_15_02");	//Они все время говорили о силе их хозяина и о том, что он находится в Чертогах Ирдората.
	AI_Output(self,other,"DIA_Pyrokar_DERMEISTER_11_03");	//Да пребудет с нами Иннос. Черный Храм восстановил свою силу и теперь отправляет своих приспешников в наш мир.
};


instance DIA_PYROKAR_WASISTIRDORATH(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 2;
	condition = dia_pyrokar_wasistirdorath_condition;
	information = dia_pyrokar_wasistirdorath_info;
	description = "Что такое эти Чертоги Ирдората?";
};


func int dia_pyrokar_wasistirdorath_condition()
{
	if((KAPITEL == 5) && Npc_KnowsInfo(other,dia_pyrokar_dermeister))
	{
		return TRUE;
	};
};

func void dia_pyrokar_wasistirdorath_info()
{
	AI_Output(other,self,"DIA_Pyrokar_WASISTIRDORATH_15_00");	//Что такое эти Чертоги Ирдората?
	AI_Output(self,other,"DIA_Pyrokar_WASISTIRDORATH_11_01");	//Восточный храм вызова бога Белиара. Всего на земле Миртаны их четыре. Но этот, вероятно, самый ужасный храм из всех.
	AI_Output(self,other,"DIA_Pyrokar_WASISTIRDORATH_11_02");	//Около 40 лет назад северный и западный храмы этого ужасного божества были уничтожены.
	AI_Output(self,other,"DIA_Pyrokar_WASISTIRDORATH_11_03");	//Мужественные рыцари того времени отдали все, чтобы сравнять эти величественные сооружения с землей.
	AI_Output(self,other,"DIA_Pyrokar_WASISTIRDORATH_11_04");	//Тогда черные орды врага были бессильны против превосходящих их мужеством и числом рыцарей и паладинов.
	AI_Output(self,other,"DIA_Pyrokar_WASISTIRDORATH_11_05");	//Было бы несложно уничтожить и оставшиеся два храма, чтобы избавить землю от зла навсегда...
	AI_Output(self,other,"DIA_Pyrokar_WASISTIRDORATH_11_06");	//... но после того как пал второй храм, они просто растворились.
	AI_Output(other,self,"DIA_Pyrokar_WASISTIRDORATH_15_07");	//(насмешливо) Растворился. Целый храм. Да, точно.
	AI_Output(self,other,"DIA_Pyrokar_WASISTIRDORATH_11_08");	//Не смейся. Ситуация серьезная. Чертоги Ирдората действительно восстановили свою силу, и теперь врага будет победить очень трудно.
	AI_Output(self,other,"DIA_Pyrokar_WASISTIRDORATH_11_09");	//Поэтому, сначала ты должен найти этот храм, и я думаю, это будет твоя следующая и самая тяжелая задача.
	AI_Output(other,self,"DIA_Pyrokar_WASISTIRDORATH_15_10");	//Посмотрим.
	b_logentry(TOPIC_BUCHHALLENVONIRDORATH,"Согласно Пирокару, Чертоги Ирдората - это забытый храм вызова бога Белиара. Я должен найти этот храм.");
};


instance DIA_PYROKAR_BUCHIRDORATH(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 54;
	condition = dia_pyrokar_buchirdorath_condition;
	information = dia_pyrokar_buchirdorath_info;
	description = "Книга Ксардаса, которую считали потерянной - где она?";
};


func int dia_pyrokar_buchirdorath_condition()
{
	if((KAPITEL == 5) && (ITWR_HALLSOFIRDORATHISOPEN == FALSE) && Npc_KnowsInfo(other,dia_pyrokar_wasistirdorath))
	{
		return TRUE;
	};
};

func void dia_pyrokar_buchirdorath_info()
{
	AI_Output(other,self,"DIA_Pyrokar_BUCHIRDORATH_15_00");	//Книга Ксардаса, которую считали потерянной - где она?
	AI_Output(self,other,"DIA_Pyrokar_BUCHIRDORATH_11_01");	//Я ожидал, что ты спросишь это. Но, боюсь, она будет бесполезной для тебя.
	AI_Output(self,other,"DIA_Pyrokar_BUCHIRDORATH_11_02");	//Она закрыта при помощи магии. Я отнес ее в один из наших подвалов, но сколько мы не пытались открыть ее - все тщетно.
	AI_Output(self,other,"DIA_Pyrokar_BUCHIRDORATH_11_03");	//Этот проклятый Ксардас сыграл с нами грязную шутку.
	AI_Output(other,self,"DIA_Pyrokar_BUCHIRDORATH_15_04");	//Могу я увидеть эту книгу?
	AI_Output(self,other,"DIA_Pyrokar_BUCHIRDORATH_11_05");	//Будь моим гостем. Но я представить себе не могу, что тебе удастся преуспеть там, где потерпели поражение величайшие маги нашего монастыря.
	AI_Output(self,other,"DIA_Pyrokar_BUCHIRDORATH_11_06");	//Но все же ты можешь попытаться, Таламон не будет препятствовать тебе.
	b_logentry(TOPIC_BUCHHALLENVONIRDORATH,"Книга Ксардаса 'ЧЕРТОГИ ИРДОРАТА' находится в нижних подвалах монастыря. Ее охраняет Таламон. Маги не смогли открыть эту книгу. Она закрыта на при помощи магии и они обвиняют в этом Ксардаса.");
	PYROKAR_LETYOUPASSTALAMON = TRUE;
};


instance DIA_PYROKAR_IRDORATHBOOKOPEN(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 3;
	condition = dia_pyrokar_irdorathbookopen_condition;
	information = dia_pyrokar_irdorathbookopen_info;
	description = "Я смог открыть книгу Ксардаса.";
};


func int dia_pyrokar_irdorathbookopen_condition()
{
	if((ITWR_HALLSOFIRDORATHISOPEN == TRUE) && (KAPITEL == 5))
	{
		return TRUE;
	};
};

func void dia_pyrokar_irdorathbookopen_info()
{
	AI_Output(other,self,"DIA_Pyrokar_IRDORATHBOOKOPEN_15_00");	//Я смог открыть книгу Ксардаса.
	AI_Output(self,other,"DIA_Pyrokar_IRDORATHBOOKOPEN_11_01");	//Что?! Как у тебя это получилось? Это все сведет меня с ума!
	Info_ClearChoices(dia_pyrokar_irdorathbookopen);
	Info_AddChoice(dia_pyrokar_irdorathbookopen,"Ксардас рассказал мне секрет.",dia_pyrokar_irdorathbookopen_xardas);
	Info_AddChoice(dia_pyrokar_irdorathbookopen,"Просто слепая удача, я думаю.",dia_pyrokar_irdorathbookopen_glueck);
};

func void dia_pyrokar_irdorathbookopen_glueck()
{
	AI_Output(other,self,"DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_15_00");	//Просто слепая удача, я думаю.
	AI_Output(self,other,"DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_01");	//Не говори чепухи. Удача!
	AI_Output(self,other,"DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_02");	//Если даже я не смог открыть эту книгу, а затем приходит кто-то вроде тебя и играючи открывает ее...
	AI_Output(self,other,"DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_03");	//... это наводит меня на грустные размышления...
	AI_Output(self,other,"DIA_Pyrokar_IRDORATHBOOKOPEN_glueck_11_04");	//Ладно. Так как ты, очевидно, единственный, кто смог открыть эту книгу, то я, пожалуй, позволю тебе держать ее у себя. По крайней мере, пока мы не разрешили этот кризис.
	b_giveplayerxp(XP_AMBIENT);
	Info_ClearChoices(dia_pyrokar_irdorathbookopen);
};

func void dia_pyrokar_irdorathbookopen_xardas()
{
	AI_Output(other,self,"DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas_15_00");	//Ксардас рассказал мне секрет.
	AI_Output(self,other,"DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas_11_01");	//Ах, вот оно что. Как интересно. Мне остается только надеяться, что пагубное влияние Ксардаса не отравит твою душу.
	AI_Output(self,other,"DIA_Pyrokar_IRDORATHBOOKOPEN_Xardas_11_02");	//Я предостерегаю тебя. Не поддавайся на уловки этого старого дьявола. Ты можешь пожалеть об этом.
	b_giveplayerxp(XP_AMBIENT);
	Info_ClearChoices(dia_pyrokar_irdorathbookopen);
};


instance DIA_PYROKAR_GEHEIMEBIBLIOTHEK(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 3;
	condition = dia_pyrokar_geheimebibliothek_condition;
	information = dia_pyrokar_geheimebibliothek_info;
	description = "В этой книге упоминается секретная библиотека.";
};


func int dia_pyrokar_geheimebibliothek_condition()
{
	if((ITWR_SCREADSHALLSOFIRDORATH == TRUE) && (KAPITEL == 5) && (MIS_SCKNOWSWAYTOIRDORATH == FALSE) && Npc_KnowsInfo(other,dia_pyrokar_irdorathbookopen))
	{
		return TRUE;
	};
};

func void dia_pyrokar_geheimebibliothek_info()
{
	AI_Output(other,self,"DIA_Pyrokar_GEHEIMEBIBLIOTHEK_15_00");	//В этой книге упоминается секретная библиотека.
	AI_Output(self,other,"DIA_Pyrokar_GEHEIMEBIBLIOTHEK_11_01");	//О чем это ты?
	AI_Output(other,self,"DIA_Pyrokar_GEHEIMEBIBLIOTHEK_15_02");	//О библиотеке, находящейся под этими стенами. Тебе это ни о чем не говорит?
	AI_Output(self,other,"DIA_Pyrokar_GEHEIMEBIBLIOTHEK_11_03");	//Нет. Где эта библиотека должна быть, ты сказал?
	AI_Output(other,self,"DIA_Pyrokar_GEHEIMEBIBLIOTHEK_15_04");	//Понятно. Ты ничего не знаешь о ней. Ммм.
	b_logentry(TOPIC_BUCHHALLENVONIRDORATH,"Пирокар ничего не знает о тайной библиотеке. Похоже, только Ксардас бывал в ней.");
};


instance DIA_PYROKAR_SCKNOWSWAYTOIRDORATH(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 2;
	condition = dia_pyrokar_scknowswaytoirdorath_condition;
	information = dia_pyrokar_scknowswaytoirdorath_info;
	description = "Я знаю, где нужно искать Чертоги Ирдората.";
};


func int dia_pyrokar_scknowswaytoirdorath_condition()
{
	if((KAPITEL == 5) && (MIS_SCKNOWSWAYTOIRDORATH == TRUE) && Npc_KnowsInfo(other,dia_pyrokar_irdorathbookopen))
	{
		return TRUE;
	};
};

func void dia_pyrokar_scknowswaytoirdorath_info()
{
	AI_Output(other,self,"DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_15_00");	//Я знаю, где нужно искать Чертоги Ирдората.
	AI_Output(other,self,"DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_15_01");	//Этот храм находится на острове. Я нашел морскую карту, которая покажет путь.
	AI_Output(self,other,"DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_02");	//Это великолепно. Тогда тебе понадобится корабль и команда, чтобы добраться до этого врага
	AI_Output(self,other,"DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_03");	//Но помни, что ты должен хорошо подготовиться, если хочешь уничтожить Повелителя Ирдората.
	AI_Output(other,self,"DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_15_04");	//Где мне найти команду?
	AI_Output(self,other,"DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_05");	//Твоя команда должна состоять из людей, которым ты можешь доверять.
	AI_Output(self,other,"DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_06");	//Поговори со своими друзьями и подумай о том, кто может быть полезен тебе на этом острове.
	AI_Output(self,other,"DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_07");	//Тебе там, наверняка, понадобится маг. Но, к сожалению, я не могу выделить ни одного человека из монастыря.
	AI_Output(self,other,"DIA_Pyrokar_SCKNOWSWAYTOIRDORATH_11_08");	//Тебе придется поискать мага за пределами наших стен.
};


instance DIA_PYROKAR_SCWILLJORGEN(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 59;
	condition = dia_pyrokar_scwilljorgen_condition;
	information = dia_pyrokar_scwilljorgen_info;
	description = "Йорген - опытный моряк.";
};


func int dia_pyrokar_scwilljorgen_condition()
{
	if(Npc_KnowsInfo(other,dia_jorgen_home) && Npc_KnowsInfo(other,dia_pyrokar_scknowswaytoirdorath) && (KAPITEL == 5))
	{
		return TRUE;
	};
};

func void dia_pyrokar_scwilljorgen_info()
{
	AI_Output(other,self,"DIA_Pyrokar_SCWILLJORGEN_15_00");	//Йорген - опытный моряк. Он мог бы помочь мне добраться до Острова Ирдорат.
	AI_Output(self,other,"DIA_Pyrokar_SCWILLJORGEN_11_01");	//Боюсь, это будет не так уж просто.
	AI_Output(self,other,"DIA_Pyrokar_SCWILLJORGEN_11_02");	//Он попросился работать в нашем монастыре. Но он не платил вступительного взноса и не привел овцы.
	AI_Output(self,other,"DIA_Pyrokar_SCWILLJORGEN_11_03");	//Йорген должен сначала закончить свою работу, а потом ты можешь забрать его, если пожелаешь.
	AI_Output(other,self,"DIA_Pyrokar_SCWILLJORGEN_15_04");	//Сколько времени это займет?
	AI_Output(self,other,"DIA_Pyrokar_SCWILLJORGEN_11_05");	//Он в первый же день съел целую гору продуктов. Этой провизии обычному послушнику хватило бы на три недели.
	AI_Output(self,other,"DIA_Pyrokar_SCWILLJORGEN_11_06");	//Поэтому я не могу отпустить его, пока он не отработает три месяца в наших садах.
};


instance DIA_PYROKAR_MACHDTFREI(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 59;
	condition = dia_pyrokar_machdtfrei_condition;
	information = dia_pyrokar_machdtfrei_info;
	description = "А что можно сделать, чтобы я мог забрать Йоргена с собой СЕЙЧАС?";
};


func int dia_pyrokar_machdtfrei_condition()
{
	if(Npc_KnowsInfo(other,dia_pyrokar_scwilljorgen) && (KAPITEL == 5))
	{
		return TRUE;
	};
};

func void dia_pyrokar_machdtfrei_info()
{
	AI_Output(other,self,"DIA_Pyrokar_MACHDTFREI_15_00");	//А что можно сделать, чтобы я мог забрать Йоргена с собой СЕЙЧАС?
	AI_Output(self,other,"DIA_Pyrokar_MACHDTFREI_11_01");	//Ммм. Действительно, есть кое-что, что ты мог бы сделать для меня. Твои хорошие отношения с Ксардасом могли бы помочь тебе в этом.
	AI_Output(self,other,"DIA_Pyrokar_MACHDTFREI_11_02");	//Мое внимание привлекло то, что последние несколько дней в его башне творятся странные вещи.
	AI_Output(self,other,"DIA_Pyrokar_MACHDTFREI_11_03");	//Много людей слышало громкие вопли в ночи, исходящие оттуда, и видели странный свет, пляшущий над этой башней.
	AI_Output(self,other,"DIA_Pyrokar_MACHDTFREI_11_04");	//Только этого нам еще не хватало. Иди, проверь что там происходит и прекрати это безобразие.
	AI_Output(self,other,"DIA_Pyrokar_MACHDTFREI_11_05");	//Тогда ты сможешь забрать Йоргена.
	MIS_PYROKARCLEARDEMONTOWER = LOG_RUNNING;
	Log_CreateTopic(TOPIC_PYROKARCLEARDEMONTOWER,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_PYROKARCLEARDEMONTOWER,LOG_RUNNING);
	b_logentry(TOPIC_PYROKARCLEARDEMONTOWER,"Странные вещи творятся с башней Ксардаса. Если я соберусь выяснить, что там происходит, я могу взять с собой Йоргена.");
};


instance DIA_PYROKAR_DTCLEARED(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 59;
	condition = dia_pyrokar_dtcleared_condition;
	information = dia_pyrokar_dtcleared_info;
	description = "Башня Ксардаса больше никого не будет беспокоить.";
};


func int dia_pyrokar_dtcleared_condition()
{
	if(Npc_IsDead(xardas_dt_demon1) && Npc_IsDead(xardas_dt_demon2) && Npc_IsDead(xardas_dt_demon3) && Npc_IsDead(xardas_dt_demon4) && Npc_IsDead(xardas_dt_demon5) && Npc_IsDead(xardas_dt_demonlord) && (MIS_PYROKARCLEARDEMONTOWER == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_pyrokar_dtcleared_info()
{
	AI_Output(other,self,"DIA_Pyrokar_DTCLEARED_15_00");	//Башня Ксардаса больше никого не будет беспокоить.
	AI_Output(self,other,"DIA_Pyrokar_DTCLEARED_11_01");	//Так что там было... нет, подожди, я не хочу даже знать.
	AI_Output(self,other,"DIA_Pyrokar_DTCLEARED_11_02");	//Если Йорген тебе все еще нужен, можешь забрать его из монастыря.
	AI_Output(self,other,"DIA_Pyrokar_DTCLEARED_11_03");	//Да хранит тебя Иннос.
	MIS_PYROKARCLEARDEMONTOWER = LOG_SUCCESS;
	b_giveplayerxp(XP_PYROKARCLEARDEMONTOWER);
};


var int pyro_gives_aura;

instance DIA_PYROKAR_AMULETTOFDEATH(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 57;
	condition = dia_pyrokar_amulettofdeath_condition;
	information = dia_pyrokar_amulettofdeath_info;
	permanent = TRUE;
	description = "В пророчестве упоминается священная Аура Инноса.";
};


func int dia_pyrokar_amulettofdeath_condition()
{
	if((PLAYERGETSAMULETTOFDEATH == TRUE) && (PYRO_GIVES_AURA == FALSE))
	{
		return TRUE;
	};
};

func void dia_pyrokar_amulettofdeath_info()
{
	AI_Output(other,self,"DIA_Pyrokar_AmulettofDeath_15_00");	//В пророчестве упоминается священная Аура Инноса.
	AI_Output(self,other,"DIA_Pyrokar_AmulettofDeath_11_01");	//Аура Инноса - это амулет, который могут носить только величайшие маги всех времен и народов.
	Info_ClearChoices(dia_pyrokar_amulettofdeath);
	Info_AddChoice(dia_pyrokar_amulettofdeath,DIALOG_BACK,dia_pyrokar_amulettofdeath_back);
	Info_AddChoice(dia_pyrokar_amulettofdeath,"Могу я взять его?",dia_pyrokar_amulettofdeath_canhaveit);
	Info_AddChoice(dia_pyrokar_amulettofdeath,"Что делает этот амулет?",dia_pyrokar_amulettofdeath_amulett);
};

func void dia_pyrokar_amulettofdeath_back()
{
	Info_ClearChoices(dia_pyrokar_amulettofdeath);
};

func void dia_pyrokar_amulettofdeath_canhaveit()
{
	AI_Output(other,self,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_15_00");	//Могу я взять его?
	AI_Output(self,other,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_11_01");	//Что? Что ты с ним собираешься делать?
	AI_Output(other,self,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_15_02");	//Выступить против драконов.
	AI_Output(self,other,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_11_03");	//Да, конечно. Я дам тебе этот амулет, но обращайся с ним бережно.
	AI_Output(other,self,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_15_04");	//Да, конечно.
	AI_Output(self,other,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_11_05");	//Я не хочу, чтобы мне потом пришлось выкупать его назад у какого-нибудь торговца.
	AI_Output(self,other,"DIA_Pyrokar_AmulettofDeath_CanHaveIt_11_06");	//Используй его разумно, и да хранит тебя Иннос.
	CreateInvItems(self,itam_amulettofdeath_mis,1);
	b_giveinvitems(self,other,itam_amulettofdeath_mis,1);
	PYRO_GIVES_AURA = TRUE;
};

func void dia_pyrokar_amulettofdeath_amulett()
{
	AI_Output(other,self,"DIA_Pyrokar_AmulettofDeath_Amulett_15_00");	//Что делает этот амулет?
	AI_Output(self,other,"DIA_Pyrokar_AmulettofDeath_Amulett_11_01");	//Говорят, что Иннос самолично выковал его и передал человечеству.
	AI_Output(self,other,"DIA_Pyrokar_AmulettofDeath_Amulett_11_02");	//Он защищает своего владельца от всех типов урона.
};


instance DIA_PYROKAR_POTIONOFDEATH(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 57;
	condition = dia_pyrokar_potionofdeath_condition;
	information = dia_pyrokar_potionofdeath_info;
	permanent = TRUE;
	description = "Что такое Слезы Инноса?";
};


func int dia_pyrokar_potionofdeath_condition()
{
	if(Npc_HasItems(other,itpo_potionofdeath_01_mis))
	{
		return TRUE;
	};
};

func void dia_pyrokar_potionofdeath_info()
{
	AI_Output(other,self,"DIA_Pyrokar_PotionofDeath_15_00");	//Что такое Слезы Инноса?
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_11_01");	//Слезы Инноса - это не более чем старые детские сказки. В них говорится, как в начале времен разгорелась битва между Инносом и Белиаром.
	Info_ClearChoices(dia_pyrokar_potionofdeath);
	Info_AddChoice(dia_pyrokar_potionofdeath,"Понимаю.",dia_pyrokar_potionofdeath_aha);
	Info_AddChoice(dia_pyrokar_potionofdeath,"Я нашел это зелье.",dia_pyrokar_potionofdeath_potion);
};

func void dia_pyrokar_potionofdeath_aha()
{
	AI_Output(other,self,"DIA_Pyrokar_PotionofDeath_Aha_15_00");	//Понимаю.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Aha_11_01");	//Я не знаю, понимаешь ли ты всю серьезность нашей ситуации, но я очень сомневаюсь, что нашего врага можно победить при помощи детских сказок.
	Info_ClearChoices(dia_pyrokar_potionofdeath);
};

func void dia_pyrokar_potionofdeath_potion()
{
	AI_Output(other,self,"DIA_Pyrokar_PotionofDeath_Potion_15_00");	//Я нашел это зелье.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Potion_11_01");	//Этого не может быть! Не могу поверить в это!
	AI_Output(other,self,"DIA_Pyrokar_PotionofDeath_Potion_15_02");	//В чем дело?
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Potion_11_03");	//Если это действительно настоящие Слезы Инноса, то...
	AI_Output(other,self,"DIA_Pyrokar_PotionofDeath_Potion_15_04");	//(прерывает) Вряд ли.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Potion_11_05");	//Не прерывай меня. Если это действительно настоящие Слезы Инноса, то мы получили грозное оружие против врага.
	Info_ClearChoices(dia_pyrokar_potionofdeath);
	Info_AddChoice(dia_pyrokar_potionofdeath,DIALOG_BACK,dia_pyrokar_potionofdeath_back);
	Info_AddChoice(dia_pyrokar_potionofdeath,"Так что такое эти Слезы Инноса?",dia_pyrokar_potionofdeath_teardrops);
	Info_AddChoice(dia_pyrokar_potionofdeath,"Что ты имеешь в виду под 'оружием'?",dia_pyrokar_potionofdeath_weapon);
};

func void dia_pyrokar_potionofdeath_back()
{
	Info_ClearChoices(dia_pyrokar_potionofdeath);
};

func void dia_pyrokar_potionofdeath_teardrops()
{
	AI_Output(other,self,"DIA_Pyrokar_PotionofDeath_Teardrops_15_00");	//Так что такое эти Слезы Инноса?
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Teardrops_11_01");	//Когда Иннос осознал, что ему придется сражаться с Белиаром, своим собственным братом, чтобы сохранить созданное, его печаль была велика.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Teardrops_11_02");	//Слезы потекли из глаз его и упали в наш мир. Их было много, ибо сердце его было переполнено печалью, и плакал он 13 лет.
	AI_Output(other,self,"DIA_Pyrokar_PotionofDeath_Teardrops_15_03");	//Ближе к делу.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Teardrops_11_04");	//Люди, нашедшие его слезы и попробовавшие их, обретали сверхъестественную силу и ясность ума. Они признавали мудрость Инноса, Создателя, и начинали служить ему.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Teardrops_11_05");	//Они стали первыми членами Братства Огня. Эти слезы давали им силу, мужество и мудрость. Но это было давным-давно, и прошло уже более 250 лет с тех пор, как последний раз видели Слезы Инноса.
	Info_ClearChoices(dia_pyrokar_potionofdeath);
};

func void dia_pyrokar_potionofdeath_weapon()
{
	AI_Output(other,self,"DIA_Pyrokar_PotionofDeath_Weapon_15_00");	//Что ты имеешь в виду под оружием?
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_01");	//Легенда гласит, что под воздействием этой субстанции, воины Инноса могли вершить почти сверхъестественные дела.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_02");	//Им была неведома усталость, и они обладали силой двух медведей.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_03");	//Величайшие героические подвиги прошлых дней стали возможны только благодаря Слезам Инноса.
	AI_Output(other,self,"DIA_Pyrokar_PotionofDeath_Weapon_15_04");	//Понятно.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_05");	//Но эти слезы могут также приносить страдания и смерть. Только члены нашего ордена могут пить их.
	AI_Output(self,other,"DIA_Pyrokar_PotionofDeath_Weapon_11_06");	//Любого другого - даже паладина нашего Владыки - ожидает мучительная смерть.
	Npc_RemoveInvItems(hero,itpo_potionofdeath_01_mis,1);
	CreateInvItems(hero,itpo_potionofdeath_02_mis,1);
};


instance DIA_PYROKAR_KAP6_EXIT(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 999;
	condition = dia_pyrokar_kap6_exit_condition;
	information = dia_pyrokar_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_pyrokar_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_pyrokar_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_PYROKAR_PICKPOCKET(C_INFO)
{
	npc = kdf_500_pyrokar;
	nr = 900;
	condition = dia_pyrokar_pickpocket_condition;
	information = dia_pyrokar_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_120;
};


func int dia_pyrokar_pickpocket_condition()
{
	return c_beklauen(108,550);
};

func void dia_pyrokar_pickpocket_info()
{
	Info_ClearChoices(dia_pyrokar_pickpocket);
	Info_AddChoice(dia_pyrokar_pickpocket,DIALOG_BACK,dia_pyrokar_pickpocket_back);
	Info_AddChoice(dia_pyrokar_pickpocket,DIALOG_PICKPOCKET,dia_pyrokar_pickpocket_doit);
};

func void dia_pyrokar_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_pyrokar_pickpocket);
};

func void dia_pyrokar_pickpocket_back()
{
	Info_ClearChoices(dia_pyrokar_pickpocket);
};

