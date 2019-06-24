
instance DIA_SLD_820_EXIT(C_INFO)
{
	npc = sld_820_soeldner;
	nr = 999;
	condition = dia_sld_820_exit_condition;
	information = dia_sld_820_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_sld_820_exit_condition()
{
	return TRUE;
};

func void dia_sld_820_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_SLD_820_HALT(C_INFO)
{
	npc = sld_820_soeldner;
	nr = 1;
	condition = dia_sld_820_halt_condition;
	information = dia_sld_820_halt_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_sld_820_halt_condition()
{
	if((other.guild != GIL_SLD) && (other.guild != GIL_DJG))
	{
		return TRUE;
	};
};

func void dia_sld_820_halt_info()
{
	AI_Output(self,other,"DIA_Sld_820_Halt_07_00");	//И куда ты идешь?
	AI_Output(other,self,"DIA_Sld_820_Halt_15_01");	//В дом, конечно же.
	AI_Output(self,other,"DIA_Sld_820_Halt_07_02");	//Онар платит нам за то, чтобы мы не пускали в дом парней вроде тебя!
	if(other.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Sld_820_Halt_07_03");	//Здесь не место ополчению! Он именно так и сказал.
	};
	AI_Output(other,self,"DIA_Sld_820_Halt_15_04");	//Я хочу поговорить с Ли!
	AI_Output(self,other,"DIA_Sld_820_Halt_07_05");	//Что тебе нужно от него?
	Info_ClearChoices(dia_sld_820_halt);
	Info_AddChoice(dia_sld_820_halt,"Он и я давние знакомые...",dia_sld_820_halt_kennelee);
	if(other.guild == GIL_NONE)
	{
		Info_AddChoice(dia_sld_820_halt,"Я хочу присоединиться к наемникам!",dia_sld_820_halt_wannajoin);
	};
};

func void b_sld_820_leeisright()
{
	AI_Output(self,other,"B_Sld_820_LeeIsRight_07_00");	//Ли в правом крыле. И даже не пытайся заглянуть куда-либо еще!
};

func void dia_sld_820_halt_wannajoin()
{
	AI_Output(other,self,"DIA_Sld_820_Halt_WannaJoin_15_00");	//Я хочу присоединиться к наемникам!
	AI_Output(self,other,"DIA_Sld_820_Halt_WannaJoin_07_01");	//Ах, свежее пушечное мясо! Добро пожаловать.
	b_sld_820_leeisright();
	AI_Output(self,other,"DIA_Sld_820_Halt_WannaJoin_07_02");	//Но только предупреждаю: оставь Онара в покое! Он очень не любит, когда с ним заговаривают посторонние. Особенно парни вроде тебя.
	AI_StopProcessInfos(self);
};

func void dia_sld_820_halt_kennelee()
{
	AI_Output(other,self,"DIA_Sld_820_Halt_KenneLee_15_00");	//Он и я давние знакомые...
	AI_Output(self,other,"DIA_Sld_820_Halt_KenneLee_07_01");	//ТЫ приятель Ли? Я не верю в это! Но все равно, проходи, и если он не узнает тебя, тогда держись... (смеется)
	b_sld_820_leeisright();
	AI_StopProcessInfos(self);
};


instance DIA_SLD_820_PERM(C_INFO)
{
	npc = sld_820_soeldner;
	nr = 1;
	condition = dia_sld_820_perm_condition;
	information = dia_sld_820_perm_info;
	permanent = TRUE;
	description = "Как дела?";
};


func int dia_sld_820_perm_condition()
{
	return TRUE;
};

func void dia_sld_820_perm_info()
{
	AI_Output(other,self,"DIA_Sld_820_PERM_15_00");	//Как дела?
	AI_Output(self,other,"DIA_Sld_820_PERM_07_01");	//Проходи, если хочешь, но не надо трепаться здесь.
	AI_StopProcessInfos(self);
};

