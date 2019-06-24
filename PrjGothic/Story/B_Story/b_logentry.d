
func void b_logentry(var string topic,var string entry)
{
	Log_AddEntry(topic,entry);
	PrintScreen(PRINT_NEWLOGENTRY,-1,YPOS_LOGENTRY,FONT_SCREENSMALL,2);
	Snd_Play("LogEntry");
};

