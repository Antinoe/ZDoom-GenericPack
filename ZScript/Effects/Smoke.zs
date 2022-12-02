class GunSmokeSpawner : Actor
{
	Default
	{
		Speed 20;
		+NOCLIP
		+DONTSPLASH
	}
	States
	{
		Spawn:
			TNT1 A 1;
			TNT1 A 0 Thing_ChangeTID(0,390);
			TNT1 AA 0 A_CustomMissile ("GunSmoke", 0, 0, random (0, 360), 2, random (0, 180));
			Stop;
	}
}

class GunSmoke : Actor
{
	Default
	{
		+NOGRAVITY
		+NOBLOCKMAP
		+FLOORCLIP
		+FORCEXYBILLBOARD
		+NOINTERACTION
		+FORCEXYBILLBOARD
		+DONTSPLASH
		+MISSILE
		Speed 1;
		//RenderStyle Add;
		Alpha 0.1;
		+CLIENTSIDEONLY
		Radius 0;
		Height 0;
		Scale 0.6;
	}
	States
	{
		Spawn:
			SMK1 AABBCCDDEEFFGGHHIIJJKKLLMMNNOOPPQQRR 1 A_FadeOut(0.001);
			TNT1 A 0;
			Stop;
	}
}




class BarrelSmoke : Actor
{
	Default
	{
		+NOGRAVITY
		+NOBLOCKMAP
		+FLOORCLIP
		+FORCEXYBILLBOARD
		+NOINTERACTION
		+FORCEXYBILLBOARD
		+DONTSPLASH
		+MISSILE
		Speed 1;
		//RenderStyle Add;
		Alpha 0.4;
		+CLIENTSIDEONLY
		Radius 0;
		Height 0;
		Scale 0.01;
	}
states
	{
		Spawn:
			SM21 ABCDEFGHIJKLMNOPQRSTUVWXYZ 1 A_Fadeout (0.006);
			SM22 ABCDEFGHIJK 1 A_Fadeout (0.006);
			wait;
	}
}



class PlasmaSmoke : Actor
{
	Default
	{
		+NOBLOCKMAP
		+NOGRAVITY
		+ALLOWPARTICLES
		+RANDOMIZE
		//RenderStyle Translucent;
		Alpha 0.15;
		VSpeed 8;
		Mass 5;
	}
	States
	{
		Spawn:
			TNT1 A 1;
			SMK1 ABCDEFGHIJKLMNOPQRSTUVWXYZ 2 A_FadeOut(0.001);
			TNT1 A 0;
			Stop;
	}
}