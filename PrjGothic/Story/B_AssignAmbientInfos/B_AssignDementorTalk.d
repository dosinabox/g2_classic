
instance DIA_AMBIENTDEMENTOR_EXIT(C_INFO)
{
	nr = 999;
	condition = dia_ambientdementor_exit_condition;
	information = dia_ambientdementor_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_ambientdementor_exit_condition()
{
	return TRUE;
};

func void dia_ambientdementor_exit_info()
{
	Wld_StopEffect("DEMENTOR_FX");
	AI_StopProcessInfos(self);
	b_scisobsessed(self);
	Npc_SetRefuseTalk(self,5);
	Snd_Play("MFX_FEAR_CAST");
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_vino1)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_vino2)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_vino3)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_vino4)))
	{
		dmt_vino1.aivar[AIV_ENEMYOVERRIDE] = FALSE;
		dmt_vino2.aivar[AIV_ENEMYOVERRIDE] = FALSE;
		dmt_vino3.aivar[AIV_ENEMYOVERRIDE] = FALSE;
		dmt_vino4.aivar[AIV_ENEMYOVERRIDE] = FALSE;
	}
	else
	{
		b_attack(self,other,AR_SUDDENENEMYINFERNO,1);
	};
};


instance DIA_AMBIENTDEMENTOR(C_INFO)
{
	nr = 1;
	condition = dia_ambientdementor_condition;
	information = dia_ambientdementor_info;
	important = TRUE;
	permanent = TRUE;
};


func int dia_ambientdementor_condition()
{
	if(Npc_RefuseTalk(self) == FALSE)
	{
		return TRUE;
	};
};

func void dia_ambientdementor_info()
{
	var int randy;
	Wld_PlayEffect("DEMENTOR_FX",hero,hero,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	randy = Hlp_Random(4);
	if((Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_vino1)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_vino2)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_vino3)) || (Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dmt_vino4)))
	{
		AI_Output(self,other,"DIA_VinoDementor_19_00");	//Ты пришел расстроить наш ритуал? Его душа принадлежит нам. Тебе не спасти его, маг.
	}
	else if(CURRENTLEVEL == DRAGONISLAND_ZEN)
	{
		if(Hlp_GetInstanceID(self) == Hlp_GetInstanceID(dragonisle_keymaster))
		{
			AI_Output(self,other,"DIA_AmbientDementor_19_01");	//(смеется) Ты пришел, чтобы бросить вызов мне и моей работе? Ты обречен на поражение.
			AI_Output(self,other,"DIA_AmbientDementor_19_02");	//Никому еще не удавалось пройти мой склеп. Поворачивай назад. Тебе никогда не добраться до священных Чертогов Ирдората.
		}
		else
		{
			if(randy == 0)
			{
				AI_Output(self,other,"DIA_AmbientDementor_19_03");	//Ты уже зашел слишком далеко, презренный червь. Тебе никогда не добраться до внутреннего святилища.
			};
			if(randy == 1)
			{
				AI_Output(self,other,"DIA_AmbientDementor_19_04");	//Стой, где стоишь. Ни шагу дальше!
			};
			if(randy == 2)
			{
				AI_Output(self,other,"DIA_AmbientDementor_19_05");	//Да, тебе удалось добраться сюда, но мимо меня тебе не пройти.
			};
			if(randy == 3)
			{
				AI_Output(self,other,"DIA_AmbientDementor_19_06");	//Ты пришел, чтоб бросить вызов Хозяину, но сначала тебе придется пройти мимо меня.
			};
		};
	}
	else if(hero.guild == GIL_KDF)
	{
		if(randy == 0)
		{
			AI_Output(self,other,"DIA_AmbientDementor_19_07");	//Жалкий маг, тебе никогда не сравниться с силой Хозяина.
		};
		if(randy == 1)
		{
			AI_Output(self,other,"DIA_AmbientDementor_19_08");	//Ты выбрал путь магии, чтобы противостоять нам. Умный ход. Но даже это тебе не поможет.
		};
		if(randy == 2)
		{
			AI_Output(self,other,"DIA_AmbientDementor_19_09");	//Даже будучи магом, тебе не остановить нас.
		};
		if(randy == 3)
		{
			AI_Output(self,other,"DIA_AmbientDementor_19_10");	//Мой Хозяин раздавит тебя. Твоя жалкая магия не спасет тебя.
		};
	}
	else
	{
		if(randy == 0)
		{
			AI_Output(self,other,"DIA_AmbientDementor_19_11");	//Сдайся на нашу милость, пока еще можешь. Тебе отсюда не уйти.
		};
		if(randy == 1)
		{
			AI_Output(self,other,"DIA_AmbientDementor_19_12");	//Теперь ты познаешь силу Хозяина. Тебе не уйти от него.
		};
		if(randy == 2)
		{
			AI_Output(self,other,"DIA_AmbientDementor_19_13");	//Хозяин хочет получить твою голову. Ничто не спасет тебя теперь.
		};
		if(randy == 3)
		{
			AI_Output(self,other,"DIA_AmbientDementor_19_14");	//Мы поймали тебя в ловушку, и теперь уничтожим тебя.
		};
	};
};

func void b_assigndementortalk(var C_NPC slf)
{
	if((slf.guild == GIL_DMT) && (slf.npctype == NPCTYPE_AMBIENT))
	{
		dia_ambientdementor_exit.npc = Hlp_GetInstanceID(slf);
		dia_ambientdementor.npc = Hlp_GetInstanceID(slf);
	};
};

