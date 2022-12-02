/*
Overlays:
2 - Hands (Under Weapon)
3 - Clothing (Under Weapon)
4 - Weapon
5 - Hands (Over Weapon)
6 - Clothing (Over Weapon)
*/

class Z_TokenRaise : Inventory
{
	Default
	{
		Inventory.MaxAmount 1;
	}
}
class Z_TokenShotgunFired : Inventory
{
	Default
	{
		Inventory.MaxAmount 1;
	}
}


class GenericWeapon : Weapon
{
	bool raised; //Detects whether or not the gun is raised and ready to fire.

    Default
	{
		+WEAPON.NOALERT;
		Weapon.BobStyle "InverseSmooth";
		Weapon.BobSpeed 2.5;
		Weapon.BobRangeY 0.5;
		Weapon.BobRangeX 0.5;
	}
}