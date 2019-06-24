
func void b_clearruneinv(var C_NPC slf)
{
	var C_NPC her;
	her = Hlp_GetNpc(pc_hero);
	if(Hlp_GetInstanceID(self) != Hlp_GetInstanceID(her))
	{
		Npc_RemoveInvItems(slf,itru_pallightheal,Npc_HasItems(slf,itru_pallightheal));
		Npc_RemoveInvItems(slf,itru_palmediumheal,Npc_HasItems(slf,itru_palmediumheal));
		Npc_RemoveInvItems(slf,itru_palholybolt,Npc_HasItems(slf,itru_palholybolt));
		Npc_RemoveInvItems(slf,itru_palrepelevil,Npc_HasItems(slf,itru_palrepelevil));
		Npc_RemoveInvItems(slf,itru_palteleportsecret,Npc_HasItems(slf,itru_palteleportsecret));
		Npc_RemoveInvItems(slf,itru_light,Npc_HasItems(slf,itru_pallight));
		Npc_RemoveInvItems(slf,itru_pallight,Npc_HasItems(slf,itru_light));
		Npc_RemoveInvItems(slf,itru_firebolt,Npc_HasItems(slf,itru_firebolt));
		Npc_RemoveInvItems(slf,itru_zap,Npc_HasItems(slf,itru_zap));
		Npc_RemoveInvItems(slf,itru_lightheal,Npc_HasItems(slf,itru_lightheal));
		Npc_RemoveInvItems(slf,itru_sumgobskel,Npc_HasItems(slf,itru_sumgobskel));
		Npc_RemoveInvItems(slf,itru_instantfireball,Npc_HasItems(slf,itru_instantfireball));
		Npc_RemoveInvItems(slf,itru_icebolt,Npc_HasItems(slf,itru_icebolt));
		Npc_RemoveInvItems(slf,itru_sumwolf,Npc_HasItems(slf,itru_sumwolf));
		Npc_RemoveInvItems(slf,itru_windfist,Npc_HasItems(slf,itru_windfist));
		Npc_RemoveInvItems(slf,itru_sleep,Npc_HasItems(slf,itru_sleep));
		Npc_RemoveInvItems(slf,itru_mediumheal,Npc_HasItems(slf,itru_mediumheal));
		Npc_RemoveInvItems(slf,itru_lightningflash,Npc_HasItems(slf,itru_lightningflash));
		Npc_RemoveInvItems(slf,itru_chargefireball,Npc_HasItems(slf,itru_chargefireball));
		Npc_RemoveInvItems(slf,itru_sumskel,Npc_HasItems(slf,itru_sumskel));
		Npc_RemoveInvItems(slf,itru_fear,Npc_HasItems(slf,itru_fear));
		Npc_RemoveInvItems(slf,itru_icecube,Npc_HasItems(slf,itru_icecube));
		Npc_RemoveInvItems(slf,itru_thunderball,Npc_HasItems(slf,itru_thunderball));
		Npc_RemoveInvItems(slf,itru_sumgol,Npc_HasItems(slf,itru_sumgol));
		Npc_RemoveInvItems(slf,itru_harmundead,Npc_HasItems(slf,itru_harmundead));
		Npc_RemoveInvItems(slf,itru_pyrokinesis,Npc_HasItems(slf,itru_pyrokinesis));
		Npc_RemoveInvItems(slf,itru_firestorm,Npc_HasItems(slf,itru_firestorm));
		Npc_RemoveInvItems(slf,itru_icewave,Npc_HasItems(slf,itru_icewave));
		Npc_RemoveInvItems(slf,itru_sumdemon,Npc_HasItems(slf,itru_sumdemon));
		Npc_RemoveInvItems(slf,itru_fullheal,Npc_HasItems(slf,itru_fullheal));
		Npc_RemoveInvItems(slf,itru_firerain,Npc_HasItems(slf,itru_firerain));
		Npc_RemoveInvItems(slf,itru_breathofdeath,Npc_HasItems(slf,itru_breathofdeath));
		Npc_RemoveInvItems(slf,itru_massdeath,Npc_HasItems(slf,itru_massdeath));
		Npc_RemoveInvItems(slf,itru_armyofdarkness,Npc_HasItems(slf,itru_armyofdarkness));
		Npc_RemoveInvItems(slf,itru_shrink,Npc_HasItems(slf,itru_shrink));
		Npc_RemoveInvItems(slf,itru_deathbolt,Npc_HasItems(slf,itru_deathbolt));
		Npc_RemoveInvItems(slf,itru_deathball,Npc_HasItems(slf,itru_deathball));
		Npc_RemoveInvItems(slf,itru_concussionbolt,Npc_HasItems(slf,itru_concussionbolt));
	};
};

