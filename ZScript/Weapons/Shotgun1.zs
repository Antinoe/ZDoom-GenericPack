
class Shotgun1 : GenericWeapon Replaces Shotgun
{
    Default
	{
		Scale 0.7;
		Weapon.SlotNumber 3;
		Weapon.AmmoType "Shell";
		Inventory.PickupMessage "Picked up a Shotgun.";
	}

    States
    {
      	Spawn:
			SHT1 Z -1;
			Loop;
		Weapon:
			SHT1 A 1
			{
			}
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
				A_Overlay(4,"Weapon");
				A_OverlayScale(4,1.65,1.65);
			}
			Loop;
		Deselect:
			TNT1 AAAAA 1
			{
				A_OverlayOffset(4,-10,+10,WOF_ADD|WOF_INTERPOLATE);
			}
			TNT1 A 1 A_Lower();
			Wait;
		Select:
			TNT1 A 1 A_Raise();
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
				A_OverlayScale(4,+0.20,+0.20,WOF_ADD|WOF_INTERPOLATE);
				A_OverlayOffset(4,+7,+3,WOF_ADD|WOF_INTERPOLATE);
				A_OverlayRotate(4,-2,WOF_ADD|WOF_INTERPOLATE);
				A_SetRoll(roll+0.75,SPF_INTERPOLATE);
				A_ZoomFactor(0.975);
			}
			//Forward
			TNT1 AAAA 1
			{
				A_OverlayScale(4,-0.20,-0.20,WOF_ADD|WOF_INTERPOLATE);
				A_OverlayOffset(4,-7,-3,WOF_ADD|WOF_INTERPOLATE);
				A_OverlayRotate(4,+2,WOF_ADD|WOF_INTERPOLATE);
				A_SetRoll(roll-0.75,SPF_INTERPOLATE);
				A_ZoomFactor(1.0);
			}
			TNT1 A 5;
			Goto Ready;
		Pump:
			TNT1 A 0
			{
				A_StartSound("Weapons/Shotguns/PumpBackward",CHAN_AUTO,CHANF_OVERLAP);
			}
			//Left
			TNT1 AAAAA 1
			{
				A_OverlayScale(4,+0.10,+0.10,WOF_ADD|WOF_INTERPOLATE);
				A_OverlayOffset(4,-5,+5,WOF_ADD|WOF_INTERPOLATE);
				A_OverlayRotate(4,+3,WOF_ADD|WOF_INTERPOLATE);
				A_SetRoll(roll-0.50,SPF_INTERPOLATE);
			}
			TNT1 A 0
			{
				A_StartSound("Weapons/Shotguns/PumpForward",CHAN_AUTO,CHANF_OVERLAP);
			}
			//Right
			TNT1 AAAAA 1
			{
				A_OverlayScale(4,-0.10,-0.10,WOF_ADD|WOF_INTERPOLATE);
				A_OverlayOffset(4,+5,-5,WOF_ADD|WOF_INTERPOLATE);
				A_OverlayRotate(4,-3,WOF_ADD|WOF_INTERPOLATE);
				A_SetRoll(roll+0.50,SPF_INTERPOLATE);
			}
			TNT1 A 5 A_TakeInventory("Z_TokenShotgunFired",1);
			Goto Ready;
		Reload:
			Goto ReloadStart;
		ReloadStart:
			//Up
			TNT1 AAAAA 1
			{
				A_OverlayScale(4,+0.10,+0.10,WOF_ADD|WOF_INTERPOLATE);
				A_OverlayOffset(4,+7,-5,WOF_ADD|WOF_INTERPOLATE);
				A_OverlayRotate(4,-3,WOF_ADD|WOF_INTERPOLATE);
				A_SetRoll(roll+0.50,SPF_INTERPOLATE);
			}
			TNT1 A 5;
			Goto ReloadContinue;
		ReloadContinue:
			TNT1 A 0 A_StartSound("Weapons/Shotguns/ShellLoad",CHAN_WEAPON,CHANF_OVERLAP);
			TNT1 AAA 1
			{
				A_OverlayOffset(4,-2,-2,WOF_ADD|WOF_INTERPOLATE);
				A_SetPitch(pitch-0.2,SPF_INTERPOLATE);
			}
			TNT1 AAA 1
			{
				A_OverlayOffset(4,+2,+2,WOF_ADD|WOF_INTERPOLATE);
				A_SetPitch(pitch+0.2,SPF_INTERPOLATE);
			}
			TNT1 A 5;
			Goto ReloadEnd;
		ReloadEnd:
			//Down
			TNT1 AAAAA 1
			{
				A_OverlayScale(4,-0.10,-0.10,WOF_ADD|WOF_INTERPOLATE);
				A_OverlayOffset(4,-7,+5,WOF_ADD|WOF_INTERPOLATE);
				A_OverlayRotate(4,+3,WOF_ADD|WOF_INTERPOLATE);
				A_SetRoll(roll-0.50,SPF_INTERPOLATE);
			}
			TNT1 A 0 A_SetRoll(0);
			Goto Ready;
	}
}