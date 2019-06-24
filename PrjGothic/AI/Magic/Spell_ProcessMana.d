
func int spell_processmana(var int manainvested)
{
	if(Npc_GetActiveSpell(self) == SPL_PALLIGHT)
	{
		return spell_logic_pallight(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_PALLIGHTHEAL)
	{
		return spell_logic_pallightheal(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_PALHOLYBOLT)
	{
		return spell_logic_palholybolt(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_PALMEDIUMHEAL)
	{
		return spell_logic_palmediumheal(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_PALREPELEVIL)
	{
		return spell_logic_palrepelevil(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_PALFULLHEAL)
	{
		return spell_logic_palfullheal(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_PALDESTROYEVIL)
	{
		return spell_logic_paldestroyevil(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_PALTELEPORTSECRET)
	{
		return spell_logic_palteleportsecret(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_TELEPORTSEAPORT)
	{
		return spell_logic_teleportseaport(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_TELEPORTMONASTERY)
	{
		return spell_logic_teleportmonastery(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_TELEPORTFARM)
	{
		return spell_logic_teleportfarm(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_TELEPORTXARDAS)
	{
		return spell_logic_teleportxardas(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_TELEPORTPASSNW)
	{
		return spell_logic_teleportpassnw(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_TELEPORTPASSOW)
	{
		return spell_logic_teleportpassow(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_TELEPORTOC)
	{
		return spell_logic_teleportoc(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_TELEPORTOWDEMONTOWER)
	{
		return spell_logic_teleportowdemontower(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_TELEPORTTAVERNE)
	{
		return spell_logic_teleporttaverne(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_LIGHT)
	{
		return spell_logic_light(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_FIREBOLT)
	{
		return spell_logic_firebolt(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_ICEBOLT)
	{
		return spell_logic_icebolt(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_ZAP)
	{
		return spell_logic_zap(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_LIGHTHEAL)
	{
		return spell_logic_lightheal(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_SUMMONGOBLINSKELETON)
	{
		return spell_logic_summongoblinskeleton(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_INSTANTFIREBALL)
	{
		return spell_logic_instantfireball(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_SUMMONWOLF)
	{
		return spell_logic_summonwolf(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_WINDFIST)
	{
		return spell_logic_windfist(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_SLEEP)
	{
		return spell_logic_sleep(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_MEDIUMHEAL)
	{
		return spell_logic_mediumheal(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_LIGHTNINGFLASH)
	{
		return spell_logic_lightningflash(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_CHARGEFIREBALL)
	{
		return spell_logic_chargefireball(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_CHARGEZAP)
	{
		return spell_logic_chargezap(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_SUMMONSKELETON)
	{
		return spell_logic_summonskeleton(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_FEAR)
	{
		return spell_logic_fear(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_ICECUBE)
	{
		return spell_logic_icecube(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_CHARGEZAP)
	{
		return spell_logic_chargezap(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_SUMMONGOLEM)
	{
		return spell_logic_summongolem(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_DESTROYUNDEAD)
	{
		return spell_logic_destroyundead(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_PYROKINESIS)
	{
		return spell_logic_pyrokinesis(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_FIRESTORM)
	{
		return spell_logic_firestorm(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_ICEWAVE)
	{
		return spell_logic_icewave(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_SUMMONDEMON)
	{
		return spell_logic_summondemon(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_FULLHEAL)
	{
		return spell_logic_fullheal(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_FIRERAIN)
	{
		return spell_logic_firerain(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_BREATHOFDEATH)
	{
		return spell_logic_breathofdeath(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_MASSDEATH)
	{
		return spell_logic_massdeath(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_ARMYOFDARKNESS)
	{
		return spell_logic_armyofdarkness(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_SHRINK)
	{
		return spell_logic_shrink(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_TRFSHEEP)
	{
		return spell_logic_trfsheep(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_TRFSCAVENGER)
	{
		return spell_logic_trfscavenger(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_TRFGIANTRAT)
	{
		return spell_logic_trfgiantrat(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_TRFGIANTBUG)
	{
		return spell_logic_trfgiantbug(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_TRFWOLF)
	{
		return spell_logic_trfwolf(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_TRFWARAN)
	{
		return spell_logic_trfwaran(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_TRFSNAPPER)
	{
		return spell_logic_trfsnapper(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_TRFWARG)
	{
		return spell_logic_trfwarg(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_TRFFIREWARAN)
	{
		return spell_logic_trffirewaran(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_TRFLURKER)
	{
		return spell_logic_trflurker(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_TRFSHADOWBEAST)
	{
		return spell_logic_trfshadowbeast(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_TRFDRAGONSNAPPER)
	{
		return spell_logic_trfdragonsnapper(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_CHARM)
	{
		return spell_logic_charm(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_MASTEROFDISASTER)
	{
		return spell_logic_masterofdisaster(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_CONCUSSIONBOLT)
	{
		return spell_logic_concussionbolt(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_DEATHBOLT)
	{
		return spell_logic_deathbolt(manainvested);
	};
	if(Npc_GetActiveSpell(self) == SPL_DEATHBALL)
	{
		return spell_logic_deathball(manainvested);
	};
};

