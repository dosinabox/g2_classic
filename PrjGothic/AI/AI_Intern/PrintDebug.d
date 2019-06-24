
const int PD_TA_FRAME = 1;
const int PD_TA_LOOP = 2;
const int PD_TA_CHECK = 3;
const int PD_TA_DETAIL = 4;
const int PD_ZS_FRAME = 6;
const int PD_ZS_LOOP = 7;
const int PD_ZS_CHECK = 8;
const int PD_ZS_DETAIL = 9;
const int PD_MST_FRAME = 11;
const int PD_MST_LOOP = 12;
const int PD_MST_CHECK = 13;
const int PD_MST_DETAIL = 14;
const int PD_ORC_FRAME = 16;
const int PD_ORC_LOOP = 17;
const int PD_ORC_CHECK = 18;
const int PD_ORC_DETAIL = 19;
const int PD_MISSION = 21;
const int PD_CUTSCENE = 22;
const int PD_SPELL = 23;
const int PD_ITEM_MOBSI = 24;
const int PD_MAGIC = 25;

func void printdebugs(var string txt)
{
	PrintDebug(self.name);
	PrintDebug(txt);
};

func void printdebugnpc(var int type,var string text)
{
	var string pipe;
	var int instance_id;
	var string inst_id;
	instance_id = self.id;
	inst_id = IntToString(instance_id);
	pipe = ConcatStrings("### ",self.name);
	pipe = ConcatStrings(pipe,"(");
	pipe = ConcatStrings(pipe,inst_id);
	pipe = ConcatStrings(pipe,")");
	pipe = ConcatStrings(pipe," ### -> ");
	pipe = ConcatStrings(pipe,text);
	PrintDebugInstCh(type,pipe);
};

func void printglobals(var int channel)
{
	var string pipe;
	printdebugnpc(channel,"PrintGlobals");
	if(Hlp_IsValidNpc(self))
	{
		pipe = ConcatStrings("...self:   ",self.name);
		printdebugnpc(channel,pipe);
	};
	if(Hlp_IsValidNpc(other))
	{
		pipe = ConcatStrings("...other:  ",other.name);
		printdebugnpc(channel,pipe);
	};
	if(Hlp_IsValidNpc(victim))
	{
		pipe = ConcatStrings("...victim: ",victim.name);
		printdebugnpc(channel,pipe);
	};
	if(Hlp_IsValidNpc(hero))
	{
		pipe = ConcatStrings("...hero:   ",hero.name);
		printdebugnpc(channel,pipe);
	};
	if(Hlp_IsValidItem(item))
	{
		pipe = ConcatStrings("...item:   ",item.name);
		printdebugnpc(channel,pipe);
	};
};

func void printguild(var int channel,var int guild)
{
	printdebugnpc(channel,"PrintGuild");
};

func void printattitudes(var int channel)
{
	var int temp_attitude;
	var int perm_attitude;
	printdebugnpc(channel,"PrintAttitudes");
	temp_attitude = Npc_GetAttitude(self,hero);
	perm_attitude = Npc_GetPermAttitude(self,hero);
	if(temp_attitude == ATT_HOSTILE)
	{
		printdebugnpc(channel,"TempAttitude == ATT_HOSTILE");
	};
	if(temp_attitude == ATT_ANGRY)
	{
		printdebugnpc(channel,"TempAttitude == ATT_ANGRY");
	};
	if(temp_attitude == ATT_NEUTRAL)
	{
		printdebugnpc(channel,"TempAttitude == ATT_NEUTRAL");
	};
	if(temp_attitude == ATT_FRIENDLY)
	{
		printdebugnpc(channel,"TempAttitude == ATT_FRIENDLY");
	};
	if(perm_attitude == ATT_HOSTILE)
	{
		printdebugnpc(channel,"PermAttitude == ATT_HOSTILE");
	};
	if(perm_attitude == ATT_ANGRY)
	{
		printdebugnpc(channel,"PermAttitude == ATT_ANGRY");
	};
	if(perm_attitude == ATT_NEUTRAL)
	{
		printdebugnpc(channel,"PermAttitude == ATT_NEUTRAL");
	};
	if(perm_attitude == ATT_FRIENDLY)
	{
		printdebugnpc(channel,"PermAttitude == ATT_FRIENDLY");
	};
};

func void printdebugint(var int channel,var string pretext,var int value)
{
	var string printtext;
	printtext = IntToString(value);
	printtext = ConcatStrings(pretext,printtext);
	printdebugnpc(channel,printtext);
};

func void printdebugstring(var int channel,var string pretext,var string text)
{
	printdebugnpc(channel,ConcatStrings(pretext,text));
};

