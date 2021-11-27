
var int lothar_imov;

instance DIA_LOTHAR_EXIT(C_INFO)
{
	npc = pal_203_lothar;
	nr = 999;
	condition = dia_lothar_exit_condition;
	information = dia_lothar_exit_info;
	permanent = TRUE;
	description = DIALOG_ENDE;
};


func int dia_lothar_exit_condition()
{
	if(LOTHAR_IMOV == TRUE)
	{
		return TRUE;
	};
};

func void dia_lothar_exit_info()
{
	AI_StopProcessInfos(self);
};


instance DIA_LOTHAR_FIRSTEXIT(C_INFO)
{
	npc = pal_203_lothar;
	nr = 999;
	condition = dia_lothar_firstexit_condition;
	information = dia_lothar_firstexit_info;
	permanent = TRUE;
	description = "��� ����� ����! (�����)";
};


func int dia_lothar_firstexit_condition()
{
	if(LOTHAR_IMOV == FALSE)
	{
		return TRUE;
	};
};

func void dia_lothar_firstexit_info()
{
	AI_Output(other,self,"DIA_Lothar_FirstEXIT_15_00");	//� ������ ����!
	if(LOTHAR_REGELN == FALSE)
	{
		AI_Output(self,other,"DIA_Lothar_FirstEXIT_01_01");	//�������! �� ���� �� ������ ����� ������� ������!
		AI_Output(other,self,"DIA_Lothar_FirstEXIT_15_02");	//�����.
	}
	else
	{
		if((PLAYER_TALKEDABOUTDRAGONS == TRUE) && ((hero.guild != GIL_PAL) && (hero.guild != GIL_KDF)))
		{
			AI_Output(self,other,"DIA_Lothar_FirstEXIT_01_03");	//���� � ��� ���� ��� ������, ��� �� ������������� ����� � ��������, � ���� ����� ������� ��������, ���� ��� ����?
		}
		else
		{
			AI_Output(self,other,"DIA_Lothar_FirstEXIT_01_04");	//���� �� ���������� � ��������, �� ������ ����������� ���� � ������������.
			if(hero.guild != GIL_PAL)
			{
				AI_Output(self,other,"DIA_Lothar_FirstEXIT_01_05");	//����� ������ �������� �������� ������!
			};
		};
		LOTHAR_IMOV = TRUE;
		Npc_ExchangeRoutine(self,"START");
	};
	if(CANTHAR_INSTADT == FALSE)
	{
		Npc_ExchangeRoutine(canthar,"START");
		CANTHAR_INSTADT = TRUE;
	};
	AI_StopProcessInfos(self);
};


instance DIA_LOTHAR_HALLO(C_INFO)
{
	npc = pal_203_lothar;
	nr = 1;
	condition = dia_lothar_hallo_condition;
	information = dia_lothar_hallo_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_lothar_hallo_condition()
{
	if(self.aivar[AIV_TALKEDTOPLAYER] == FALSE)
	{
		return TRUE;
	};
};

func void dia_lothar_hallo_info()
{
	AI_Output(self,other,"DIA_Lothar_Hallo_01_00");	//����, ���������!
	if((MIL_310_SCHONMALREINGELASSEN == FALSE) && (MIL_333_SCHONMALREINGELASSEN == FALSE) && ((hero.guild != GIL_PAL) && (hero.guild != GIL_KDF)))
	{
		AI_Output(self,other,"DIA_Lothar_Hallo_01_01");	//� �� �����, ����� �� �������� ����� ��� ������.
		AI_Output(other,self,"DIA_Lothar_Hallo_15_02");	//�?
		AI_Output(self,other,"DIA_Lothar_Hallo_01_03");	//� ������ � ������ ����� �������� ������ �� ���������� ����������� ��� � �����.
		AI_Output(other,self,"DIA_Lothar_Hallo_15_04");	//�����...
		AI_Output(self,other,"DIA_Lothar_Hallo_01_05");	//�������� �������� ���������� � ���� ������!
		AI_Output(self,other,"DIA_Lothar_Hallo_01_06");	//������, ��� �������� ���:
	};
	AI_Output(self,other,"DIA_Lothar_Hallo_01_07");	//� �����. ������� ������ � ��������� ����� ������.
	AI_Output(self,other,"DIA_Lothar_Hallo_01_08");	//��� �����������, ���� �����, ������ ��� ������ ��������� ���� ������������� ����� ������, ������� ������ ����������� ��� ������ ����� ������.
	if(Npc_KnowsInfo(other,dia_lester_send_xardas))
	{
		b_startotherroutine(lester,"XARDAS");
	};
};


instance DIA_LOTHAR_MESSAGE(C_INFO)
{
	npc = pal_203_lothar;
	nr = 1;
	condition = dia_lothar_message_condition;
	information = dia_lothar_message_info;
	permanent = FALSE;
	description = "� ���� ������ ��������� ��� ������������ ���������!";
};


func int dia_lothar_message_condition()
{
	if((MIL_305_SCHONMALREINGELASSEN == FALSE) && (hero.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_lothar_message_info()
{
	AI_Output(other,self,"DIA_Lothar_MESSAGE_15_00");	//� ���� ������ ��������� ��� ������������ ���������!
	AI_Output(self,other,"DIA_Lothar_MESSAGE_01_01");	//�������������� ���� ����� ������ �� ���������.
	AI_Output(self,other,"DIA_Lothar_MESSAGE_01_02");	//�� ��� �������, ���������� �������� ������, �������� ���� �����, �������� ��������� ������.
};


instance DIA_LOTHAR_EYEINNOS(C_INFO)
{
	npc = pal_203_lothar;
	nr = 2;
	condition = dia_lothar_eyeinnos_condition;
	information = dia_lothar_eyeinnos_info;
	permanent = FALSE;
	description = "� ������, ����� �������� ���� ������!";
};


func int dia_lothar_eyeinnos_condition()
{
	if(Npc_KnowsInfo(other,dia_lothar_message) && (lordhagen.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_lothar_eyeinnos_info()
{
	AI_Output(other,self,"DIA_Lothar_EyeInnos_15_00");	//� ������, ����� �������� ���� ������!
	if((hero.guild == GIL_PAL) || (hero.guild == GIL_KDF))
	{
		AI_Output(self,other,"DIA_Lothar_EyeInnos_01_01");	//������ � ����� ������ ������ ���� �����. �������� � ��� �� ����.
	}
	else
	{
		AI_Output(self,other,"DIA_Lothar_EyeInnos_01_02");	//��������� ���� ������! ������ �� ������ � ���?! �� �� ������������ � ������ ������!
		AI_Output(other,self,"DIA_Lothar_EyeInnos_15_03");	//��� ������ � ��� ���.
		AI_Output(self,other,"DIA_Lothar_EyeInnos_01_04");	//� �� ����, ������ �������� �� ����������������, ����� ������� ���� �� �������� ������ ������ ����...
		AI_Output(self,other,"DIA_Lothar_EyeInnos_01_05");	//�� ��, ���������, �� ���� � ����, ��� �� ������ ��������� ��� ������ ������.
		AI_Output(other,self,"DIA_Lothar_EyeInnos_15_06");	//��...
		AI_Output(self,other,"DIA_Lothar_EyeInnos_01_07");	//� ������ �� ���� ���� ������� �� ����!
		if(PLAYER_TALKEDABOUTDRAGONS == TRUE)
		{
			AI_Output(self,other,"DIA_Lothar_EyeInnos_01_08");	//������� �� ��� ������ ���� � ��������, � ������ - ��� ���. ����������!
		};
	};
};


instance DIA_LOTHAR_DRAGONS(C_INFO)
{
	npc = pal_203_lothar;
	nr = 1;
	condition = dia_lothar_dragons_condition;
	information = dia_lothar_dragons_info;
	permanent = FALSE;
	description = "�������� - ����� ������ �������� �������!";
};


func int dia_lothar_dragons_condition()
{
	if(Npc_KnowsInfo(other,dia_lothar_message) && (lordhagen.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_lothar_dragons_info()
{
	AI_Output(other,self,"DIA_Lothar_Dragons_15_00");	//�������� - ����� ������ �������� �������!
	if((hero.guild != GIL_PAL) && (hero.guild != GIL_KDF))
	{
		AI_Output(self,other,"DIA_Lothar_Dragons_01_01");	//��� �� ����� ���� �������!
		AI_Output(self,other,"DIA_Lothar_Dragons_01_02");	//��� ���� �����������!
		AI_Output(self,other,"DIA_Lothar_Dragons_01_03");	//� ������ � ��� ����� ����� �������. �� ������� ������ ��� ������, ��������� ����� ������� � ��������!
		AI_Output(self,other,"DIA_Lothar_Dragons_01_04");	//� ������� ������� � ������ ����������, ��� ����������� ����� ������ � ��������, � �������� ��� �������� ����������� � ������ ��������. ��� ��� �������� ���� ����!
		AI_Output(self,other,"DIA_Lothar_Dragons_01_05");	//�� �� ����� ���������, ����� ���-���� ����� ���� ������ ����� �����!
	}
	else
	{
		AI_Output(self,other,"DIA_Lothar_Dragons_01_06");	//� ����� ����� �� ����. �� � ��� ������ ��������.
		AI_Output(self,other,"DIA_Lothar_Dragons_01_07");	//����� �����, ���� �� �������� ��� ����� ��� ����. �� ������ ����� ������ �������� ������ ����� �����.
	};
	PLAYER_TALKEDABOUTDRAGONS = TRUE;
};


instance DIA_LOTHAR_WHODRAGONS(C_INFO)
{
	npc = pal_203_lothar;
	nr = 1;
	condition = dia_lothar_whodragons_condition;
	information = dia_lothar_whodragons_info;
	permanent = FALSE;
	description = "���-�� ��� ���������� � ��������?";
};


func int dia_lothar_whodragons_condition()
{
	if(Npc_KnowsInfo(other,dia_lothar_dragons) && (lordhagen.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_lothar_whodragons_info()
{
	AI_Output(other,self,"DIA_Lothar_WhoDragons_15_00");	//���-�� ��� ���������� � ��������?
	AI_Output(self,other,"DIA_Lothar_WhoDragons_01_01");	//��. ������ �� ����� �����. ���� � �� ��������.
	if((hero.guild != GIL_PAL) && (hero.guild != GIL_KDF))
	{
		AI_Output(self,other,"DIA_Lothar_WhoDragons_01_02");	//(���������) � ������������ ��� - ��� � ����! �� ���� ������� �� ���������� ����������� ��� �� �����!
	};
};


instance DIA_LOTHAR_REGELN(C_INFO)
{
	npc = pal_203_lothar;
	nr = 3;
	condition = dia_lothar_regeln_condition;
	information = dia_lothar_regeln_info;
	permanent = FALSE;
	description = "������ - ������� ��� ������ ����� ������!";
};


func int dia_lothar_regeln_condition()
{
	return TRUE;
};

func void dia_lothar_regeln_info()
{
	AI_Output(other,self,"DIA_Lothar_Regeln_15_00");	//(������ �����) ������ - ������� ��� ������ ����� ������!
	AI_Output(self,other,"DIA_Lothar_Regeln_01_01");	//��-������, �������������� ������� ���� ����� �������������� � ������� ��������, ������ �� ������ ��������.
	AI_Output(self,other,"DIA_Lothar_Regeln_01_02");	//��� ������ ������ � ������� ����� ������ �������� ������ ��������� ���������.
	AI_Output(self,other,"DIA_Lothar_Add_01_04");	//��-������, ��������� ������, ����������� � ������� ��������, � ��������� ����� �������� ��������� ������� ���������. ������ ���� ����� ������ ���� �������� � ����� ���������.
	AI_Output(self,other,"DIA_Lothar_Add_01_05");	//� � �������, ���, ��� ���������� � ������������, ������ ��������� ����� ���������� ���������.
	AI_Output(self,other,"DIA_Lothar_Regeln_01_05");	//���� �������?
	LOTHAR_REGELN = TRUE;
};


instance DIA_LOTHAR_HOWCITIZEN(C_INFO)
{
	npc = pal_203_lothar;
	nr = 4;
	condition = dia_lothar_howcitizen_condition;
	information = dia_lothar_howcitizen_info;
	permanent = FALSE;
	description = "��� � ���� ����� ����������� ����� ������?";
};


func int dia_lothar_howcitizen_condition()
{
	if(Npc_KnowsInfo(other,dia_lothar_regeln) && (PLAYER_ISAPPRENTICE == APP_NONE) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_lothar_howcitizen_info()
{
	AI_Output(other,self,"DIA_Lothar_Add_15_06");	//��� � ���� ����� ����������� ����� ������?
	AI_Output(self,other,"DIA_Lothar_Add_01_07");	//����������� ������ ����� ��������� ������ ���, ��� ����� ���������� ������!
	AI_Output(self,other,"DIA_Lothar_Add_01_09");	//�� �� �����, ��� �� ������� ��������� ����� ������ ������� ������ ������, ��� �� ��������� �����������!
	AI_Output(self,other,"DIA_Lothar_Add_01_10");	//��� ���������, �� �������� ������ � ������� ����� ������ - � �� ����� ����!
	AI_Output(self,other,"DIA_Lothar_Add_01_11");	//������ ������ ������ ���������, �� ������� �������� ������ � ������!
};


instance DIA_LOTHAR_WOARBEIT(C_INFO)
{
	npc = pal_203_lothar;
	nr = 5;
	condition = dia_lothar_woarbeit_condition;
	information = dia_lothar_woarbeit_info;
	permanent = FALSE;
	description = "��� � ���� ����� ������?";
};


func int dia_lothar_woarbeit_condition()
{
	if(Npc_KnowsInfo(other,dia_lothar_howcitizen) && (PLAYER_ISAPPRENTICE == APP_NONE) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_lothar_woarbeit_info()
{
	AI_Output(other,self,"DIA_Lothar_Add_15_14");	//��� � ���� ����� ������?
	AI_Output(self,other,"DIA_Lothar_Add_01_15");	//���� �������� ����� �������� ������ �� �������� � ������ ����� ������.
	AI_Output(self,other,"DIA_Lothar_Add_01_16");	//��� ������ ������ ������ ���� �� ������, �� ������� ����������� ����� ������.
	AI_Output(self,other,"DIA_Lothar_Add_01_17");	//������ ������ ������� ������ ����������� � ����, ������ ������ ��������.
	AI_Output(self,other,"DIA_Lothar_Add_01_18");	//���� �� ����� ����� ������ � �������� ��������, ������ �� ����!
	AI_Output(self,other,"DIA_Lothar_Add_01_19");	//��� ����� ������� ��������. ���� �� ��� ���� ���� ���, �� ��������� �� ����!
};


instance DIA_LOTHAR_TOOV(C_INFO)
{
	npc = pal_203_lothar;
	nr = 6;
	condition = dia_lothar_toov_condition;
	information = dia_lothar_toov_info;
	permanent = FALSE;
	description = "��� ��� ������� � ������� �������?";
};


func int dia_lothar_toov_condition()
{
	if(Npc_KnowsInfo(other,dia_lothar_regeln) && (MIL_305_SCHONMALREINGELASSEN == FALSE) && (PLAYER_ISAPPRENTICE == APP_NONE) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_lothar_toov_info()
{
	AI_Output(other,self,"DIA_Lothar_ToOV_15_00");	//��� ��� ������� � ������� �������?
	AI_Output(self,other,"DIA_Lothar_ToOV_01_01");	//�����, �� ���� ������ ��������?!
	AI_Output(self,other,"DIA_Lothar_ToOV_01_02");	//�� �� ��������� ����������� ����� ������. �� ������ ���� �� �������� - ������ ��� ����� ���� �� ������.
	AI_Output(self,other,"DIA_Lothar_ToOV_01_03");	//���, ��� ��������� �� ����������� �������, ��� ���� �������� ��������� �����!
};


instance DIA_LOTHAR_TOMILIZ(C_INFO)
{
	npc = pal_203_lothar;
	nr = 7;
	condition = dia_lothar_tomiliz_condition;
	information = dia_lothar_tomiliz_info;
	permanent = FALSE;
	description = "��� � ���� ��������� �� ������ � ���������?";
};


func int dia_lothar_tomiliz_condition()
{
	if(Npc_KnowsInfo(other,dia_lothar_regeln) && (other.guild == GIL_NONE))
	{
		return TRUE;
	};
};

func void dia_lothar_tomiliz_info()
{
	AI_Output(other,self,"DIA_Lothar_Add_15_26");	//��� � ���� ��������� �� ������ � ���������?
	if(PLAYER_ISAPPRENTICE == APP_NONE)
	{
		AI_Output(self,other,"DIA_Lothar_Add_01_27");	//�� ������� �������� ����� ������, �� ������ � ��������� ����������� ������ �������� ������.
		AI_Output(other,self,"DIA_Lothar_Add_15_28");	//�������.
	};
	AI_Output(self,other,"DIA_Lothar_Add_01_29");	//���� �� ������ ������ ������, �������� � ������ ����� � ��������.
};


instance DIA_LOTHAR_TOPALADINS(C_INFO)
{
	npc = pal_203_lothar;
	nr = 7;
	condition = dia_lothar_topaladins_condition;
	information = dia_lothar_topaladins_info;
	permanent = FALSE;
	description = "��� ��� ����� �������, ����� �������� ������� ��� � ����?";
};


func int dia_lothar_topaladins_condition()
{
	if(Npc_KnowsInfo(other,dia_lothar_tomiliz) && (other.guild != GIL_PAL) && (other.guild != GIL_KDF))
	{
		return TRUE;
	};
};

func void dia_lothar_topaladins_info()
{
	AI_Output(other,self,"DIA_Lothar_Add_15_30");	//��� ��� ����� �������, ����� �������� ������� ��� � ����?
	if(other.guild != GIL_MIL)
	{
		AI_Output(self,other,"DIA_Lothar_Add_01_31");	//(���������) ���? �� ���� �� ��������� ������ ���������!
	};
	if(PLAYER_ISAPPRENTICE == APP_NONE)
	{
		AI_Output(self,other,"DIA_Lothar_Add_01_32");	//�� ���� �� ���������!
	};
	AI_Output(self,other,"DIA_Lothar_Add_01_33");	//��� �� ���� ������ ������ � ���, ����� ������ ������� ��������?
	AI_Output(self,other,"DIA_Lothar_Add_01_34");	//������ �������� �� ������ ���������, ������� ����������� ���������� ������ �������, ���� �������� ����� �����.
	AI_Output(self,other,"DIA_Lothar_Add_01_35");	//(������) ���� �� ������ ����� ���������, ������� ���� ���� ����� ������ � ��������� ����, ��� �������!
};


instance DIA_LOTHAR_WOANDRE(C_INFO)
{
	npc = pal_203_lothar;
	nr = 8;
	condition = dia_lothar_woandre_condition;
	information = dia_lothar_woandre_info;
	permanent = FALSE;
	description = "��� ��� ����� ��������� ��������� ������?";
};


func int dia_lothar_woandre_condition()
{
	if((Npc_KnowsInfo(other,dia_lothar_regeln) || Npc_KnowsInfo(other,dia_lothar_message)) && (andre.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_lothar_woandre_info()
{
	AI_Output(other,self,"DIA_Lothar_WoAndre_15_00");	//��� ��� ����� ��������� ��������� ������?
	AI_Output(self,other,"DIA_Lothar_WoAndre_01_01");	//����� ����� ����� ����� � �������� � ��������������� ����� ������.
};


instance DIA_LOTHAR_SCHLAFEN(C_INFO)
{
	npc = pal_203_lothar;
	nr = 9;
	condition = dia_lothar_schlafen_condition;
	information = dia_lothar_schlafen_info;
	permanent = FALSE;
	description = "��� � ���� �������� ����?";
};


func int dia_lothar_schlafen_condition()
{
	if(other.guild == GIL_NONE)
	{
		return TRUE;
	};
};

func void dia_lothar_schlafen_info()
{
	AI_Output(other,self,"DIA_Lothar_Add_15_22");	//��� � ���� �������� ����?
	AI_Output(self,other,"DIA_Lothar_Add_01_23");	//���� �� ����� ����� ��� �������, ��� � �����, ����������� ����� ���������.
	AI_Output(self,other,"DIA_Lothar_Add_01_24");	//�������� ������ �� ������ ���� ��������, ������� ������� � ���� �����.
	AI_Output(self,other,"DIA_Lothar_Add_01_25");	//������������� �������� � �������� ������� ����� ������ ���.
};


instance DIA_LOTHAR_PERMB4OV(C_INFO)
{
	npc = pal_203_lothar;
	nr = 3;
	condition = dia_lothar_permb4ov_condition;
	information = dia_lothar_permb4ov_info;
	permanent = TRUE;
	important = TRUE;
};


func int dia_lothar_permb4ov_condition()
{
	if(Npc_IsInState(self,zs_talk) && (MIL_305_SCHONMALREINGELASSEN == FALSE) && (LOTHAR_REGELN == TRUE))
	{
		return TRUE;
	};
};

func void dia_lothar_permb4ov_info()
{
	AI_Output(self,other,"DIA_Lothar_PermB4OV_01_00");	//��� ���� ��������� �� ������ ���������� � ������ �����!
	AI_StopProcessInfos(self);
};

func void b_lothar_blubb()
{
	/*AI_Output(other,self,"DIA_Lothar_Add_15_00");	//�� � ������ ��������� � ������ �������!
	AI_Output(self,other,"DIA_Lothar_Add_01_45");	//��� � �������, �� ������ ���� � ���� ���������.
	AI_Output(self,other,"DIA_Lothar_Add_01_46");	//���... �������, �� �����, ��� ������.
	AI_Output(other,self,"DIA_Lothar_Add_15_20");	//������� �������� �������� � ������?
	AI_Output(self,other,"DIA_Lothar_Add_01_21");	//��������� � ����, ����� �� ����.
	AI_Output(self,other,"DIA_Lothar_Add_01_62");	//����� ���, ����� � ������� ������������ ������? ������ ���������� � ��������!
	AI_Output(other,self,"DIA_Lothar_Add_15_63");	//������ ���� �����?..
	AI_Output(self,other,"DIA_Lothar_Add_01_64");	//��� �� ���� ����!
	AI_Output(self,other,"DIA_Lothar_Add_01_65");	//��� ���� ��������� ���, �������?!
	AI_Output(other,self,"DIA_Lothar_Add_15_66");	//��� ��� ����� ��������� ���������?
	AI_Output(other,self,"DIA_Lothar_Add_15_08");	//������ � ������ ������ �� ��������!
	AI_Output(self,other,"DIA_Lothar_Add_01_47");	//����� ��.
	AI_Output(self,other,"DIA_Lothar_Add_01_43");	//��� � ������, �� ������������ � ������ �����?
	AI_Output(self,other,"DIA_Lothar_Add_01_44");	//� ������� ����, ��� �� ������ �������������� � ���������, ������ ���� ������� ����������� ������.
	AI_Output(self,other,"DIA_Lothar_Add_01_48");	//� ������� ����� ������, ��� �� ������� ���������� � ���...
	AI_Output(other,self,"DIA_Lothar_Add_15_49");	//�? ��� �� ������?
	AI_Output(self,other,"DIA_Lothar_Add_01_50");	//�� ������� �� ������ � ����.
	AI_Output(other,self,"DIA_Lothar_Add_15_51");	//������� ���. �� ������ ��� � ��������?
	AI_Output(self,other,"DIA_Lothar_Add_01_52");	//����� � �� ������� ����, ����� �� ��������� ����� ���� �����?!
	AI_Output(self,other,"DIA_Lothar_Add_01_12");	//� ������, �� ��� ������� ��������� ��������� ��������.
	AI_Output(self,other,"DIA_Lothar_Add_01_13");	//������, �� ����� ��������� �������� ������, ��?
	AI_Output(self,other,"DIA_Lothar_Add_01_01");	//�� ������ ������������ �������, ��� � ��� ���������!
	AI_Output(self,other,"DIA_Lothar_Add_01_02");	//���� ����� �� ���������.
	AI_Output(self,other,"DIA_Lothar_Add_01_03");	//���� � ���� ������������� ���� ���-�� ������, ��� � ����� �����. �� ������� ����!*/
};


instance DIA_LOTHAR_HELLOAGAIN(C_INFO)
{
	npc = pal_203_lothar;
	nr = 1;
	condition = dia_lothar_helloagain_condition;
	information = dia_lothar_helloagain_info;
	permanent = FALSE;
	important = TRUE;
};


func int dia_lothar_helloagain_condition()
{
	if(MIL_305_SCHONMALREINGELASSEN == TRUE)
	{
		return TRUE;
	};
};

func void dia_lothar_helloagain_info()
{
	if(self.aivar[AIV_TALKEDTOPLAYER] == TRUE)
	{
		AI_Output(self,other,"DIA_Lothar_HelloAgain_01_00");	//��! ����� ��!
	};
	if(Npc_KnowsInfo(other,dia_lothar_toov))
	{
		AI_Output(self,other,"DIA_Lothar_HelloAgain_01_01");	//��� ���� ��� �� ������� �������� ������ � ������� �������!
	};
	if(other.guild == GIL_KDF)
	{
		AI_Output(self,other,"DIA_Lothar_Add_01_36");	//��� �� ���� ��� ������?
		AI_Output(other,self,"DIA_Lothar_Add_15_37");	//� ������ ��������� �����.
		AI_Output(self,other,"DIA_Lothar_Add_01_38");	//����������. ����� ��, ��� ���������� �����, ����� ���� ����� ������...
	};
	if(other.guild == GIL_SLD)
	{
		AI_Output(self,other,"DIA_Lothar_Add_01_39");	//�� ���� �� ������������� � ��������� �����, ���?
		AI_Output(self,other,"DIA_Lothar_Add_01_40");	//��� �� ����� ����?
		AI_Output(other,self,"DIA_Lothar_Add_15_41");	//� ������ ����������� ���� �� ��...
		AI_Output(self,other,"DIA_Lothar_Add_01_42");	//��! ���� ����� ������� �� ���������� �� ���.
	};
	AI_Output(self,other,"DIA_Lothar_HelloAgain_01_02");	//���� ����, � ������� �� ������ ������ �������. � ��������� ������ �� ������ ��������� ������ ��� �� ������, ��� ����� ����.
	AI_Output(self,other,"DIA_Lothar_HelloAgain_01_03");	//���� ����� ������� ������ � ���� ���������. �� ������� �� �� �������� ��� ������� - ��� ������ ���������.
	AI_Output(self,other,"DIA_Lothar_HelloAgain_01_04");	//������ ������ ����� ����������� ������� ��������� - ��� ���� ���������� ������ ������!
	if((other.guild == GIL_KDF) || (other.guild == GIL_NOV))
	{
		AI_Output(self,other,"DIA_Lothar_HelloAgain_01_05");	//���� �������� �� ��, ��� �� ������ ���� ������ ������.
	};
	if(other.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Lothar_HelloAgain_01_06");	//������ ������ ���������, �� ����� ��������� ������ � ����� ���������.
		AI_Output(self,other,"DIA_Lothar_HelloAgain_01_07");	//�� ���� ����� ��-�������� � ��������.
	};
	AI_Output(self,other,"DIA_Lothar_HelloAgain_01_08");	//� ���� �������� ����� ������� ��������. ��� ��� �������� � ��� � ���������.
	AI_Output(self,other,"DIA_Lothar_HelloAgain_01_09");	//�� ������ ���� �����?
	AI_Output(other,self,"DIA_Lothar_HelloAgain_15_10");	//�������.
};


instance DIA_LOTHAR_HAGEN(C_INFO)
{
	npc = pal_203_lothar;
	nr = 2;
	condition = dia_lothar_hagen_condition;
	information = dia_lothar_hagen_info;
	permanent = TRUE;
	description = "��� � ���� ����� ����� ������?";
};


func int dia_lothar_hagen_condition()
{
	if((MIL_305_SCHONMALREINGELASSEN == TRUE) && (lordhagen.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_lothar_hagen_info()
{
	AI_Output(other,self,"DIA_Lothar_Hagen_15_00");	//��� � ���� ����� ����� ������?
	AI_Output(self,other,"DIA_Lothar_Hagen_01_01");	//�� � ������, � ����� �������� ��������.
	AI_Output(self,other,"DIA_Lothar_Hagen_01_02");	//�� ���� �� ������ ��� ��� ������ �� �� �������.
};


instance DIA_LOTHAR_OWRUNNING(C_INFO)
{
	npc = pal_203_lothar;
	nr = 2;
	condition = dia_lothar_owrunning_condition;
	information = dia_lothar_owrunning_info;
	permanent = FALSE;
	description = "� ������ ��������� � ������ �������...";
};


func int dia_lothar_owrunning_condition()
{
	if((MIS_OLDWORLD == LOG_RUNNING) && (Npc_HasItems(hero,itwr_paladinletter_mis) == 0))
	{
		return TRUE;
	};
};

func void dia_lothar_owrunning_info()
{
	AI_Output(other,self,"DIA_Lothar_Add_15_53");	//� ������ ��������� � ������ �������...
	AI_Output(self,other,"DIA_Lothar_Add_01_54");	//�? �� �� ������� ��� ������ ����������� � ��������, ���?
	AI_Output(other,self,"DIA_Lothar_Add_15_55");	//��, � ������� ���...
	AI_Output(self,other,"DIA_Lothar_Add_01_56");	//����� ���, ��� ��� ��������...
	AI_Output(other,self,"DIA_Lothar_Add_15_57");	//�� ������ ���� ������ ��������������...
	AI_Output(self,other,"DIA_Lothar_Add_01_58");	//�� ��� �, ����� �����. (���� ��� ���) ��� �� �������...
	AI_StopProcessInfos(self);
};


instance DIA_LOTHAR_OWRUNNINGBRIEF(C_INFO)
{
	npc = pal_203_lothar;
	nr = 2;
	condition = dia_lothar_owrunningbrief_condition;
	information = dia_lothar_owrunningbrief_info;
	permanent = FALSE;
	description = "� ���� ���� ��������������! ��� ������ �� ������������ �������!";
};


func int dia_lothar_owrunningbrief_condition()
{
	if((MIS_OLDWORLD == LOG_RUNNING) && (Npc_HasItems(hero,itwr_paladinletter_mis) > 0))
	{
		return TRUE;
	};
};

func void dia_lothar_owrunningbrief_info()
{
	AI_Output(other,self,"DIA_Lothar_Add_15_59");	//� ���� ���� ��������������! ��� ������ �� ������������ �������!
	AI_Output(self,other,"DIA_Lothar_Add_01_60");	//��� ������� ������������� ����������?
	AI_Output(self,other,"DIA_Lothar_Add_01_61");	//� ��� ������������ � ����. � ���� ������ ������ � �������� �� ��� ���������.
	AI_StopProcessInfos(self);
};


instance DIA_LOTHAR_PERM(C_INFO)
{
	npc = pal_203_lothar;
	nr = 3;
	condition = dia_lothar_perm_condition;
	information = dia_lothar_perm_info;
	permanent = TRUE;
	description = "������ ����������� �� ����?";
};


func int dia_lothar_perm_condition()
{
	if((MIL_305_SCHONMALREINGELASSEN == TRUE) && (lordhagen.aivar[AIV_TALKEDTOPLAYER] == FALSE))
	{
		return TRUE;
	};
};

func void dia_lothar_perm_info()
{
	AI_Output(other,self,"DIA_Lothar_PERM_15_00");	//������ ����������� �� ���� �� ��������� �����?
	if((other.guild == GIL_NONE) || (other.guild == GIL_SLD))
	{
		AI_Output(self,other,"DIA_Lothar_PERM_01_01");	//��, ���� ����� ������� ���������� ����� ����. ������ �� ��������� ��� ������ ����.
	}
	else if(other.guild == GIL_MIL)
	{
		AI_Output(self,other,"DIA_Lothar_PERM_01_02");	//�� ������ �������� ���� �� ����. � �������� ����� ��������� ������ � ���� ����������� ������ ������������ � ������ ����� � �������!
	}
	else
	{
		AI_Output(self,other,"DIA_Lothar_PERM_01_03");	//���.
	};
};


instance DIA_LOTHAR_PICKPOCKET(C_INFO)
{
	npc = pal_203_lothar;
	nr = 900;
	condition = dia_lothar_pickpocket_condition;
	information = dia_lothar_pickpocket_info;
	permanent = TRUE;
	description = PICKPOCKET_60;
};


func int dia_lothar_pickpocket_condition()
{
	return c_beklauen(56,95);
};

func void dia_lothar_pickpocket_info()
{
	Info_ClearChoices(dia_lothar_pickpocket);
	Info_AddChoice(dia_lothar_pickpocket,DIALOG_BACK,dia_lothar_pickpocket_back);
	Info_AddChoice(dia_lothar_pickpocket,DIALOG_PICKPOCKET,dia_lothar_pickpocket_doit);
};

func void dia_lothar_pickpocket_doit()
{
	b_beklauen();
	Info_ClearChoices(dia_lothar_pickpocket);
};

func void dia_lothar_pickpocket_back()
{
	Info_ClearChoices(dia_lothar_pickpocket);
};

