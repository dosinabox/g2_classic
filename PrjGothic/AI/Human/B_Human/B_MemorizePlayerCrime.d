
func void b_memorizeplayercrime(var C_NPC slf,var C_NPC taeter,var int crime)
{
	if(!Npc_IsPlayer(taeter))
	{
		return;
	};
	if((slf.guild == GIL_DMT) || (slf.guild == GIL_BDT))
	{
		return;
	};
	if(crime > b_getplayercrime(slf))
	{
		b_deletepetzcrime(slf);
		b_addpetzcrime(slf,crime);
	};
	if(crime >= b_getplayercrime(slf))
	{
		slf.aivar[AIV_NPCSAWPLAYERCOMMIT] = crime;
		slf.aivar[AIV_NPCSAWPLAYERCOMMITDAY] = Wld_GetDay();
		slf.aivar[AIV_CRIMEABSOLUTIONLEVEL] = b_getcurrentabsolutionlevel(slf);
	};
};

