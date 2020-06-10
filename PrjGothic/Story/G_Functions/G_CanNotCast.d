
func void g_cannotcast(var int bisplayer,var int ncircleneeded,var int ncirclepossessed)
{
	var string strmessage;
	var int ndifference;
	var string strdifference;
	/*ndifference = ncircleneeded - ncirclepossessed;
	strdifference = IntToString(ndifference);
	strmessage = ConcatStrings(strmessage,strdifference);
	strmessage = ConcatStrings(strmessage," ");
	strmessage = ConcatStrings(strmessage,PRINT_MAGCIRCLES_MISSING);*/
	if(bisplayer)
	{
		Print(PRINT_MAGCIRCLES_LOW);
	};
};

