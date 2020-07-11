
func string b_buildlearnstring(var string text,var int kosten)
{
	var string concattext;
	concattext = ConcatStrings(text,PRINT_KOSTEN);
	concattext = ConcatStrings(concattext,IntToString(kosten));
	if(kosten == 1)
	{
		concattext = ConcatStrings(concattext,PRINT_1LP);
	}
	else if((kosten > 1) && (kosten < 5))
	{
		concattext = ConcatStrings(concattext,PRINT_2LP);
	}
	else
	{
		concattext = ConcatStrings(concattext,PRINT_LP);
	};
	return concattext;
};

