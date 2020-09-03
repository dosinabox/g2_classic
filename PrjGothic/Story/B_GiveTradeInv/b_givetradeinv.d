
func void b_givetradeinv(var C_NPC slf)
{
	var C_NPC trd_engor;
	var C_NPC trd_matteo;
	var C_NPC trd_halvor;
	var C_NPC trd_bosper;
	var C_NPC trd_harad;
	var C_NPC trd_brian;
	var C_NPC trd_brahim;
	var C_NPC trd_constantino;
	var C_NPC trd_kardif;
	var C_NPC trd_zuris;
	var C_NPC trd_baltram;
	var C_NPC trd_canthar;
	var C_NPC trd_sarah;
	var C_NPC trd_jora;
	var C_NPC trd_hakon;
	var C_NPC trd_coragon;
	var C_NPC trd_gorax;
	var C_NPC trd_orlan;
	var C_NPC trd_bennet;
	var C_NPC trd_bennet_di;
	var C_NPC trd_elena;
	var C_NPC trd_sagitta;
	var C_NPC trd_kjorn;
	var C_NPC trd_rethon;
	var C_NPC trd_rosi;
	var C_NPC trd_ignaz;
	var C_NPC trd_milten_di;
	var C_NPC trd_vatras_di;
	var C_NPC trd_diego_di;
	var C_NPC trd_tandor;
	var C_NPC trd_sengrath;
	var C_NPC trd_isgaroth;
	var C_NPC trd_fenia;
	var C_NPC trd_khaled;
	var C_NPC trd_karras;
	var C_NPC trd_salandril;
	var C_NPC trd_gaertner;
	var C_NPC trd_lutero;
	trd_engor = Hlp_GetNpc(vlk_4108_engor);
	trd_matteo = Hlp_GetNpc(vlk_416_matteo);
	trd_halvor = Hlp_GetNpc(vlk_469_halvor);
	trd_bosper = Hlp_GetNpc(vlk_413_bosper);
	trd_harad = Hlp_GetNpc(vlk_412_harad);
	trd_brian = Hlp_GetNpc(vlk_457_brian);
	trd_brahim = Hlp_GetNpc(vlk_437_brahim);
	trd_constantino = Hlp_GetNpc(vlk_417_constantino);
	trd_kardif = Hlp_GetNpc(vlk_431_kardif);
	trd_zuris = Hlp_GetNpc(vlk_409_zuris);
	trd_baltram = Hlp_GetNpc(vlk_410_baltram);
	trd_canthar = Hlp_GetNpc(vlk_468_canthar);
	trd_sarah = Hlp_GetNpc(vlk_470_sarah);
	trd_jora = Hlp_GetNpc(vlk_408_jora);
	trd_hakon = Hlp_GetNpc(vlk_407_hakon);
	trd_coragon = Hlp_GetNpc(vlk_420_coragon);
	trd_gorax = Hlp_GetNpc(kdf_508_gorax);
	trd_orlan = Hlp_GetNpc(bau_970_orlan);
	trd_bennet = Hlp_GetNpc(sld_809_bennet);
	trd_bennet_di = Hlp_GetNpc(sld_809_bennet_di);
	trd_elena = Hlp_GetNpc(bau_911_elena);
	trd_sagitta = Hlp_GetNpc(bau_980_sagitta);
	trd_kjorn = Hlp_GetNpc(djg_710_kjorn);
	trd_rethon = Hlp_GetNpc(djg_709_rethon);
	trd_rosi = Hlp_GetNpc(bau_936_rosi);
	trd_ignaz = Hlp_GetNpc(vlk_498_ignaz);
	trd_milten_di = Hlp_GetNpc(pc_mage_di);
	trd_vatras_di = Hlp_GetNpc(vlk_439_vatras_di);
	trd_diego_di = Hlp_GetNpc(pc_thief_di);
	trd_tandor = Hlp_GetNpc(pal_260_tandor);
	trd_sengrath = Hlp_GetNpc(pal_267_sengrath);
	trd_isgaroth = Hlp_GetNpc(kdf_509_isgaroth);
	trd_fenia = Hlp_GetNpc(vlk_476_fenia);
	trd_khaled = Hlp_GetNpc(sld_823_khaled);
	trd_karras = Hlp_GetNpc(kdf_503_karras);
	trd_salandril = Hlp_GetNpc(vlk_422_salandril);
	trd_gaertner = Hlp_GetNpc(vlk_411_gaertner);
	trd_lutero = Hlp_GetNpc(vlk_404_lutero);
	b_clearruneinv(slf);
	if(slf.aivar[AIV_CHAPTERINV] <= KAPITEL)
	{
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_engor))
		{
			b_clearjunktradeinv(slf);
			b_givetradeinv_engor(slf);
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_matteo))
		{
			b_clearjunktradeinv(slf);
			b_givetradeinv_matteo(slf);
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_halvor))
		{
			b_clearjunktradeinv(slf);
			b_givetradeinv_halvor(slf);
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_bosper))
		{
			b_clearjunktradeinv(slf);
			b_givetradeinv_bosper(slf);
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_harad))
		{
			b_clearjunktradeinv(slf);
			b_givetradeinv_harad(slf);
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_brian))
		{
			b_clearjunktradeinv(slf);
			b_givetradeinv_brian(slf);
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_brahim))
		{
			b_clearjunktradeinv(slf);
			b_givetradeinv_brahim(slf);
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_constantino))
		{
			b_clearjunktradeinv(slf);
			b_givetradeinv_constantino(slf);
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_kardif))
		{
			b_clearjunktradeinv(slf);
			b_givetradeinv_kardif(slf);
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_zuris))
		{
			b_clearjunktradeinv(slf);
			b_givetradeinv_zuris(slf);
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_baltram))
		{
			b_clearjunktradeinv(slf);
			b_givetradeinv_baltram(slf);
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_canthar))
		{
			b_clearjunktradeinv(slf);
			b_givetradeinv_canthar(slf);
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_sarah))
		{
			b_clearjunktradeinv(slf);
			b_givetradeinv_sarah(slf);
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_jora))
		{
			b_clearjunktradeinv(slf);
			b_givetradeinv_jora(slf);
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_hakon))
		{
			b_clearjunktradeinv(slf);
			b_givetradeinv_hakon(slf);
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_coragon))
		{
			b_clearjunktradeinv(slf);
			b_givetradeinv_coragon(slf);
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_gorax))
		{
			b_clearjunktradeinv(slf);
			b_givetradeinv_gorax(slf);
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_orlan))
		{
			b_clearjunktradeinv(slf);
			b_givetradeinv_orlan(slf);
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_bennet))
		{
			b_clearjunktradeinv(slf);
			b_givetradeinv_bennet(slf);
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_bennet_di))
		{
			b_clearjunktradeinv(slf);
			b_givetradeinv_bennet_di(slf);
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_elena))
		{
			b_clearjunktradeinv(slf);
			b_givetradeinv_elena(slf);
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_sagitta))
		{
			b_clearjunktradeinv(slf);
			b_givetradeinv_sagitta(slf);
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_kjorn))
		{
			b_clearjunktradeinv(slf);
			b_givetradeinv_kjorn(slf);
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_rethon))
		{
			b_clearjunktradeinv(slf);
			b_givetradeinv_rethon(slf);
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_rosi))
		{
			b_clearjunktradeinv(slf);
			b_givetradeinv_rosi(slf);
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_ignaz))
		{
			b_clearjunktradeinv(slf);
			b_givetradeinv_ignaz(slf);
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_milten_di))
		{
			b_clearjunktradeinv(slf);
			b_givetradeinv_milten_di(slf);
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_vatras_di))
		{
			b_clearjunktradeinv(slf);
			b_givetradeinv_vatras_di(slf);
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_diego_di))
		{
			b_clearjunktradeinv(slf);
			b_givetradeinv_diego_di(slf);
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_tandor))
		{
			b_clearjunktradeinv(slf);
			b_givetradeinv_tandor(slf);
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_sengrath))
		{
			b_clearjunktradeinv(slf);
			b_givetradeinv_sengrath(slf);
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_isgaroth))
		{
			b_clearjunktradeinv(slf);
			b_givetradeinv_isgaroth(slf);
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_fenia))
		{
			b_clearjunktradeinv(slf);
			b_givetradeinv_fenia(slf);
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_khaled))
		{
			b_clearjunktradeinv(slf);
			b_givetradeinv_khaled(slf);
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_karras))
		{
			b_clearjunktradeinv(slf);
			b_givetradeinv_karras(slf);
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_salandril))
		{
			b_clearjunktradeinv(slf);
			b_givetradeinv_salandril(slf);
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_gaertner))
		{
			b_clearjunktradeinv(slf);
			b_givetradeinv_gaertner(slf);
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_lutero))
		{
			b_clearjunktradeinv(slf);
			b_givetradeinv_lutero(slf);
		};
		slf.aivar[AIV_CHAPTERINV] = KAPITEL + 1;
	};
	if(Npc_IsInState(slf,zs_dead) || Npc_IsInState(slf,zs_unconscious))
	{
		if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_engor))
		{
			b_cleardeadtrader(slf);
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_matteo))
		{
			b_cleardeadtrader(slf);
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_halvor))
		{
			b_cleardeadtrader(slf);
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_bosper))
		{
			b_cleardeadtrader(slf);
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_harad))
		{
			b_cleardeadtrader(slf);
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_brian))
		{
			b_cleardeadtrader(slf);
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_brahim))
		{
			b_cleardeadtrader(slf);
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_constantino))
		{
			b_cleardeadtrader(slf);
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_kardif))
		{
			b_cleardeadtrader(slf);
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_zuris))
		{
			b_cleardeadtrader(slf);
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_baltram))
		{
			b_cleardeadtrader(slf);
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_canthar))
		{
			b_cleardeadtrader(slf);
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_sarah))
		{
			b_cleardeadtrader(slf);
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_jora))
		{
			b_cleardeadtrader(slf);
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_hakon))
		{
			b_cleardeadtrader(slf);
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_coragon))
		{
			b_cleardeadtrader(slf);
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_gorax))
		{
			b_cleardeadtrader(slf);
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_orlan))
		{
			b_cleardeadtrader(slf);
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_bennet))
		{
			b_cleardeadtrader(slf);
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_bennet_di))
		{
			b_cleardeadtrader(slf);
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_elena))
		{
			b_cleardeadtrader(slf);
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_sagitta))
		{
			b_cleardeadtrader(slf);
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_kjorn))
		{
			b_cleardeadtrader(slf);
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_rethon))
		{
			b_cleardeadtrader(slf);
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_rosi))
		{
			b_cleardeadtrader(slf);
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_ignaz))
		{
			b_cleardeadtrader(slf);
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_milten_di))
		{
			b_cleardeadtrader(slf);
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_vatras_di))
		{
			b_cleardeadtrader(slf);
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_diego_di))
		{
			b_cleardeadtrader(slf);
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_tandor))
		{
			b_cleardeadtrader(slf);
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_sengrath))
		{
			b_cleardeadtrader(slf);
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_isgaroth))
		{
			b_cleardeadtrader(slf);
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_fenia))
		{
			b_cleardeadtrader(slf);
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_khaled))
		{
			b_cleardeadtrader(slf);
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_karras))
		{
			b_cleardeadtrader(slf);
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_salandril))
		{
			b_cleardeadtrader(slf);
		}
		else if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(trd_gaertner))
		{
			b_cleardeadtrader(slf);
		};
	};
};

