
instance DIA_DAR_EXIT(C_INFO)
{
	npc = sld_810_dar;
	nr = 999;
	condition = dia_dar_exit_condition;
	information = dia_dar_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_dar_exit_condition()
{
	if(KAPITEL < 3)
	{
		return TRUE;
	};
};

func void dia_dar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DAR_HALLO(C_INFO)
{
	npc = sld_810_dar;
	nr = 1;
	condition = dia_dar_hallo_condition;
	information = dia_dar_hallo_info;
	permanent = FALSE;
	description = "Что ты куришь?";
};


func int dia_dar_hallo_condition()
{
	return TRUE;
};

func void dia_dar_hallo_info()
{
	AI_Output(other,self,"DIA_Dar_Hallo_15_00");	//Что ты куришь?
	AI_Output(self,other,"DIA_Dar_Hallo_03_01");	//Хочешь затянуться?
	Info_ClearChoices(dia_dar_hallo);
	Info_AddChoice(dia_dar_hallo,"Нет.",dia_dar_hallo_nein);
	Info_AddChoice(dia_dar_hallo,"Конечно.",dia_dar_hallo_ja);
};

func void dia_dar_hallo_ja()
{
	AI_Output(other,self,"DIA_Dar_Hallo_Ja_15_00");	//Конечно.
	b_giveinvitems(self,other,itmi_joint,1);
	b_useitem(other,itmi_joint);
	AI_Output(self,other,"DIA_Dar_Hallo_Ja_03_01");	//Неплохо, да?
	AI_Output(other,self,"DIA_Dar_Hallo_Ja_15_02");	//Где ты взял эту траву?
	CreateInvItem(self,itmi_joint);
	b_useitem(self,itmi_joint);
	AI_Output(self,other,"DIA_Dar_Hallo_Ja_03_03");	//(усмехается) У меня свои источники.
	Info_ClearChoices(dia_dar_hallo);
};

func void dia_dar_hallo_nein()
{
	AI_Output(other,self,"DIA_Dar_Hallo_Nein_15_00");	//Нет.
	Info_ClearChoices(dia_dar_hallo);
};


var int dar_einmal;

instance DIA_DAR_PERM(C_INFO)
{
	npc = sld_810_dar;
	nr = 2;
	condition = dia_dar_perm_condition;
	information = dia_dar_perm_info;
	permanent = TRUE;
	description = "Ты что-нибудь делаешь еще, кроме как куришь?";
};


func int dia_dar_perm_condition()
{
	if(Npc_KnowsInfo(other,dia_dar_hallo))
	{
		return TRUE;
	};
};

func void dia_dar_perm_info()
{
	AI_Output(other,self,"DIA_Dar_PERM_15_00");	//Ты что-нибудь делаешь еще, кроме как куришь?
	if((DAR_LOSTAGAINSTCIPHER == TRUE) && (DAR_EINMAL == FALSE))
	{
		AI_Output(self,other,"DIA_Dar_PERM_03_01");	//(саркастически) Иногда я позволяю всяким мстительным болотным наркоманам задать мне взбучку...
		DAR_EINMAL = TRUE;
	}
	else
	{
		AI_Output(self,other,"DIA_Dar_PERM_03_02");	//Сейчас нет.
	};
};


instance DIA_DAR_WANNAJOIN(C_INFO)
{
	npc = sld_810_dar;
	nr = 3;
	condition = dia_dar_wannajoin_condition;
	information = dia_dar_wannajoin_info;
	permanent = FALSE;
	description = "Я хочу присоединиться к наемникам. Ты не возражаешь?";
};


func int dia_dar_wannajoin_condition()
{
	if(Npc_KnowsInfo(other,dia_dar_hallo) && (other.guild == GIL_NONE) && (DAR_LOSTAGAINSTCIPHER == FALSE))
	{
		return TRUE;
	};
};

func void dia_dar_wannajoin_info()
{
	AI_Output(other,self,"DIA_Dar_WannaJoin_15_00");	//Я хочу присоединиться к наемникам. Ты не возражаешь?
	AI_Output(self,other,"DIA_Dar_WannaJoin_03_01");	//Мне все равно.
};


instance DIA_DAR_DUDIEB(C_INFO)
{
	npc = sld_810_dar;
	nr = 4;
	condition = dia_dar_dudieb_condition;
	information = dia_dar_dudieb_info;
	permanent = FALSE;
	description = "Сифер сказал мне, что кто-то украл у него тюк болотной травы...";
};


func int dia_dar_dudieb_condition()
{
	if(Npc_KnowsInfo(other,dia_cipher_tradewhat) && (MIS_CIPHER_PAKET == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_dar_dudieb_info()
{
	AI_Output(other,self,"DIA_Dar_DuDieb_15_00");	//Сифер сказал мне, что кто-то украл у него тюк болотной травы...
	AI_Output(self,other,"DIA_Dar_DuDieb_03_01");	//(смеется идиотским приглушенным смехом)
	AI_Output(other,self,"DIA_Dar_DuDieb_15_02");	//Ты ничего не знаешь об этом?
	AI_Output(self,other,"DIA_Dar_DuDieb_03_03");	//(очень коротко) Нет.
	DAR_VERDACHT = TRUE;
};


instance DIA_DAR_WOPAKET(C_INFO)
{
	npc = sld_810_dar;
	nr = 4;
	condition = dia_dar_wopaket_condition;
	information = dia_dar_wopaket_info;
	permanent = TRUE;
	description = "Где тюк?";
};


func int dia_dar_wopaket_condition()
{
	if(Npc_KnowsInfo(other,dia_dar_dudieb) && (DAR_DIEB == FALSE) && (MIS_CIPHER_PAKET == LOG_RUNNING))
	{
		return TRUE;
	};
};

func void dia_dar_wopaket_info()
{
	AI_Output(other,self,"DIA_Dar_WoPaket_15_00");	//(угрожающе) Где тюк?
	if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST)
	{
		AI_Output(self,other,"DIA_Dar_WoPaket_03_01");	//Хорошо, хорошо, хорошо. Я продал его какому-то идиоту в городе.
		AI_Output(self,other,"DIA_Dar_WoPaket_03_02");	//Это было в гавани. Я не помню, как он выглядел.
		AI_Output(other,self,"DIA_Dar_WoPaket_15_03");	//Может, тебе нужна еще одна хорошая встряска?
		AI_Output(self,other,"DIA_Dar_WoPaket_03_04");	//Если честно, я был обкуренный в хлам. Я совершенно не представляю, как этот парень выглядел.
		AI_Output(self,other,"DIA_Dar_WoPaket_03_05");	//Это было в гавани около кораблестроителей. Это все, что я помню.
		DAR_DIEB = TRUE;
		b_logentry(TOPIC_CIPHERPAKET,"Дар признал, что украл тюк с травой. Он продал ее в портовом квартале Хориниса, около кораблестроителей.");
	}
	else
	{
		AI_Output(self,other,"DIA_Dar_WoPaket_03_06");	//Что я могу знать?
	};
};


instance DIA_DAR_AUFSMAUL(C_INFO)
{
	npc = sld_810_dar;
	nr = 5;
	condition = dia_dar_aufsmaul_condition;
	information = dia_dar_aufsmaul_info;
	permanent = FALSE;
	description = "Я вышибу эту информацию из тебя!";
};


func int dia_dar_aufsmaul_condition()
{
	if(Npc_KnowsInfo(other,dia_dar_dudieb) && (DAR_DIEB == FALSE) && (self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] != FIGHT_LOST))
	{
		return TRUE;
	};
};

func void dia_dar_aufsmaul_info()
{
	AI_Output(other,self,"DIA_Dar_AufsMaul_15_00");	//Я вышибу эту информацию из тебя!
	AI_Output(self,other,"DIA_Dar_AufsMaul_03_01");	//Расслабься. Я слишком обкурился, чтобы драться с тобой!
	b_giveinvitems(self,other,itmi_joint,1);
	AI_Output(self,other,"DIA_Dar_AufsMaul_03_02");	//Вот, затянись!
};


instance DIA_DAR_KAMERADENSCHWEIN(C_INFO)
{
	npc = sld_810_dar;
	nr = 1;
	condition = dia_dar_kameradenschwein_condition;
	information = dia_dar_kameradenschwein_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_dar_kameradenschwein_condition()
{
	if(DAR_LOSTAGAINSTCIPHER == TRUE)
	{
		self.aivar[AIV_LASTFIGHTCOMMENT] = FALSE;
		return TRUE;
	};
};

func void dia_dar_kameradenschwein_info()
{
	AI_Output(self,other,"DIA_Dar_Kameradenschwein_03_00");	//Трепач! Ты сказал Сиферу, что я взял его траву!
	if(Npc_KnowsInfo(other,dia_dar_wannajoin) && (other.guild == GIL_NONE))
	{
		AI_Output(self,other,"DIA_Dar_Kameradenschwein_03_01");	//Я ни за что не проголосую за тебя.
	};
};


instance DIA_DAR_PILZTABAK(C_INFO)
{
	npc = sld_810_dar;
	nr = 6;
	condition = dia_dar_pilztabak_condition;
	information = dia_dar_pilztabak_info;
	permanent = FALSE;
	description = "Ты когда-нибудь пробовал грибной табак?";
};


func int dia_dar_pilztabak_condition()
{
	if(Npc_HasItems(other,ItMi_PilzTabak) && Npc_KnowsInfo(other,DIA_Dar_Hallo))
	{
		return TRUE;
	};
};

func void dia_dar_pilztabak_info()
{
	AI_Output(other,self,"DIA_Dar_Pilztabak_15_00");	//Ты когда-нибудь пробовал грибной табак?
	AI_Output(self,other,"DIA_Dar_Pilztabak_03_01");	//Звучит интересно. Дай его сюда.
	b_giveinvitems(other,self,itmi_pilztabak,1);
	Npc_RemoveInvItem(self,ItMi_PilzTabak);
	AI_Output(self,other,"DIA_Dar_Pilztabak_03_02");	//Так, попробуем...
	CreateInvItem(self,itmi_joint);
	b_useitem(self,itmi_joint);
	AI_Output(self,other,"DIA_Dar_Pilztabak_03_03");	//Ты когда-нибудь курил его САМ?
	AI_Output(other,self,"DIA_Dar_Pilztabak_15_04");	//Ну...
	CreateInvItem(self,itmi_joint);
	b_useitem(self,itmi_joint);
	AI_Output(self,other,"DIA_Dar_Pilztabak_03_05");	//Курил или нет?
	AI_Output(other,self,"DIA_Dar_Pilztabak_15_06");	//Мне было некогда...
	AI_Output(self,other,"DIA_Dar_Pilztabak_03_07");	//Ох, черт!
	AI_PlayAni(self,"T_MAGRUN_2_HEASHOOT");
	AI_Output(self,other,"DIA_Dar_Pilztabak_03_08");	//Святой Робар!
	AI_PlayAni(self,"T_HEASHOOT_2_STAND");
	AI_Output(self,other,"DIA_Dar_Pilztabak_03_09");	//Это дерьмо слишком крутое! Даже и не вздумай пробовать!
	b_giveplayerxp(XP_AMBIENT);
};


instance DIA_DAR_KAP3_EXIT(C_INFO)
{
	npc = sld_810_dar;
	nr = 999;
	condition = dia_dar_kap3_exit_condition;
	information = dia_dar_kap3_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_dar_kap3_exit_condition()
{
	if(KAPITEL == 3)
	{
		return TRUE;
	};
};

func void dia_dar_kap3_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DAR_KAP4_EXIT(C_INFO)
{
	npc = sld_810_dar;
	nr = 999;
	condition = dia_dar_kap4_exit_condition;
	information = dia_dar_kap4_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_dar_kap4_exit_condition()
{
	if(KAPITEL == 4)
	{
		return TRUE;
	};
};

func void dia_dar_kap4_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DAR_ORCRING(C_INFO)
{
	npc = sld_810_dar;
	nr = 4;
	condition = dia_dar_orcring_condition;
	information = dia_dar_orcring_info;
	description = "Похоже, часть наемников исчезла.";
};


func int dia_dar_orcring_condition()
{
	if(KAPITEL >= 4)
	{
		return TRUE;
	};
};

func void dia_dar_orcring_info()
{
	AI_Output(other,self,"DIA_Dar_ORCRING_15_00");	//Похоже, часть наемников исчезла.
	AI_Output(self,other,"DIA_Dar_ORCRING_03_01");	//Конечно. Это так. Сильвио сейчас очень далеко, и он увел с собой половину людей.
	AI_Output(self,other,"DIA_Dar_ORCRING_03_02");	//Мне плевать. У меня будет больше шансов показать себя и заслужить уважение Ли. Для этого нужно сделать что-нибудь громкое.
	AI_Output(self,other,"DIA_Dar_ORCRING_03_03");	//Если я смогу принести доказательство, что действительно крутой парень, возможно, я даже смогу стать одним из телохранителей Ли.
	Info_ClearChoices(dia_dar_orcring);
	Info_AddChoice(dia_dar_orcring,"Меня это не интересует.",dia_dar_orcring_no);
	Info_AddChoice(dia_dar_orcring,"Крутой парень? Ты?",dia_dar_orcring_necken);
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (hero.guild == GIL_KDF))
	{
		Info_AddChoice(dia_dar_orcring,"Как это должно выглядеть?",dia_dar_orcring_wie);
	};
};

func void dia_dar_orcring_necken()
{
	AI_Output(other,self,"DIA_Dar_ORCRING_necken_15_00");	//Крутой парень? Ты?
	AI_Output(self,other,"DIA_Dar_ORCRING_necken_03_01");	//(злобно) Ох, ладно, заткнись. Ты-то вообще кто такой?
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Dar_ORCRING_necken_03_02");	//Какой-то надутый простофиля из города. Тебе вообще ничего не светит.
	};
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Dar_ORCRING_necken_03_03");	//Ты здесь всего пару дней и уже задрал нос выше облаков.
	};
	if(hero.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Dar_ORCRING_necken_03_04");	//Кого ты хочешь напугать этой своей магической чушью? Только не меня.
	};
	if((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL))
	{
		AI_Output(self,other,"DIA_Dar_ORCRING_necken_03_05");	//И даже, если подумать, раскроить твой череп - именно то, что мне нужно, чтобы заслужить уважение Ли и его парней.
		Info_ClearChoices(dia_dar_orcring);
		Info_AddChoice(dia_dar_orcring,"У меня нет времени на эту чушь.",dia_dar_orcring_necken_no);
		Info_AddChoice(dia_dar_orcring,"Ладно. Попробуй.",dia_dar_orcring_necken_schlagen);
	}
	else
	{
		AI_Output(self,other,"DIA_Dar_ORCRING_necken_03_06");	//Ты подожди. Я найду способ произвести впечатление на Ли.
	};
};


var int dar_fightagainstpaladin;

func void dia_dar_orcring_necken_schlagen()
{
	DAR_FIGHTAGAINSTPALADIN = TRUE;
	AI_Output(other,self,"DIA_Dar_ORCRING_necken_schlagen_15_00");	//Ладно. Попробуй.
	AI_Output(self,other,"DIA_Dar_ORCRING_necken_schlagen_03_01");	//Ох, я не могу ждать.
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_NONE,1);
};

func void dia_dar_orcring_necken_no()
{
	AI_Output(other,self,"DIA_Dar_ORCRING_necken_no_15_00");	//У меня нет времени на эту чушь.
	AI_Output(self,other,"DIA_Dar_ORCRING_necken_no_03_01");	//О, да. Ты же рыцарь правосудия, как я мог забыть. Жаль. Я думал, что у тебя больше мужества.
	AI_StopProcessInfos(self);
};

func void dia_dar_orcring_wie()
{
	AI_Output(other,self,"DIA_Dar_ORCRING_wie_15_00");	//Как это должно выглядеть?
	AI_Output(self,other,"DIA_Dar_ORCRING_wie_03_01");	//Я не знаю точно. Какой-нибудь трофей орков вполне подошел бы.
	AI_Output(self,other,"DIA_Dar_ORCRING_wie_03_02");	//Что-нибудь вроде эмблемы лидера орков, ну или что-то вроде. Знамя, нарукавная нашивка или кольцо, ну, ты понял.
	AI_Output(self,other,"DIA_Dar_ORCRING_wie_03_03");	//Я не могу произвести впечатление без этого. Это очевидно.
	Log_CreateTopic(TOPIC_DAR_BRINGORCELITERING,LOG_MISSION);
	Log_SetTopicStatus(TOPIC_DAR_BRINGORCELITERING,LOG_RUNNING);
	b_logentry(TOPIC_DAR_BRINGORCELITERING,"Дар хочет стать важной шишкой в рядах наемников. Он хочет заполучить трофей орков. Знамя, нарукавную нашивку, кольцо, или еще что-нибудь.");
	MIS_DAR_BRINGORCELITERING = LOG_RUNNING;
	Info_ClearChoices(dia_dar_orcring);
};

func void dia_dar_orcring_no()
{
	AI_Output(other,self,"DIA_Dar_ORCRING_no_15_00");	//Меня это не интересует.
	AI_Output(self,other,"DIA_Dar_ORCRING_no_03_01");	//(злобно) Конечно, нет. Я бы очень удивился, если бы это было не так.
	Info_ClearChoices(dia_dar_orcring);
};


instance DIA_DAR_FIGHTAGAINSTPALOVER(C_INFO)
{
	npc = sld_810_dar;
	nr = 4;
	condition = dia_dar_fightagainstpalover_condition;
	information = dia_dar_fightagainstpalover_info;
	important = TRUE;
};


func int dia_dar_fightagainstpalover_condition()
{
	if((DAR_FIGHTAGAINSTPALADIN == TRUE) && ((hero.guild == GIL_MIL) || (hero.guild == GIL_PAL)))
	{
		return TRUE;
	};
};

func void dia_dar_fightagainstpalover_info()
{
	AI_Output(self,other,"DIA_Dar_FIGHTAGAINSTPALOVER_03_00");	//Хорошо, я знаю, что Ли не особенно разозлится, если я опять сцеплюсь с тобой.
	AI_Output(self,other,"DIA_Dar_FIGHTAGAINSTPALOVER_03_01");	//Я не хочу заводить себе здесь врагов. Так что забудем об этом, хорошо?
	b_giveplayerxp(XP_AMBIENT);
	AI_StopProcessInfos(self);
};


instance DIA_DAR_BRINGORCELITERING(C_INFO)
{
	npc = sld_810_dar;
	nr = 4;
	condition = dia_dar_bringorcelitering_condition;
	information = dia_dar_bringorcelitering_info;
	description = "Я принес трофей орков, который ты искал.";
};


func int dia_dar_bringorcelitering_condition()
{
	if((MIS_DAR_BRINGORCELITERING == LOG_RUNNING) && ((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG) || (hero.guild == GIL_KDF)) && Npc_HasItems(other,itri_orcelitering))
	{
		return TRUE;
	};
};

func void dia_dar_bringorcelitering_info()
{
	AI_Output(other,self,"DIA_Dar_BRINGORCELITERING_15_00");	//Я принес трофей орков, который ты искал.
	AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_03_01");	//Что ты там принес мне?
	AI_Output(other,self,"DIA_Dar_BRINGORCELITERING_15_02");	//Кольцо предводителя орков.
	AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_03_03");	//Ух ты, в таком случае... Что ты хочешь за него?
	MIS_DAR_BRINGORCELITERING = LOG_SUCCESS;
	Info_ClearChoices(dia_dar_bringorcelitering);
	Info_AddChoice(dia_dar_bringorcelitering,"Что ты можешь предложить мне?",dia_dar_bringorcelitering_was);
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		Info_AddChoice(dia_dar_bringorcelitering,"Заплати мне золотом.",dia_dar_bringorcelitering_geld);
	};
};

func void dia_dar_bringorcelitering_geld()
{
	AI_Output(other,self,"DIA_Dar_BRINGORCELITERING_geld_15_00");	//Заплати мне золотом.
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_geld_03_01");	//Ммм. 600 золотых монет?
		AI_Output(other,self,"DIA_Dar_BRINGORCELITERING_geld_15_02");	//Что?
	};
	AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_geld_03_03");	//Ладно. Я дам тебе 1200 монет.
	if((hero.guild == GIL_SLD) || (hero.guild == GIL_DJG))
	{
		AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_geld_03_04");	//Забирай их или оставь себе это кольцо.
	};
	Info_ClearChoices(dia_dar_bringorcelitering);
	Info_AddChoice(dia_dar_bringorcelitering,"Этого недостаточно.",dia_dar_bringorcelitering_geld_no);
	Info_AddChoice(DIA_Dar_BRINGORCELITERING,"Договорились. Держи кольцо.",DIA_Dar_BRINGORCELITERING_geld_ok);
};

func void dia_dar_bringorcelitering_geld_ok()
{
	AI_Output(other,self,"DIA_Dar_BRINGORCELITERING_geld_ok_15_00");	//Договорились. Держи кольцо.
	b_giveinvitems(other,self,itri_orcelitering,1);
	AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_geld_ok_03_01");	//Спасибо. Не терпится услышать, что скажут другие об этом.
	CreateInvItems(self,itmi_gold,1200);
	b_giveinvitems(self,other,itmi_gold,1200);
	b_giveplayerxp(XP_DAR_BRINGORCELITERING);
	Info_ClearChoices(dia_dar_bringorcelitering);
};

func void dia_dar_bringorcelitering_geld_no()
{
	AI_Output(other,self,"DIA_Dar_BRINGORCELITERING_geld_no_15_00");	//Этого недостаточно.
	AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_geld_no_03_01");	//А я думаю, что это слишком много. Этот бизнес не нравится мне. Не хочу обидеть.
	Info_ClearChoices(dia_dar_bringorcelitering);
};

func void dia_dar_bringorcelitering_was()
{
	AI_Output(other,self,"DIA_Dar_BRINGORCELITERING_was_15_00");	//Что ты можешь предложить мне?
	AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_was_03_01");	//Ладно, забирай деньги, либо этот амулет, который я... ну, скажем, приобрел недавно.
	AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_was_03_02");	//Он повысит твою ловкость. Я сам испытывал его.
	Info_ClearChoices(dia_dar_bringorcelitering);
	Info_AddChoice(dia_dar_bringorcelitering,"Заплати мне золотом.",dia_dar_bringorcelitering_geld);
	Info_AddChoice(dia_dar_bringorcelitering,"Давай мне амулет.",dia_dar_bringorcelitering_was_am);
};

func void dia_dar_bringorcelitering_was_am()
{
	AI_Output(other,self,"DIA_Dar_BRINGORCELITERING_was_am_15_00");	//Давай мне амулет.
	AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_was_am_03_01");	//Конечно. Пусть он доставит тебе радость. Теперь давай мне это кольцо.
	b_giveinvitems(other,self,itri_orcelitering,1);
	CreateInvItems(self,itam_dex_01,1);
	b_giveinvitems(self,other,itam_dex_01,1);
	b_giveplayerxp(XP_DAR_BRINGORCELITERING);
	AI_Output(self,other,"DIA_Dar_BRINGORCELITERING_was_am_03_02");	//Теперь я счастлив.
	Info_ClearChoices(dia_dar_bringorcelitering);
};


instance DIA_DAR_KAP5_EXIT(C_INFO)
{
	npc = sld_810_dar;
	nr = 999;
	condition = dia_dar_kap5_exit_condition;
	information = dia_dar_kap5_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_dar_kap5_exit_condition()
{
	if(KAPITEL == 5)
	{
		return TRUE;
	};
};

func void dia_dar_kap5_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DAR_KAP6_EXIT(C_INFO)
{
	npc = sld_810_dar;
	nr = 999;
	condition = dia_dar_kap6_exit_condition;
	information = dia_dar_kap6_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_dar_kap6_exit_condition()
{
	if(KAPITEL == 6)
	{
		return TRUE;
	};
};

func void dia_dar_kap6_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_DAR_PICKPOCKET(C_INFO)
{
	npc = sld_810_dar;
	nr = 900;
	condition = dia_dar_pickpocket_condition;
	information = dia_dar_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_80;
};


func int dia_dar_pickpocket_condition()
{
	return c_beklauen(67,35);
};

func void dia_dar_pickpocket_info()
{
	Info_ClearChoices(dia_dar_pickpocket);
	Info_AddChoice(dia_dar_pickpocket,DIALOG_BACK,dia_dar_pickpocket_back);
	Info_AddChoice(dia_dar_pickpocket,DIALOG_PICKPOCKET,dia_dar_pickpocket_doit);
};

func void dia_dar_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_dar_pickpocket);
};

func void dia_dar_pickpocket_back()
{
	Info_ClearChoices(dia_dar_pickpocket);
};

