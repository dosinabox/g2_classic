
instance DIA_BRIDGEDEMENTOR_EXIT(C_INFO)
{
	npc = dmt_1200_dementor;
	nr = 999;
	condition = dia_bridgedementor_exit_condition;
	information = dia_bridgedementor_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_bridgedementor_exit_condition()
{
	return TRUE;
};

func void dia_bridgedementor_exit_info()
{
	Wld_StopEffect("DEMENTOR_FX");
	b_scisobsessed(self);
	AI_StopProcessInfos(self);
	Npc_SetRefuseTalk(self,30);
	b_attack(self,other,AR_NONE,1);
	Snd_Play("MFX_FEAR_CAST");
};


instance DIA_BRIDGEDEMENTOR(C_INFO)
{
	npc = dmt_1200_dementor;
	nr = 1;
	condition = dia_bridgedementor_condition;
	information = dia_bridgedementor_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_bridgedementor_condition()
{
	if(Npc_RefuseTalk(self) == FALSE)
	{
		return TRUE;
	};
};

func void dia_bridgedementor_info()
{
	Wld_PlayEffect("DEMENTOR_FX",hero,hero,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_Fear",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	AI_Output(self,other,"DIA_BridgeDementor_19_00");	//Мы знали, что ты придешь!
	AI_Output(self,other,"DIA_BridgeDementor_19_01");	//Мой Хозяин одержит победу и склонит весь мир к своим ногам.
	AI_Output(self,other,"DIA_BridgeDementor_19_02");	//Ты наивный идиот! Ты понятия не имеешь, на что ты замахнулся, и я накажу тебя за это здесь и сейчас!
	Npc_SetRefuseTalk(self,30);
};

