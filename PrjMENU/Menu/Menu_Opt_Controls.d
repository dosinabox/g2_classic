
instance MENU_OPT_CONTROLS(C_MENU_DEF)
{
	backpic = MENU_BACK_PIC;
	items[1] = "MENU_ITEM_KEY_UP";
	items[2] = "MENU_ITEM_KEY_DOWN";
	items[3] = "MENU_ITEM_KEY_LEFT";
	items[4] = "MENU_ITEM_KEY_RIGHT";
	items[5] = "MENU_ITEM_KEY_STRAFE_LEFT";
	items[6] = "MENU_ITEM_KEY_STRAFE_RIGHT";
	items[7] = "MENU_ITEM_KEY_JUMPCLIMBSTRAFE";
	items[8] = "MENU_ITEM_KEY_RUNMODETOGGLE";
	items[9] = "MENU_ITEM_KEY_SNEAK";
	items[10] = "MENU_ITEM_KEY_ACTION";
	items[11] = "MENU_ITEM_KEY_WEAPON";
	items[12] = "MENU_ITEM_KEY_MAP";
	items[13] = "MENU_ITEM_KEY_LOOK";
	items[14] = "MENU_ITEM_KEY_LOOK_FP";
	items[15] = "MENU_ITEM_KEY_INVENTORY";
	items[16] = "MENU_ITEM_KEY_SCREEN_STATUS";
	items[17] = "MENU_ITEM_KEY_SCREEN_LOG";
	items[18] = "MENU_ITEM_INP_UP";
	items[19] = "MENU_ITEM_INP_DOWN";
	items[20] = "MENU_ITEM_INP_LEFT";
	items[21] = "MENU_ITEM_INP_RIGHT";
	items[22] = "MENU_ITEM_INP_STRAFE_LEFT";
	items[23] = "MENU_ITEM_INP_STRAFE_RIGHT";
	items[24] = "MENU_ITEM_INP_JUMPCLIMBSTRAFE";
	items[25] = "MENU_ITEM_INP_RUNMODETOGGLE";
	items[26] = "MENU_ITEM_INP_SNEAK";
	items[27] = "MENU_ITEM_INP_ACTION";
	items[28] = "MENU_ITEM_INP_WEAPON";
	items[29] = "MENU_ITEM_INP_MAP";
	items[30] = "MENU_ITEM_INP_LOOK";
	items[31] = "MENU_ITEM_INP_LOOK_FP";
	items[32] = "MENU_ITEM_INP_INVENTORY";
	items[33] = "MENU_ITEM_INP_SCREEN_STATUS";
	items[34] = "MENU_ITEM_INP_SCREEN_LOG";
	items[35] = "MENU_ITEM_KEY_WEAPON_LEFT";
	items[36] = "MENU_ITEM_KEY_WEAPON_RIGHT";
	items[37] = "MENU_ITEM_KEY_WEAPON_PARADE";
	items[38] = "MENU_ITEM_KEY_LOCKFOCUS";
	items[39] = "MENU_ITEM_KEY_QUICKMANA";
	items[40] = "MENU_ITEM_KEY_QUICKHEALTH";
	items[41] = "MENU_ITEM_INP_WEAPON_LEFT";
	items[42] = "MENU_ITEM_INP_WEAPON_RIGHT";
	items[43] = "MENU_ITEM_INP_WEAPON_PARADE";
	items[44] = "MENU_ITEM_INP_LOCKFOCUS";
	items[45] = "MENU_ITEM_INP_QUICKMANA";
	items[46] = "MENU_ITEM_INP_QUICKHEALTH";
	items[47] = "MENU_ITEM_CHG_KEYS_SET_DEFAULT";
	items[48] = "MENU_ITEM_CHG_KEYS_SET_ALTERNATIVE";
	items[49] = "MENUITEM_CHG_KEYS_BACK";
	flags = flags | MENU_SHOW_INFO;
};


instance MENU_OPT_CONTROLS_EXTKEYS(C_MENU_DEF)
{
	//zSpy
	items[1] = "MENUITEM_CHG_KEYS_BACK";
};

const int CTRL_SP1_1 = 1000;
const int CTRL_SP1_2 = 3500;
const int CTRL_DIMX = 4600;
const int CTRL_Y_STEP = 260;
const int CTRL_Y_STEP2 = 180;
const int CTRL_Y_TITLE = 500;
const int CTRL_Y_START = 1020;
const int CTRL_GROUP1 = 0;
const int CTRL_GROUP2 = 180;
const int CTRL_GROUP3 = 360;
const int CTRL_GROUP4 = 540;
const int CTRL_GROUP5 = 720;
const int CTRL_GROUP6 = 900;

instance MENU_ITEM_KEY_UP(C_MENU_ITEM_DEF)
{
	text[0] = "������";
	text[1] = MENU_TEXT_KEYS_HINT;
	posx = CTRL_SP1_1;
	posy = (CTRL_Y_START + (CTRL_Y_STEP * 0) + CTRL_GROUP1) - CTRL_Y_STEP - CTRL_Y_STEP - CTRL_Y_STEP;
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_INP_UP";
	fontname = MENU_FONT_SMALL;
	flags = flags;
};

instance MENU_ITEM_KEY_DOWN(C_MENU_ITEM_DEF)
{
	text[0] = "�����";
	text[1] = MENU_TEXT_KEYS_HINT;
	posx = CTRL_SP1_1;
	posy = (CTRL_Y_START + (CTRL_Y_STEP * 0) + CTRL_GROUP1) - CTRL_Y_STEP - CTRL_Y_STEP;
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_INP_DOWN";
	fontname = MENU_FONT_SMALL;
	flags = flags;
};

instance MENU_ITEM_KEY_LEFT(C_MENU_ITEM_DEF)
{
	text[0] = "������� �����";
	text[1] = MENU_TEXT_KEYS_HINT;
	posx = CTRL_SP1_1;
	posy = (CTRL_Y_START + (CTRL_Y_STEP * 0) + CTRL_GROUP1) - CTRL_Y_STEP;
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_INP_LEFT";
	fontname = MENU_FONT_SMALL;
	flags = flags;
};

instance MENU_ITEM_KEY_RIGHT(C_MENU_ITEM_DEF)
{
	text[0] = "������� ������";
	text[1] = MENU_TEXT_KEYS_HINT;
	posx = CTRL_SP1_1;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 0) + CTRL_GROUP1;
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_INP_RIGHT";
	fontname = MENU_FONT_SMALL;
	flags = flags;
};

instance MENU_ITEM_KEY_STRAFE_LEFT(C_MENU_ITEM_DEF)
{
	text[0] = "��� �����";
	text[1] = MENU_TEXT_KEYS_HINT;
	posx = CTRL_SP1_1;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 1) + CTRL_GROUP1;
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_INP_STRAFE_LEFT";
	fontname = MENU_FONT_SMALL;
	flags = flags;
};

instance MENU_ITEM_KEY_STRAFE_RIGHT(C_MENU_ITEM_DEF)
{
	text[0] = "��� ������";
	text[1] = MENU_TEXT_KEYS_HINT;
	posx = CTRL_SP1_1;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 2) + CTRL_GROUP1;
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_INP_STRAFE_RIGHT";
	fontname = MENU_FONT_SMALL;
	flags = flags;
};

instance MENU_ITEM_KEY_JUMPCLIMBSTRAFE(C_MENU_ITEM_DEF)
{
	text[0] = "������";
	text[1] = MENU_TEXT_KEYS_HINT;
	posx = CTRL_SP1_1;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 3) + CTRL_GROUP1;
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_INP_JUMPCLIMBSTRAFE";
	fontname = MENU_FONT_SMALL;
	flags = flags;
};

instance MENU_ITEM_KEY_RUNMODETOGGLE(C_MENU_ITEM_DEF)
{
	text[0] = "������";
	text[1] = MENU_TEXT_KEYS_HINT;
	posx = CTRL_SP1_1;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 4) + CTRL_GROUP1;
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_INP_RUNMODETOGGLE";
	fontname = MENU_FONT_SMALL;
	flags = flags;
};

instance MENU_ITEM_KEY_SNEAK(C_MENU_ITEM_DEF)
{
	text[0] = "�������������";
	text[1] = MENU_TEXT_KEYS_HINT;
	posx = CTRL_SP1_1;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 5) + CTRL_GROUP1;
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_INP_SNEAK";
	fontname = MENU_FONT_SMALL;
	flags = flags;
};

instance MENU_ITEM_KEY_ACTION(C_MENU_ITEM_DEF)
{
	text[0] = "��������";
	text[1] = MENU_TEXT_KEYS_HINT;
	posx = CTRL_SP1_1;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 6) + CTRL_GROUP1;
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_INP_ACTION";
	fontname = MENU_FONT_SMALL;
	flags = flags;
};

instance MENU_ITEM_KEY_WEAPON(C_MENU_ITEM_DEF)
{
	text[0] = "������� ������";
	text[1] = MENU_TEXT_KEYS_HINT;
	posx = CTRL_SP1_1;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 7) + CTRL_GROUP1;
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_INP_WEAPON";
	fontname = MENU_FONT_SMALL;
	flags = flags;
};

instance MENU_ITEM_KEY_MAP(C_MENU_ITEM_DEF)
{
	text[0] = "�����";
	text[1] = MENU_TEXT_KEYS_HINT;
	posx = CTRL_SP1_1;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 8) + CTRL_GROUP1;
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_INP_MAP";
	fontname = MENU_FONT_SMALL;
	flags = flags;
};

instance MENU_ITEM_KEY_LOOK(C_MENU_ITEM_DEF)
{
	text[0] = "����������";
	text[1] = MENU_TEXT_KEYS_HINT;
	posx = CTRL_SP1_1;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 9) + CTRL_GROUP1;
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_INP_LOOK";
	fontname = MENU_FONT_SMALL;
	flags = flags;
};

instance MENU_ITEM_KEY_LOOK_FP(C_MENU_ITEM_DEF)
{
	text[0] = "�� 1-�� ����";
	text[1] = MENU_TEXT_KEYS_HINT;
	posx = CTRL_SP1_1;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 10) + CTRL_GROUP1;
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_INP_LOOK_FP";
	fontname = MENU_FONT_SMALL;
	flags = flags;
};

instance MENU_ITEM_KEY_INVENTORY(C_MENU_ITEM_DEF)
{
	text[0] = "���������";
	text[1] = MENU_TEXT_KEYS_HINT;
	posx = CTRL_SP1_1;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 11) + CTRL_GROUP1;
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_INP_INVENTORY";
	fontname = MENU_FONT_SMALL;
	flags = flags;
};

instance MENU_ITEM_KEY_SCREEN_STATUS(C_MENU_ITEM_DEF)
{
	text[0] = "��������������";
	text[1] = MENU_TEXT_KEYS_HINT;
	posx = CTRL_SP1_1;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 12) + CTRL_GROUP1;
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_INP_SCREEN_STATUS";
	fontname = MENU_FONT_SMALL;
	flags = flags;
};

instance MENU_ITEM_KEY_SCREEN_LOG(C_MENU_ITEM_DEF)
{
	text[0] = "�������";
	text[1] = MENU_TEXT_KEYS_HINT;
	posx = CTRL_SP1_1;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 13) + CTRL_GROUP1;
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_INP_SCREEN_LOG";
	fontname = MENU_FONT_SMALL;
	flags = flags;
};

instance MENU_ITEM_KEY_WEAPON_LEFT(C_MENU_ITEM_DEF)
{
	text[0] = "����� �����";
	text[1] = MENU_TEXT_KEYS_HINT;
	posx = CTRL_SP1_1;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 14) + CTRL_GROUP1;
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_INP_WEAPON_LEFT";
	fontname = MENU_FONT_SMALL;
	flags = flags;
	hideifoptionsectionset = "GAME";
	hideifoptionset = "useGothic1Controls";
	hideonvalue = 1;
};

instance MENU_ITEM_KEY_WEAPON_RIGHT(C_MENU_ITEM_DEF)
{
	text[0] = "����� ������";
	text[1] = MENU_TEXT_KEYS_HINT;
	posx = CTRL_SP1_1;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 15) + CTRL_GROUP1;
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_INP_WEAPON_RIGHT";
	fontname = MENU_FONT_SMALL;
	flags = flags;
	hideifoptionsectionset = "GAME";
	hideifoptionset = "useGothic1Controls";
	hideonvalue = 1;
};

instance MENU_ITEM_KEY_WEAPON_PARADE(C_MENU_ITEM_DEF)
{
	text[0] = "�����������";
	text[1] = MENU_TEXT_KEYS_HINT;
	posx = CTRL_SP1_1;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 16) + CTRL_GROUP1;
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_INP_WEAPON_PARADE";
	fontname = MENU_FONT_SMALL;
	flags = flags;
	hideifoptionsectionset = "GAME";
	hideifoptionset = "useGothic1Controls";
	hideonvalue = 1;
};

instance MENU_ITEM_KEY_LOCKFOCUS(C_MENU_ITEM_DEF)
{
	text[0] = "������ ����";
	text[1] = MENU_TEXT_KEYS_HINT;
	posx = CTRL_SP1_1;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 17) + CTRL_GROUP1;
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_INP_LOCKFOCUS";
	fontname = MENU_FONT_SMALL;
	flags = flags;
	hideifoptionsectionset = "GAME";
	hideifoptionset = "useGothic1Controls";
	hideonvalue = 1;
};

instance MENU_ITEM_KEY_QUICKMANA(C_MENU_ITEM_DEF)
{
	text[0] = "����� ����";
	text[1] = MENU_TEXT_KEYS_HINT;
	posx = CTRL_SP1_1;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 18) + CTRL_GROUP1;
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_INP_QUICKMANA";
	fontname = MENU_FONT_SMALL;
	flags = flags;
	hideifoptionsectionset = "GAME";
	hideifoptionset = "usePotionKeys";
	hideonvalue = 0;
};

instance MENU_ITEM_KEY_QUICKHEALTH(C_MENU_ITEM_DEF)
{
	text[0] = "�������� �����";
	text[1] = MENU_TEXT_KEYS_HINT;
	posx = CTRL_SP1_1;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 19) + CTRL_GROUP1;
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "RUN MENU_ITEM_INP_QUICKHEALTH";
	fontname = MENU_FONT_SMALL;
	flags = flags;
	hideifoptionsectionset = "GAME";
	hideifoptionset = "usePotionKeys";
	hideonvalue = 0;
};

instance MENU_ITEM_INP_UP(C_MENU_ITEM_DEF)
{
	backpic = MENU_KBDINPUT_BACK_PIC;
	text[1] = PRESSNOW;
	type = MENU_ITEM_INPUT;
	posx = CTRL_SP1_2;
	posy = (CTRL_Y_START + (CTRL_Y_STEP * 0) + CTRL_GROUP1) - CTRL_Y_STEP - CTRL_Y_STEP - CTRL_Y_STEP;
	dimx = CTRL_DIMX;
	dimy = 300;
	fontname = MENU_FONT_SMALL;
	onchgsetoption = "keyUp";
	onchgsetoptionsection = "KEYS";
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_INP_DOWN(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[1] = PRESSNOW;
	posx = CTRL_SP1_2;
	posy = (CTRL_Y_START + (CTRL_Y_STEP * 0) + CTRL_GROUP1) - CTRL_Y_STEP - CTRL_Y_STEP;
	dimx = CTRL_DIMX;
	dimy = 300;
	fontname = MENU_FONT_SMALL;
	backpic = MENU_KBDINPUT_BACK_PIC;
	onchgsetoption = "keyDown";
	onchgsetoptionsection = "KEYS";
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_INP_LEFT(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[1] = PRESSNOW;
	posx = CTRL_SP1_2;
	posy = (CTRL_Y_START + (CTRL_Y_STEP * 0) + CTRL_GROUP1) - CTRL_Y_STEP;
	dimx = CTRL_DIMX;
	dimy = 300;
	fontname = MENU_FONT_SMALL;
	backpic = MENU_KBDINPUT_BACK_PIC;
	onchgsetoption = "keyLeft";
	onchgsetoptionsection = "KEYS";
	flags = IT_CHROMAKEYED | IT_TRANSPARENT;
};

instance MENU_ITEM_INP_RIGHT(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[1] = PRESSNOW;
	posx = CTRL_SP1_2;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 0) + CTRL_GROUP1;
	dimx = CTRL_DIMX;
	dimy = 300;
	fontname = MENU_FONT_SMALL;
	backpic = MENU_KBDINPUT_BACK_PIC;
	onchgsetoption = "keyRight";
	onchgsetoptionsection = "KEYS";
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_INP_STRAFE_LEFT(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[1] = PRESSNOW;
	posx = CTRL_SP1_2;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 1) + CTRL_GROUP1;
	dimx = CTRL_DIMX;
	dimy = 300;
	fontname = MENU_FONT_SMALL;
	backpic = MENU_KBDINPUT_BACK_PIC;
	onchgsetoption = "keyStrafeLeft";
	onchgsetoptionsection = "KEYS";
	flags = IT_CHROMAKEYED | IT_TRANSPARENT;
};

instance MENU_ITEM_INP_STRAFE_RIGHT(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[1] = PRESSNOW;
	posx = CTRL_SP1_2;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 2) + CTRL_GROUP1;
	dimx = CTRL_DIMX;
	dimy = 300;
	fontname = MENU_FONT_SMALL;
	backpic = MENU_KBDINPUT_BACK_PIC;
	onchgsetoption = "keyStrafeRight";
	onchgsetoptionsection = "KEYS";
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_INP_JUMPCLIMBSTRAFE(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[1] = PRESSNOW;
	posx = CTRL_SP1_2;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 3) + CTRL_GROUP1;
	dimx = CTRL_DIMX;
	dimy = 300;
	fontname = MENU_FONT_SMALL;
	backpic = MENU_KBDINPUT_BACK_PIC;
	onchgsetoption = "keySMove";
	onchgsetoptionsection = "KEYS";
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_INP_RUNMODETOGGLE(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[1] = PRESSNOW;
	posx = CTRL_SP1_2;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 4) + CTRL_GROUP1;
	dimx = CTRL_DIMX;
	dimy = 300;
	fontname = MENU_FONT_SMALL;
	backpic = MENU_KBDINPUT_BACK_PIC;
	onchgsetoption = "keySlow";
	onchgsetoptionsection = "KEYS";
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_INP_SNEAK(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[1] = PRESSNOW;
	posx = CTRL_SP1_2;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 5) + CTRL_GROUP1;
	dimx = CTRL_DIMX;
	dimy = 300;
	fontname = MENU_FONT_SMALL;
	backpic = MENU_KBDINPUT_BACK_PIC;
	onchgsetoption = "keySneak";
	onchgsetoptionsection = "KEYS";
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_INP_ACTION(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[1] = PRESSNOW;
	posx = CTRL_SP1_2;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 6) + CTRL_GROUP1;
	dimx = CTRL_DIMX;
	dimy = 300;
	fontname = MENU_FONT_SMALL;
	backpic = MENU_KBDINPUT_BACK_PIC;
	onchgsetoption = "keyAction";
	onchgsetoptionsection = "KEYS";
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_INP_WEAPON(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[1] = PRESSNOW;
	posx = CTRL_SP1_2;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 7) + CTRL_GROUP1;
	dimx = CTRL_DIMX;
	dimy = 300;
	fontname = MENU_FONT_SMALL;
	backpic = MENU_KBDINPUT_BACK_PIC;
	onchgsetoption = "keyWeapon";
	onchgsetoptionsection = "KEYS";
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_INP_MAP(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[1] = PRESSNOW;
	posx = CTRL_SP1_2;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 8) + CTRL_GROUP1;
	dimx = CTRL_DIMX;
	dimy = 300;
	fontname = MENU_FONT_SMALL;
	backpic = MENU_KBDINPUT_BACK_PIC;
	onchgsetoption = "keyShowMap";
	onchgsetoptionsection = "KEYS";
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_INP_LOOK(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[1] = PRESSNOW;
	posx = CTRL_SP1_2;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 9) + CTRL_GROUP1;
	dimx = CTRL_DIMX;
	dimy = 300;
	fontname = MENU_FONT_SMALL;
	backpic = MENU_KBDINPUT_BACK_PIC;
	onchgsetoption = "keyLook";
	onchgsetoptionsection = "KEYS";
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_INP_LOOK_FP(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[1] = PRESSNOW;
	posx = CTRL_SP1_2;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 10) + CTRL_GROUP1;
	dimx = CTRL_DIMX;
	dimy = 300;
	fontname = MENU_FONT_SMALL;
	backpic = MENU_KBDINPUT_BACK_PIC;
	onchgsetoption = "keyLookFP";
	onchgsetoptionsection = "KEYS";
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_INP_INVENTORY(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[1] = PRESSNOW;
	posx = CTRL_SP1_2;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 11) + CTRL_GROUP1;
	dimx = CTRL_DIMX;
	dimy = 300;
	fontname = MENU_FONT_SMALL;
	backpic = MENU_KBDINPUT_BACK_PIC;
	onchgsetoption = "keyInventory";
	onchgsetoptionsection = "KEYS";
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_INP_SCREEN_STATUS(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[1] = PRESSNOW;
	posx = CTRL_SP1_2;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 12) + CTRL_GROUP1;
	dimx = CTRL_DIMX;
	dimy = 300;
	fontname = MENU_FONT_SMALL;
	backpic = MENU_KBDINPUT_BACK_PIC;
	onchgsetoption = "keyShowStatus";
	onchgsetoptionsection = "KEYS";
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_INP_SCREEN_LOG(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[1] = PRESSNOW;
	posx = CTRL_SP1_2;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 13) + CTRL_GROUP1;
	dimx = CTRL_DIMX;
	dimy = 300;
	fontname = MENU_FONT_SMALL;
	backpic = MENU_KBDINPUT_BACK_PIC;
	onchgsetoption = "keyShowLog";
	onchgsetoptionsection = "KEYS";
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_INP_WEAPON_LEFT(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[1] = PRESSNOW;
	posx = CTRL_SP1_2;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 14) + CTRL_GROUP1;
	dimx = CTRL_DIMX;
	dimy = 300;
	fontname = MENU_FONT_SMALL;
	backpic = MENU_KBDINPUT_BACK_PIC;
	onchgsetoption = "keyActionLeft";
	onchgsetoptionsection = "KEYS";
	flags = flags & ~IT_SELECTABLE;
	hideifoptionsectionset = "GAME";
	hideifoptionset = "useGothic1Controls";
	hideonvalue = 1;
};

instance MENU_ITEM_INP_WEAPON_RIGHT(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[1] = PRESSNOW;
	posx = CTRL_SP1_2;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 15) + CTRL_GROUP1;
	dimx = CTRL_DIMX;
	dimy = 300;
	fontname = MENU_FONT_SMALL;
	backpic = MENU_KBDINPUT_BACK_PIC;
	onchgsetoption = "keyActionRight";
	onchgsetoptionsection = "KEYS";
	flags = flags & ~IT_SELECTABLE;
	hideifoptionsectionset = "GAME";
	hideifoptionset = "useGothic1Controls";
	hideonvalue = 1;
};

instance MENU_ITEM_INP_WEAPON_PARADE(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[1] = PRESSNOW;
	posx = CTRL_SP1_2;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 16) + CTRL_GROUP1;
	dimx = CTRL_DIMX;
	dimy = 300;
	fontname = MENU_FONT_SMALL;
	backpic = MENU_KBDINPUT_BACK_PIC;
	onchgsetoption = "keyParade";
	onchgsetoptionsection = "KEYS";
	flags = flags & ~IT_SELECTABLE;
	hideifoptionsectionset = "GAME";
	hideifoptionset = "useGothic1Controls";
	hideonvalue = 1;
};

instance MENU_ITEM_INP_LOCKFOCUS(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[1] = PRESSNOW;
	posx = CTRL_SP1_2;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 17) + CTRL_GROUP1;
	dimx = CTRL_DIMX;
	dimy = 300;
	fontname = MENU_FONT_SMALL;
	backpic = MENU_KBDINPUT_BACK_PIC;
	onchgsetoption = "keyLockTarget";
	onchgsetoptionsection = "KEYS";
	hideifoptionsectionset = "GAME";
	hideifoptionset = "useGothic1Controls";
	hideonvalue = 1;
	flags = flags & ~IT_SELECTABLE;
};

instance MENU_ITEM_INP_QUICKMANA(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[1] = PRESSNOW;
	posx = CTRL_SP1_2;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 18) + CTRL_GROUP1;
	dimx = CTRL_DIMX;
	dimy = 300;
	fontname = MENU_FONT_SMALL;
	backpic = MENU_KBDINPUT_BACK_PIC;
	onchgsetoption = "keyPotion";
	onchgsetoptionsection = "KEYS";
	flags = flags & ~IT_SELECTABLE;
	hideifoptionsectionset = "GAME";
	hideifoptionset = "usePotionKeys";
	hideonvalue = 0;
};

instance MENU_ITEM_INP_QUICKHEALTH(C_MENU_ITEM_DEF)
{
	type = MENU_ITEM_INPUT;
	text[1] = PRESSNOW;
	posx = CTRL_SP1_2;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 19) + CTRL_GROUP1;
	dimx = CTRL_DIMX;
	dimy = 300;
	fontname = MENU_FONT_SMALL;
	backpic = MENU_KBDINPUT_BACK_PIC;
	onchgsetoption = "keyHeal";
	onchgsetoptionsection = "KEYS";
	flags = flags & ~IT_SELECTABLE;
	hideifoptionsectionset = "GAME";
	hideifoptionset = "usePotionKeys";
	hideonvalue = 0;
};

instance MENU_ITEM_CHG_KEYS_SET_DEFAULT(C_MENU_ITEM_DEF)
{
	text[0] = "��������� �� ���������";
	text[1] = "�������������� ������������ �� ���������";
	posx = CTRL_SP1_1;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 21) + CTRL_GROUP1;
	dimy = 300;
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "SETDEFAULT";
	fontname = MENU_FONT_SMALL;
	flags = flags | IT_TXT_CENTER;
};

instance MENU_ITEM_CHG_KEYS_SET_ALTERNATIVE(C_MENU_ITEM_DEF)
{
	text[0] = "�������������� ���������";
	text[1] = "������������� �������������� ������������";
	posx = CTRL_SP1_1;
	posy = CTRL_Y_START + (CTRL_Y_STEP * 22) + CTRL_GROUP1;
	dimy = 300;
	onselaction[0] = SEL_ACTION_EXECCOMMANDS;
	onselaction_s[0] = "SETALTERNATIVE";
	fontname = MENU_FONT_SMALL;
	flags = flags | IT_TXT_CENTER;
};

instance MENUITEM_CHG_KEYS_BACK(C_MENU_ITEM_DEF)
{
	backpic = MENU_ITEM_BACK_PIC;
	text[0] = "�����";
	posx = 1000;
	posy = MENU_START_Y + (MENU_SOUND_DY * 9) + 100;
	dimx = 6192;
	dimy = MENU_OPT_DY;
	onselaction[0] = SEL_ACTION_BACK;
	flags = flags | IT_TXT_CENTER;
};

