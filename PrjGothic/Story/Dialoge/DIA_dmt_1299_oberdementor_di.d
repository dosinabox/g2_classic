
instance DIA_SCHWARZMAGIER_HELLO(C_INFO)
{
	npc = dmt_1299_oberdementor_di;
	nr = 5;
	condition = dia_schwarzmagier_hello_condition;
	information = dia_schwarzmagier_hello_info;
	important = TRUE;
};


func int dia_schwarzmagier_hello_condition()
{
	return TRUE;
};


var int sc_knowsmadpsi;

func void dia_schwarzmagier_hello_info()
{
	AI_Output(self,other,"DIA_Schwarzmagier_HELLO_09_00");	//Что ж, ничтожный червь, ты действительно осмелился дойти до ворот хозяина.
	AI_Output(other,self,"DIA_Schwarzmagier_HELLO_15_01");	//Это ты здесь всем заправляешь?
	AI_Output(self,other,"DIA_Schwarzmagier_HELLO_09_02");	//Я страж Чертогов Ирдората. Величайшего источника власти Белиара на земле. Божественная сила повелителя течет через мои руки.
	AI_Output(self,other,"DIA_Schwarzmagier_HELLO_09_03");	//Одно мое слово, и ты погрузишься в вечное безумие.
	AI_Output(other,self,"DIA_Schwarzmagier_HELLO_15_04");	//Понятно. Похоже, мне придется избавиться еще от одной пешки.
	b_logentry(TOPIC_HALLENVONIRDORATH,"Я у последних врат. Черный маг, похоже, ключ к ним.");
	Info_ClearChoices(dia_schwarzmagier_hello);
	Info_AddChoice(dia_schwarzmagier_hello,"Отведи меня к своему хозяину.",dia_schwarzmagier_hello_meister);
	Info_AddChoice(dia_schwarzmagier_hello,"И сколько еще тебе подобных мне придется убить?",dia_schwarzmagier_hello_dmt);
	Info_AddChoice(dia_schwarzmagier_hello,"А что скрывается за тем огромным порталом, вон там?",dia_schwarzmagier_hello_hintertor);
	Info_AddChoice(dia_schwarzmagier_hello,"Кто твой хозяин?",dia_schwarzmagier_hello_wer);
	if(SC_KNOWSMADPSI == TRUE)
	{
		Info_AddChoice(dia_schwarzmagier_hello,"Ты был последователем Спящего.",dia_schwarzmagier_hello_schlaefer);
	};
};

func void dia_schwarzmagier_hello_wer()
{
	AI_Output(other,self,"DIA_Schwarzmagier_HELLO_wer_15_00");	//Кто твой хозяин?
	AI_Output(self,other,"DIA_Schwarzmagier_HELLO_wer_09_01");	//Он странник между мирами. Его божественная мудрость просвещает нас.
	AI_Output(self,other,"DIA_Schwarzmagier_HELLO_wer_09_02");	//Он Избранный Белиара. Он тот, кто освободит королевство от презренных последователей Инноса.
	AI_Output(self,other,"DIA_Schwarzmagier_HELLO_wer_09_03");	//Он несет смерть всем, кто сомневается в его величии.
	AI_Output(other,self,"DIA_Schwarzmagier_HELLO_wer_15_04");	//Знакомые слова.
};

func void dia_schwarzmagier_hello_hintertor()
{
	AI_Output(other,self,"DIA_Schwarzmagier_HELLO_hinterTor_15_00");	//А что скрывается за тем огромным порталом, вон там?
	AI_Output(self,other,"DIA_Schwarzmagier_HELLO_hinterTor_09_01");	//(смеется) Покои моего повелителя останутся недоступными для тебя. Я не дам тебе возможности открыть эти врата.
};

func void dia_schwarzmagier_hello_schlaefer()
{
	AI_Output(other,self,"DIA_Schwarzmagier_HELLO_schlaefer_15_00");	//Ты был последователем Спящего.
	AI_Output(self,other,"DIA_Schwarzmagier_HELLO_schlaefer_09_01");	//Это было в далеком прошлом. Повелитель открыл нам глаза. Теперь никто не остановит нас.
	AI_Output(self,other,"DIA_Schwarzmagier_HELLO_schlaefer_09_02");	//Повелитель показал нам единственно возможный путь борьбы с вами, неверующими.
	TOPIC_END_DEMENTOREN = TRUE;
	b_giveplayerxp(XP_AMBIENT);
};

func void dia_schwarzmagier_hello_dmt()
{
	AI_Output(other,self,"DIA_Schwarzmagier_HELLO_dmt_15_00");	//И сколько еще тебе подобных мне придется убить?
	AI_Output(self,other,"DIA_Schwarzmagier_HELLO_dmt_09_01");	//Нас много. Ты даже не представляешь, как многочисленны те, кто ждет прихода этой свободы.
	AI_Output(self,other,"DIA_Schwarzmagier_HELLO_dmt_09_02");	//Их вопль прокатится по всей земле, когда мы вступим в этот мир.
	AI_Output(self,other,"DIA_Schwarzmagier_HELLO_dmt_09_03");	//Чтобы освободить его от варваров, называющих себя Стражами Огня. Наш сбор здесь, в этом храме, будет недолгим.
	AI_Output(other,self,"DIA_Schwarzmagier_HELLO_dmt_15_04");	//Да.
};

func void dia_schwarzmagier_hello_meister()
{
	Wld_PlayEffect("DEMENTOR_FX",hero,hero,0,0,0,FALSE);
	Wld_PlayEffect("spellFX_INCOVATION_RED",self,self,0,0,0,FALSE);
	Wld_PlayEffect("FX_EarthQuake",self,self,0,0,0,FALSE);
	Wld_PlayEffect("SFX_Circle",self,self,0,0,0,FALSE);
	AI_PlayAni(self,"T_PRACTICEMAGIC5");
	AI_Output(self,other,"DIA_Schwarzmagier_HELLO_meister_09_00");	//(угрожающе) Хватит болтовни! Я уничтожу тебя.
	AI_Output(self,other,"DIA_Schwarzmagier_HELLO_meister_09_01");	//Твой взор потухнет, и твой дух растает во тьме.
	if(Npc_HasItems(other,itam_prot_blackeye_mis))
	{
		AI_Output(other,self,"DIA_Schwarzmagier_HELLO_meister_15_02");	//(себе под нос) Без этого амулета вызова душ у меня бы были большие проблемы сейчас.
	}
	else
	{
		hero.attribute[ATR_MANA] = 0;
		if(hero.attribute[ATR_HITPOINTS] > 50)
		{
			hero.attribute[ATR_HITPOINTS] = hero.attribute[ATR_HITPOINTS] / 2;
		};
		SC_OBSESSIONCOUNTER = 100;
		b_scisobsessed(hero);
	};
	Info_ClearChoices(dia_schwarzmagier_hello);
	Info_AddChoice(dia_schwarzmagier_hello,DIALOG_ENDE,dia_schwarzmagier_hello_back);
};

func void dia_schwarzmagier_hello_back()
{
	AI_StopProcessInfos(self);
	Wld_StopEffect("DEMENTOR_FX");
	self.flags = 0;
	Snd_Play("MFX_FEAR_CAST");
	b_attack(self,other,AR_SUDDENENEMYINFERNO,1);
};

