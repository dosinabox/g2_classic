
var int sld_bullco_is_alive;
var int sld_rod_is_alive;
var int sld_cipher_is_alive;
var int sld_gorn_is_alive;
var int sld_sylvio_is_alive;
var int gorndjg_is_alive;
var int djg_angar_is_alive;
var int diegoow_is_alive;
var int gornow_is_alive;
var int vino_isalive_kap3;
var int malak_isalive_kap3;

func void b_npc_isalivecheck(var int zen)
{
	var C_NPC sld_bullco_owcheck;
	var C_NPC sld_rod_owcheck;
	var C_NPC sld_821;
	var C_NPC sld_cipher_owcheck;
	var C_NPC sld_gorn_owcheck;
	var C_NPC sld_sylvio_owcheck;
	var C_NPC gorndjg_nwcheck;
	var C_NPC djg_angar_nwcheck;
	if(zen == NEWWORLD_ZEN)
	{
		if(KAPITEL >= 2)
		{
		};
		if(KAPITEL >= 3)
		{
		};
		if(MIS_READYFORCHAPTER4 == TRUE)
		{
			sld_bullco_owcheck = Hlp_GetNpc(sld_807_bullco);
			if(Npc_IsDead(sld_bullco_owcheck))
			{
				SLD_BULLCO_IS_ALIVE = FALSE;
			}
			else
			{
				SLD_BULLCO_IS_ALIVE = TRUE;
				b_removenpc(sld_bullco_owcheck);
			};
			sld_rod_owcheck = Hlp_GetNpc(sld_804_rod);
			if(Npc_IsDead(sld_rod_owcheck))
			{
				SLD_ROD_IS_ALIVE = FALSE;
			}
			else
			{
				SLD_ROD_IS_ALIVE = TRUE;
				b_removenpc(sld_rod_owcheck);
			};
			sld_821 = Hlp_GetNpc(sld_821_soeldner);
			Npc_ExchangeRoutine(sld_821,"RODWEG");
			sld_cipher_owcheck = Hlp_GetNpc(sld_803_cipher);
			if(Npc_IsDead(sld_cipher_owcheck))
			{
				SLD_CIPHER_IS_ALIVE = FALSE;
			}
			else
			{
				SLD_CIPHER_IS_ALIVE = TRUE;
				b_removenpc(sld_cipher_owcheck);
			};
			sld_gorn_owcheck = Hlp_GetNpc(pc_fighter_nw_vor_djg);
			if(Npc_IsDead(sld_gorn_owcheck))
			{
				SLD_GORN_IS_ALIVE = FALSE;
			}
			else
			{
				SLD_GORN_IS_ALIVE = TRUE;
				b_removenpc(sld_gorn_owcheck);
			};
			sld_sylvio_owcheck = Hlp_GetNpc(sld_806_sylvio);
			if(Npc_IsDead(sld_sylvio_owcheck))
			{
				SLD_SYLVIO_IS_ALIVE = FALSE;
			}
			else
			{
				SLD_SYLVIO_IS_ALIVE = TRUE;
				b_removenpc(sld_sylvio_owcheck);
			};
		};
		if(KAPITEL >= 5)
		{
		};
		if(KAPITEL >= 6)
		{
		};
	};
	if(zen == OLDWORLD_ZEN)
	{
		if(KAPITEL >= 2)
		{
		};
		if(KAPITEL >= 3)
		{
		};
		if(KAPITEL >= 4)
		{
			gorndjg_nwcheck = Hlp_GetNpc(gorndjg);
			if(Npc_IsDead(gorndjg))
			{
				GORNDJG_IS_ALIVE = FALSE;
			}
			else
			{
				GORNDJG_IS_ALIVE = TRUE;
				b_removenpc(gorndjg_nwcheck);
			};
			djg_angar_nwcheck = Hlp_GetNpc(djg_angar);
			if(Npc_IsDead(djg_angar))
			{
				DJG_ANGAR_IS_ALIVE = FALSE;
			}
			else
			{
				DJG_ANGAR_IS_ALIVE = TRUE;
				b_removenpc(djg_angar_nwcheck);
			};
		};
		if(KAPITEL >= 5)
		{
		};
		if(KAPITEL >= 6)
		{
		};
	};
};

