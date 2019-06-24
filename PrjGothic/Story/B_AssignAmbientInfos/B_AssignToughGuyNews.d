
instance DIA_TOUGHGUY_NEWS(C_INFO)
{
	nr = 1;
	condition = dia_toughguy_news_condition;
	information = dia_toughguy_news_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_toughguy_news_condition()
{
	if(Npc_IsInState(self,zs_talk) && (self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] != FIGHT_NONE) && (self.aivar[AIV_LASTFIGHTCOMMENT] == FALSE))
	{
		return TRUE;
	};
};

func void dia_toughguy_news_info()
{
	if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_LOST)
	{
		b_say(self,other,"$TOUGHGUY_ATTACKLOST");
	}
	else if(self.aivar[AIV_LASTFIGHTAGAINSTPLAYER] == FIGHT_WON)
	{
		b_say(self,other,"$TOUGHGUY_ATTACKWON");
	}
	else
	{
		b_say(self,other,"$TOUGHGUY_PLAYERATTACK");
	};
	self.aivar[AIV_LASTFIGHTCOMMENT] = TRUE;
};

func void b_assigntoughguynews(var C_NPC slf)
{
	dia_toughguy_news.npc = Hlp_GetInstanceID(slf);
};

