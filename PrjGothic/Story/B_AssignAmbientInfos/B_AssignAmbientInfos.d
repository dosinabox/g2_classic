
func void b_assignambientinfos(var C_NPC slf)
{
	if(slf.guild == GIL_VLK)
	{
		if(slf.npctype == NPCTYPE_AMBIENT)
		{
			if(slf.voice == 1)
			{
				b_assignambientinfos_vlk_1(slf);
			};
			if(slf.voice == 6)
			{
				b_assignambientinfos_vlk_6(slf);
			};
			if(slf.voice == 8)
			{
				b_assignambientinfos_vlk_8(slf);
			};
			if(slf.voice == 16)
			{
				b_assignambientinfos_vlk_16(slf);
			};
			if(slf.voice == 17)
			{
				b_assignambientinfos_vlk_17(slf);
			};
		};
	};
	if(slf.guild == GIL_MIL)
	{
		if(slf.npctype == NPCTYPE_AMBIENT)
		{
			if(slf.voice == 6)
			{
				b_assignambientinfos_mil_6(slf);
			};
			if(slf.voice == 7)
			{
				b_assignambientinfos_mil_7(slf);
			};
		};
		if(slf.npctype == NPCTYPE_OCAMBIENT)
		{
			if(slf.voice == 1)
			{
				b_assignambientinfos_ocvlk_1(slf);
			};
			if(slf.voice == 6)
			{
				b_assignambientinfos_ocvlk_6(slf);
			};
		};
	};
	if(slf.guild == GIL_PAL)
	{
		if(slf.npctype == NPCTYPE_AMBIENT)
		{
			if(slf.voice == 4)
			{
				b_assignambientinfos_pal_4(slf);
			};
			if(slf.voice == 9)
			{
				b_assignambientinfos_pal_9(slf);
			};
			if(slf.voice == 12)
			{
				b_assignambientinfos_pal_12(slf);
			};
		};
		if(slf.npctype == NPCTYPE_OCAMBIENT)
		{
			if(slf.voice == 4)
			{
				b_assignambientinfos_ocpal_4(slf);
			};
			if(slf.voice == 9)
			{
				b_assignambientinfos_ocpal_9(slf);
			};
		};
	};
	if(slf.guild == GIL_BAU)
	{
		if(slf.npctype == NPCTYPE_AMBIENT)
		{
			if(slf.voice == 1)
			{
				b_assignambientinfos_bau_1(slf);
			};
			if(slf.voice == 7)
			{
				b_assignambientinfos_bau_7(slf);
			};
			if(slf.voice == 13)
			{
				b_assignambientinfos_bau_13(slf);
			};
			if(slf.voice == 16)
			{
				b_assignambientinfos_bau_16(slf);
			};
		};
	};
	if(slf.guild == GIL_SLD)
	{
		if(slf.npctype == NPCTYPE_AMBIENT)
		{
			if(slf.voice == 6)
			{
				b_assignambientinfos_sld_6(slf);
			};
			if(slf.voice == 7)
			{
				b_assignambientinfos_sld_7(slf);
			};
		};
	};
	if(slf.guild == GIL_NOV)
	{
		if(slf.npctype == NPCTYPE_AMBIENT)
		{
			if(slf.voice == 3)
			{
				b_assignambientinfos_nov_3(slf);
			};
			if(slf.voice == 11)
			{
				b_assignambientinfos_nov_8(slf);
			};
		};
	};
	if(slf.guild == GIL_OUT)
	{
		if(slf.npctype == NPCTYPE_AMBIENT)
		{
			if(slf.voice == 1)
			{
				b_assignambientinfos_out_1(slf);
			};
			if(slf.voice == 7)
			{
				b_assignambientinfos_out_7(slf);
			};
			if(slf.voice == 13)
			{
				b_assignambientinfos_out_13(slf);
			};
		};
		if(slf.npctype == NPCTYPE_OCAMBIENT)
		{
			if(slf.voice == 4)
			{
				b_assignambientinfos_owpal_4(slf);
			};
		};
	};
	if(slf.guild == GIL_STRF)
	{
		if((slf.npctype == NPCTYPE_AMBIENT) || (slf.npctype == NPCTYPE_OCAMBIENT))
		{
			if(slf.voice == 1)
			{
				b_assignambientinfos_strf_1(slf);
			};
			if(slf.voice == 13)
			{
				b_assignambientinfos_strf_13(slf);
			};
		};
	};
	if(slf.guild == GIL_BDT)
	{
		if((slf.npctype == NPCTYPE_AMBIENT) || (slf.npctype == NPCTYPE_OCAMBIENT))
		{
			if(slf.voice == 1)
			{
				b_assignambientinfos_bdt_1(slf);
			};
			if(slf.voice == 13)
			{
				b_assignambientinfos_bdt_13(slf);
			};
		};
	};
	if(slf.guild == GIL_DMT)
	{
		if((slf.npctype == NPCTYPE_AMBIENT) || (slf.npctype == NPCTYPE_OCAMBIENT))
		{
			if(slf.voice == 19)
			{
				b_assigndementortalk(slf);
			};
		};
	};
};

