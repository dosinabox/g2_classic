
func int c_npchasattackreasontokill(var C_NPC slf)
{
	if((slf.aivar[AIV_ATTACKREASON] == AR_KILL) || (slf.aivar[AIV_ATTACKREASON] == AR_GUILDENEMY) || (slf.aivar[AIV_ATTACKREASON] == AR_HUMANMURDEREDHUMAN) || (slf.aivar[AIV_ATTACKREASON] == AR_GUARDSTOPSINTRUDER) || (slf.aivar[AIV_ATTACKREASON] == AR_GUARDCALLEDTOKILL))
	{
		return TRUE;
	};
	return FALSE;
};

