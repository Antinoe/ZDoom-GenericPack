/*
Overlays:
2 - Hands
3 - Gloves
4 - Additional
5 - Weapon
*/

class Shotgun1 : Weapon Replaces Shotgun
{
	bool raised; //Detects whether or not the gun is raised and ready to fire.

    Default
	{
		+WEAPON.NOALERT;
		Weapon.KickBack 50;
		Weapon.AmmoType "Shell";
		Weapon.BobStyle "InverseSmooth";
		Weapon.BobSpeed 2.5;
		Weapon.BobRangeY 0.5;
		Weapon.BobRangeX 0.5;
		Weapon.SlotNumber 3;
		Scale 0.7;
		Inventory.PickupMessage "Picked up a Shotgun.";
	}

    States
    {
      	Spawn:
			SHT1 Z -1;
			Loop;
		Overlay:
			SHT1 A 1;
			Loop;
		Ready:
			TNT1 A 1
			{
				A_WeaponReady(WRF_ALLOWRELOAD);
				A_WeaponReady(WRF_ALLOWZOOM);
				A_WeaponReady(WRF_ALLOWUSER1);
				A_WeaponReady(WRF_ALLOWUSER2);
				A_WeaponReady(WRF_ALLOWUSER3);
				A_WeaponReady(WRF_ALLOWUSER4);
				A_Overlay(5,"Overlay");
				A_OverlayScale(5,1.65,1.65);
			}
			Loop;
		Deselect:
			SHT1 AAAAA 1
			{
				A_WeaponOffset(-10,10,WOF_INTERPOLATE|WOF_ADD);
			}
			SHT1 A 1 A_Lower();
			Wait;
		Select:
			SHT1 A 1 A_Raise();
			Goto Ready;
		Fire:
			TNT1 A 0 A_JumpIfInventory("Z_TokenShotgunFired",1,"Pump");
			//The projectiles and sounds fired.
			TNT1 A 0
			{
				A_StartSound("Weapons/Shotguns/Fire",CHAN_AUTO,CHANF_OVERLAP);
			}
			//The rest of the firing animation.
			//Backward
			TNT1 AAAA 1
			{
				A_GiveInventory("Z_TokenShotgunFired",1);
				A_OverlayScale(5,+0.20,+0.20,WOF_ADD|WOF_INTERPOLATE);
				A_OverlayOffset(5,+7,+3,WOF_ADD|WOF_INTERPOLATE);
				A_OverlayRotate(5,-2,WOF_ADD|WOF_INTERPOLATE);
				A_SetRoll(roll+0.75,SPF_INTERPOLATE);
				A_ZoomFactor(0.975);
			}
			//Forward
			TNT1 AAAA 1
			{
				A_OverlayScale(5,-0.20,-0.20,WOF_ADD|WOF_INTERPOLATE);
				A_OverlayOffset(5,-7,-3,WOF_ADD|WOF_INTERPOLATE);
				A_OverlayRotate(5,+2,WOF_ADD|WOF_INTERPOLATE);
				A_SetRoll(roll-0.75,SPF_INTERPOLATE);
				A_ZoomFactor(1.0);
			}
			Goto Ready;
		Pump:
			TNT1 A 0
			{
				A_StartSound("Weapons/Shotguns/PumpBackward",CHAN_AUTO,CHANF_OVERLAP);
			}
			//Left
			TNT1 AAAAA 1
			{
				A_OverlayScale(5,+0.10,+0.10,WOF_ADD|WOF_INTERPOLATE);
				A_OverlayOffset(5,-5,+5,WOF_ADD|WOF_INTERPOLATE);
				A_OverlayRotate(5,+3,WOF_ADD|WOF_INTERPOLATE);
				A_SetRoll(roll-0.50,SPF_INTERPOLATE);
			}
			TNT1 A 0
			{
				A_StartSound("Weapons/Shotguns/PumpForward",CHAN_AUTO,CHANF_OVERLAP);
			}
			//Right
			TNT1 AAAAA 1
			{
				A_OverlayScale(5,-0.10,-0.10,WOF_ADD|WOF_INTERPOLATE);
				A_OverlayOffset(5,+5,-5,WOF_ADD|WOF_INTERPOLATE);
				A_OverlayRotate(5,-3,WOF_ADD|WOF_INTERPOLATE);
				A_SetRoll(roll+0.50,SPF_INTERPOLATE);
			}
			TNT1 A 0 A_TakeInventory("Z_TokenShotgunFired",1);
			Goto Ready;
		Reload:
			Goto ReloadStart;
		ReloadStart:
			//Up
			TNT1 AAAAA 1
			{
				A_OverlayScale(5,+0.10,+0.10,WOF_ADD|WOF_INTERPOLATE);
				A_OverlayOffset(5,+7,-5,WOF_ADD|WOF_INTERPOLATE);
				A_OverlayRotate(5,-3,WOF_ADD|WOF_INTERPOLATE);
				A_SetRoll(roll+0.50,SPF_INTERPOLATE);
			}
			TNT1 A 5;
			Goto ReloadContinue;
		ReloadContinue:
			TNT1 A 0 A_StartSound("Weapons/Shotguns/ShellLoad",CHAN_WEAPON,CHANF_OVERLAP);
			TNT1 AAA 1
			{
				A_OverlayOffset(5,-2,-2,WOF_ADD|WOF_INTERPOLATE);
				A_SetPitch(pitch-0.2,SPF_INTERPOLATE);
			}
			TNT1 AAA 1
			{
				A_OverlayOffset(5,+2,+2,WOF_ADD|WOF_INTERPOLATE);
				A_SetPitch(pitch+0.2,SPF_INTERPOLATE);
			}
			TNT1 A 5;
			Goto ReloadEnd;
		ReloadEnd:
			//Down
			TNT1 AAAAA 1
			{
				A_OverlayScale(5,-0.10,-0.10,WOF_ADD|WOF_INTERPOLATE);
				A_OverlayOffset(5,-7,+5,WOF_ADD|WOF_INTERPOLATE);
				A_OverlayRotate(5,+3,WOF_ADD|WOF_INTERPOLATE);
				A_SetRoll(roll-0.50,SPF_INTERPOLATE);
			}
			TNT1 A 0 A_SetRoll(0);
			Goto Ready;
	}
}