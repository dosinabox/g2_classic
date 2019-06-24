
func void b_assigndementortalk_ritual()
{
	var int randy;
	Wld_PlayEffect("DEMENTOR_FX",hero,hero,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	if(MIS_SCKNOWSINNOSEYEISBROKEN == FALSE)
	{
		AI_Output(self,other,"DIA_RitualDementor_19_00");	//Ты пришел слишком поздно.
		AI_Output(self,other,"DIA_RitualDementor_19_01");	//Мы уничтожили Глаз Инноса, и теперь ему никогда не вернуть былую силу.
		AI_Output(self,other,"DIA_RitualDementor_19_02");	//Теперь мы продемонстрируем всю тщетность твоих попыток бросить вызов Хозяину.
		MIS_SCKNOWSINNOSEYEISBROKEN = TRUE;
		b_logentry(TOPIC_INNOSEYE,"Эти жуткие ребята действуют мне на нервы. Они испортили Глаз Инноса. И теперь я не знаю, как мне починить его.");
		b_logentry(TOPIC_TRAITORPEDRO,"Я нашел Глаз Инноса. Но что-то нигде не видно Педро. Эти черные маги в сговоре с ним.");
		b_giveplayerxp(XP_SCKNOWSINNOSEYEISBROKEN);
	}
	else
	{
		randy = Hlp_Random(4);
		if(randy == 0)
		{
			AI_Output(self,other,"DIA_RitualDementor_19_03");	//Почувствуй нашу силу!
		};
		if(randy == 1)
		{
			AI_Output(self,other,"DIA_RitualDementor_19_04");	//За Хозяина!
		};
		if(randy == 2)
		{
			AI_Output(self,other,"DIA_RitualDementor_19_05");	//Тебе нигде не скрыться.
		};
		if(randy == 3)
		{
			AI_Output(self,other,"DIA_RitualDementor_19_06");	//Мы убьем тебя.
		};
	};
	Npc_SetRefuseTalk(self,30);
};

func void b_assigndementortalk_ritual_exit()
{
	Wld_StopEffect("DEMENTOR_FX");
	b_scisobsessed(self);
	AI_StopProcessInfos(self);
	b_attack(self,other,AR_SUDDENENEMYINFERNO,1);
	Snd_Play("MFX_FEAR_CAST");
	self.aivar[AIV_ENEMYOVERRIDE] = FALSE;
};

