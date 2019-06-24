
var int antipaladintalkcount;

func void b_assignorc_antipaladintalk(var C_NPC antipaladin)
{
	if(ANTIPALADINTALKCOUNT == 0)
	{
		AI_Output(self,other,"DIA_ORC_AntiPaladin_18_01");	//КХРОКГНАР! Хозяин говорить ты паладин теперь! Хозяин прав. Хозяин всегда прав.
		AI_Output(self,other,"DIA_ORC_AntiPaladin_18_02");	//Мы, предводители гордой армии орков, теперь сами прийти убить великий паладин.
		AI_Output(self,other,"DIA_ORC_AntiPaladin_18_03");	//Хаген и его люди будут уничтожены. Даже ты не смочь помочь им.
		b_giveplayerxp(XP_AMBIENT);
	}
	else if(ANTIPALADINTALKCOUNT == 1)
	{
		AI_Output(self,other,"DIA_ORC_AntiPaladin_18_04");	//Хозяин говорить предводителям орков, принесите голову великого паладина. Ты умирать от моей руки. КХРОКГНАР!
	}
	else if(ANTIPALADINTALKCOUNT == 2)
	{
		AI_Output(self,other,"DIA_ORC_AntiPaladin_18_05");	//Мы, предводители орков, теперь сами идти убивать тебя, паладин.
	}
	else
	{
		AI_Output(self,other,"DIA_ORC_AntiPaladin_18_06");	//КХРОКГНАР! Мы убивать тебя, паладин.
	};
	ANTIPALADINTALKCOUNT = ANTIPALADINTALKCOUNT + 1;
	TALKEDTO_ANTIPALADIN = TRUE;
	AI_StopProcessInfos(antipaladin);
	antipaladin.aivar[AIV_ENEMYOVERRIDE] = FALSE;
	Npc_SetRefuseTalk(antipaladin,20);
};

