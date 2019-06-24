
var int evt_undeaddragon_trap_01_func_count;
var int evt_undeaddragon_trap_01_func_count_nomore;

func void evt_undeaddragon_trap_01_func()
{
	if(evt_undeaddragon_trap_01_func_count_nomore < 10)
	{
		if((evt_undeaddragon_trap_01_func_count < 2) && (evt_undeaddragon_trap_01_func_count != 0))
		{
			Wld_InsertNpc(undeadorcwarrior,"DI_UNDEADDRAGON_TRAP_01");
		};
		evt_undeaddragon_trap_01_func_count = evt_undeaddragon_trap_01_func_count + 1;
		if(evt_undeaddragon_trap_01_func_count > 2)
		{
			evt_undeaddragon_trap_01_func_count = 1;
		};
		evt_undeaddragon_trap_01_func_count_nomore = evt_undeaddragon_trap_01_func_count_nomore + 1;
	};
};


var int evt_undeaddragon_trap_02_func_count;
var int evt_undeaddragon_trap_02_func_count_nomore;

func void evt_undeaddragon_trap_02_func()
{
	if(evt_undeaddragon_trap_02_func_count_nomore < 10)
	{
		if((evt_undeaddragon_trap_02_func_count < 2) && (evt_undeaddragon_trap_02_func_count != 0))
		{
			Wld_InsertNpc(undeadorcwarrior,"DI_UNDEADDRAGON_TRAP_02");
		};
		evt_undeaddragon_trap_02_func_count = evt_undeaddragon_trap_02_func_count + 1;
		if(evt_undeaddragon_trap_02_func_count > 2)
		{
			evt_undeaddragon_trap_02_func_count = 1;
		};
		evt_undeaddragon_trap_02_func_count_nomore = evt_undeaddragon_trap_02_func_count_nomore + 1;
	};
};


var int evt_undeaddragon_trap_03_func_count;
var int evt_undeaddragon_trap_03_func_count_nomore;

func void evt_undeaddragon_trap_03_func()
{
	if(evt_undeaddragon_trap_03_func_count_nomore < 10)
	{
		if((evt_undeaddragon_trap_03_func_count < 2) && (evt_undeaddragon_trap_03_func_count != 0))
		{
			Wld_InsertNpc(undeadorcwarrior,"DI_UNDEADDRAGON_TRAP_03");
		};
		evt_undeaddragon_trap_03_func_count = evt_undeaddragon_trap_03_func_count + 1;
		if(evt_undeaddragon_trap_03_func_count > 2)
		{
			evt_undeaddragon_trap_03_func_count = 1;
		};
		evt_undeaddragon_trap_03_func_count_nomore = evt_undeaddragon_trap_03_func_count_nomore + 1;
	};
};

