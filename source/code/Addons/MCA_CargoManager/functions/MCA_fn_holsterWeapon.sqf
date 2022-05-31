// MCA_fn_holsterWeapon.sqf.

params ["_user"];

_user action ['SwitchWeapon', _user, _user, 100];

if (canSuspend) then
{
	waitUntil {currentWeapon _user == "" or {primaryWeapon _user == "" && handgunWeapon _user == ""}};
};
