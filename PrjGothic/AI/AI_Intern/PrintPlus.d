
func void printplus(var string txt)
{
	var string ausgabe;
	var int zufall;
	var string zufalltxt;
	zufall = Hlp_Random(100);
	zufalltxt = IntToString(zufall);
	ausgabe = ConcatStrings(txt," ");
	ausgabe = ConcatStrings(ausgabe,zufalltxt);
	Print(ausgabe);
};

