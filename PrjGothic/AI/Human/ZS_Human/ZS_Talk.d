
var int zstalkbugfix;

func void zs_talk()
{
	var C_NPC target;
	if(other.aivar[AIV_INVINCIBLE] == TRUE)
	{
		return;
	};
	self.aivar[AIV_INVINCIBLE] = TRUE;
	other.aivar[AIV_INVINCIBLE] = TRUE;
	if(self.guild < GIL_SEPERATOR_HUM)
	{
		if(c_bodystatecontains(self,BS_SIT))
		{
			target = Npc_GetLookAtTarget(self);
			if(!Hlp_IsValidNpc(target))
			{
				AI_LookAtNpc(self,other);
			};
		}
		else
		{
			b_lookatnpc(self,other);
		};
		AI_RemoveWeapon(self);
	};
	if(!c_bodystatecontains(self,BS_SIT))
	{
		b_turntonpc(self,other);
	};
	if(!c_bodystatecontains(other,BS_SIT))
	{
		b_turntonpc(other,self);
		if(Npc_GetDistToNpc(other,self) < 80)
		{
			AI_Dodge(other);
		};
	};
	if(self.guild < GIL_SEPERATOR_HUM)
	{
		if((Npc_GetAttitude(self,other) == ATT_ANGRY) || (Npc_GetAttitude(self,other) == ATT_HOSTILE))
		{
			Mdl_StartFaceAni(self,"S_ANGRY",1,-1);
		};
		if((self.npctype == NPCTYPE_AMBIENT) || (self.npctype == NPCTYPE_OCAMBIENT))
		{
			b_assignambientinfos(self);
			if(c_npcbelongstocity(self))
			{
				b_assigncityguide(self);
			};
		};
		if(c_npcistoughguy(self) && (self.aivar[AIV_TOUGHGUYNEWSOVERRIDE] == FALSE))
		{
			b_assigntoughguynews(self);
		};
		if(c_npchasambientnews(self))
		{
			b_assignambientnews(self);
		};
	};
	if(self.guild == GIL_DRAGON)
	{
		AI_PlayAni(self,"T_STAND_2_TALK");
	};
	AI_ProcessInfos(self);
	ZSTALKBUGFIX = FALSE;
};

func int zs_talk_loop()
{
	if(InfoManager_HasFinished() && (ZSTALKBUGFIX == TRUE))
	{
		self.aivar[AIV_INVINCIBLE] = FALSE;
		other.aivar[AIV_INVINCIBLE] = FALSE;
		self.aivar[AIV_NPCSTARTEDTALK] = FALSE;
		self.aivar[AIV_TALKEDTOPLAYER] = TRUE;
		if(self.guild < GIL_SEPERATOR_HUM)
		{
			b_stoplookat(self);
			Mdl_StartFaceAni(self,"S_NEUTRAL",1,-1);
		};
		if(self.guild == GIL_DRAGON)
		{
			AI_PlayAni(self,"T_TALK_2_STAND");
		};
		return LOOP_END;
	}
	else
	{
		ZSTALKBUGFIX = TRUE;
		return LOOP_CONTINUE;
	};
};

func void zs_talk_end()
{
	Npc_SetRefuseTalk(other,20);
	if(c_npcisbotheredbyplayerroomguild(self) || ((Wld_GetPlayerPortalGuild() == GIL_PUBLIC) && (Npc_GetAttitude(self,other) != ATT_FRIENDLY)))
	{
		AI_StartState(self,zs_observeplayer,0,"");
	}
	else
	{
	};
};

