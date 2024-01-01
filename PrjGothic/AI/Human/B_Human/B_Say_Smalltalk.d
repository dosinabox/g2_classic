
func void b_say_smalltalk()
{
	var int random;
	var int choice;
	random = Hlp_Random(120);
	if(random < 5)
	{
		b_say(self,self,"$SMALLTALK01");
	}
	else if(random < 10)
	{
		b_say(self,self,"$SMALLTALK02");
	}
	else if(random < 15)
	{
		b_say(self,self,"$SMALLTALK03");
	}
	else if(random < 20)
	{
		b_say(self,self,"$SMALLTALK04");
	}
	else if(random < 25)
	{
		b_say(self,self,"$SMALLTALK05");
	}
	else if(random < 30)
	{
		b_say(self,self,"$SMALLTALK06");
	}
	else if(random < 35)
	{
		b_say(self,self,"$SMALLTALK07");
	}
	else if(random < 40)
	{
		b_say(self,self,"$SMALLTALK08");
	}
	else if(random < 45)
	{
		b_say(self,self,"$SMALLTALK09");
	}
	else if(random < 50)
	{
		b_say(self,self,"$SMALLTALK10");
	}
	else if(random < 55)
	{
		b_say(self,self,"$SMALLTALK11");
	}
	else if(random < 60)
	{
		b_say(self,self,"$SMALLTALK12");
	}
	else if(random < 65)
	{
		b_say(self,self,"$SMALLTALK13");
	}
	else if(random < 70)
	{
		b_say(self,self,"$SMALLTALK14");
	}
	else if(random < 75)
	{
		b_say(self,self,"$SMALLTALK15");
	}
	else if(random < 80)
	{
		b_say(self,self,"$SMALLTALK16");
	}
	else if(random < 85)
	{
		b_say(self,self,"$SMALLTALK17");
	}
	else if(random < 90)
	{
		b_say(self,self,"$SMALLTALK18");
	}
	else if(random < 95)
	{
		b_say(self,self,"$SMALLTALK19");
	}
	else if(random < 100)
	{
		b_say(self,self,"$SMALLTALK20");
	}
	else if(random < 105)
	{
		b_say(self,self,"$SMALLTALK21");
	}
	else if(random < 110)
	{
		if((self.guild == GIL_NOV) || (self.guild == GIL_PAL) || (self.guild == GIL_KDF))
		{
			choice = Hlp_Random(2);
			if(choice == 0)
			{
				b_say(self,self,"$SMALLTALK28");
			}
			else
			{
				b_say(self,self,"$SMALLTALK22");
			};
		}
		else if((self.guild == GIL_BDT) || (self.guild == GIL_SLD) || (self.guild == GIL_DJG))
		{
			choice = Hlp_Random(2);
			if(choice == 0)
			{
				b_say(self,self,"$SMALLTALK25");
			}
			else
			{
				b_say(self,self,"$SMALLTALK22");
			};
		}
		else
		{
			b_say(self,self,"$SMALLTALK22");
		};
	}
	else if(random < 115)
	{
		if((self.guild == GIL_NOV) || (self.guild == GIL_PAL) || (self.guild == GIL_KDF))
		{
			choice = Hlp_Random(2);
			if(choice == 0)
			{
				b_say(self,self,"$SMALLTALK29");
			}
			else
			{
				b_say(self,self,"$SMALLTALK23");
			};
		}
		else if((self.guild == GIL_BDT) || (self.guild == GIL_SLD) || (self.guild == GIL_DJG))
		{
			choice = Hlp_Random(2);
			if(choice == 0)
			{
				b_say(self,self,"$SMALLTALK26");
			}
			else
			{
				b_say(self,self,"$SMALLTALK23");
			};
		}
		else
		{
			b_say(self,self,"$SMALLTALK23");
		};
	}
	else
	{
		if((self.guild == GIL_NOV) || (self.guild == GIL_PAL) || (self.guild == GIL_KDF))
		{
			choice = Hlp_Random(2);
			if(choice == 0)
			{
				b_say(self,self,"$SMALLTALK30");
			}
			else
			{
				b_say(self,self,"$SMALLTALK24");
			};
		}
		else if((self.guild == GIL_BDT) || (self.guild == GIL_SLD) || (self.guild == GIL_DJG))
		{
			choice = Hlp_Random(2);
			if(choice == 0)
			{
				b_say(self,self,"$SMALLTALK27");
			}
			else
			{
				b_say(self,self,"$SMALLTALK24");
			};
		}
		else
		{
			b_say(self,self,"$SMALLTALK24");
		};
	};
};

