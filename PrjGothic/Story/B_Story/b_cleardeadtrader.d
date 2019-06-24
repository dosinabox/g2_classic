
func void b_cleardeadtrader(var C_NPC trader)
{
	Npc_ClearInventory(trader);
	if(trader.aivar[AIV_VICTORYXPGIVEN] == FALSE)
	{
		b_createambientinv(trader);
	};
	trader.aivar[AIV_CHAPTERINV] = KAPITEL - 1;
};

