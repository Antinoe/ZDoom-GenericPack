
class Pistol1 : GenericWeapon Replaces Pistol
{
    Default
	{
		Scale 0.25;
		Weapon.SlotNumber 2;
		Weapon.AmmoType "Clip";
		Inventory.PickupMessage "Picked up a Pistol.";
	}

    States
    {
      	Spawn:
			PIS1 Z -1;
			Loop;
		Weapon:
			PIS1 A 1
			{
				A_OverlayScale(4,1.00,1.00);
				A_OverlayOffset(5,150,120);
			}
			Loop;
		Hand:
			HAN1 A 1
			{
				A_OverlayOffset(5,150,120);
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
				A_Overlay(5,"Hand");
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
			//The projectiles and sounds fired.
			TNT1 A 0
			{
				A_StartSound("Weapons/Pistols/DryFire",CHAN_AUTO,CHANF_OVERLAP);
			}
			//The rest of the firing animation.
			//Backward
			TNT1 A 1
			{
				A_OverlayScale(4,+0.10,+0.10,WOF_ADD|WOF_INTERPOLATE);
				A_OverlayOffset(4,+4,+2,WOF_ADD|WOF_INTERPOLATE);
				A_OverlayRotate(4,-1,WOF_ADD|WOF_INTERPOLATE);
				A_SetRoll(roll+0.25,SPF_INTERPOLATE);
				A_ZoomFactor(0.985);
			}
			//Forward
			TNT1 AA 1
			{
				A_OverlayScale(4,-0.10,-0.10,WOF_ADD|WOF_INTERPOLATE);
				A_OverlayOffset(4,-4,-2,WOF_ADD|WOF_INTERPOLATE);
				A_OverlayRotate(4,+1,WOF_ADD|WOF_INTERPOLATE);
				A_SetRoll(roll-0.25,SPF_INTERPOLATE);
				A_ZoomFactor(1.0);
			}
			//Backward Again
			TNT1 A 1
			{
				A_OverlayScale(4,+0.10,+0.10,WOF_ADD|WOF_INTERPOLATE);
				A_OverlayOffset(4,+4,+2,WOF_ADD|WOF_INTERPOLATE);
				A_OverlayRotate(4,-1,WOF_ADD|WOF_INTERPOLATE);
				A_SetRoll(roll+0.25,SPF_INTERPOLATE);
			}
			TNT1 A 5
			{
			}
			Goto Ready;
		Reload:
			Goto Ready;
	}
}