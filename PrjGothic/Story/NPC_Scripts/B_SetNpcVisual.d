
func void b_setnpcvisual(var C_NPC slf,var int gender,var string headmesh,var int facetex,var int bodytex,var int armorinstance)
{
	slf.aivar[AIV_GENDER] = gender;
	Mdl_SetVisual(slf,"HUMANS.MDS");
	if(gender == MALE)
	{
		Mdl_SetVisualBody(slf,"hum_body_Naked0",bodytex,0,headmesh,facetex,0,armorinstance);
		if(slf.attribute[ATR_STRENGTH] < 50)
		{
			Mdl_SetModelScale(slf,0.9,1,1);
		};
		if(slf.attribute[ATR_STRENGTH] > 100)
		{
			Mdl_SetModelScale(slf,1.1,1,1);
		};
	}
	else
	{
		if((bodytex >= 0) && (bodytex <= 3))
		{
			bodytex = bodytex + 4;
		};
		Mdl_SetVisualBody(slf,"Hum_Body_Babe0",bodytex,0,headmesh,facetex,0,armorinstance);
	};
};

