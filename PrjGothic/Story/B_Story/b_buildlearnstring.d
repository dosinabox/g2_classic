
func string b_buildlearnstring(var string text,var int kosten)
{
	var string concattext;
	concattext = ConcatStrings(text,PRINT_KOSTEN);
	concattext = ConcatStrings(concattext,IntToString(kosten));
	concattext = ConcatStrings(concattext,PRINT_LP);
	return concattext;
};

