
func void evt_final_door_say_01()
{
	b_say(self,self,"$SCOPENSLASTDOOR");
	Snd_Play("LASTDOOREVENT");
	Wld_PlayEffect("spellFX_INCOVATION_VIOLET",hero,hero,0,0,0,FALSE);
};

