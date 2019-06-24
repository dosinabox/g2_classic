
func void b_say_guildgreetings(var C_NPC slf,var C_NPC oth)
{
	var int zufall;
	if((slf.guild == GIL_MIL) && ((oth.guild == GIL_MIL) || (oth.guild == GIL_PAL)))
	{
		b_say_overlay(slf,oth,"$MILGREETINGS");
		return;
	};
	if((slf.guild == GIL_PAL) && ((oth.guild == GIL_PAL) || (oth.guild == GIL_MIL) || (oth.guild == GIL_KDF)))
	{
		b_say_overlay(slf,oth,"$PALGREETINGS");
		return;
	};
	if((slf.guild == GIL_KDF) && ((oth.guild == GIL_PAL) || (oth.guild == GIL_NOV) || (oth.guild == GIL_KDF)))
	{
		b_say_overlay(slf,oth,"$PALGREETINGS");
		return;
	};
	if((Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(bartok)) && (BARTOK_ORKGESAGT == TRUE))
	{
		b_bartok_shitanorc();
		return;
	};
	if(Hlp_GetInstanceID(slf) == Hlp_GetInstanceID(koch))
	{
		b_koch_hackebeil();
		return;
	};
	zufall = Hlp_Random(100);
	if((zufall <= 10) && Wld_IsRaining())
	{
		b_say_overlay(slf,oth,"$WEATHER");
		return;
	};
};

