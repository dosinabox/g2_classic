
func void b_closetopic(var string topic,var int missionvar,var int commonvar,var int endchapter)
{
	if((missionvar == LOG_SUCCESS) || (commonvar == TRUE))
	{
		Log_SetTopicStatus(topic,LOG_SUCCESS);
	}
	else if(missionvar == LOG_OBSOLETE)
	{
		Log_SetTopicStatus(topic,LOG_OBSOLETE);
	}
	else if(missionvar == LOG_FAILED)
	{
		Log_SetTopicStatus(topic,LOG_FAILED);
	}
	else if((KAPITEL >= endchapter) && ((missionvar == LOG_RUNNING) || (commonvar == FALSE)))
	{
		Log_SetTopicStatus(topic,LOG_OBSOLETE);
	};
};

