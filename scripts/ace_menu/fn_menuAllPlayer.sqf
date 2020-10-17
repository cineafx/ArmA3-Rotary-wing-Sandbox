_target = _this select 0;

[_target, 1, ["ACE_SelfActions","sandbox_menu","trainer_menu","allplayer_menu"]] call ace_interact_menu_fnc_removeActionFromObject;
_action = ["allplayer_menu", "All players menu", "", {true}, {true}] call ace_interact_menu_fnc_createAction;
[_target, 1, ["ACE_SelfActions","sandbox_menu","trainer_menu"], _action] call ace_interact_menu_fnc_addActionToObject;

//[actionid, actionname, statement, condition]

_actions = [
	["repair", "Repairs", "",
		{
			{vehicle player setDamage 0} remoteExecCall ["call", 0];
		}, {true;}
	],
	["rearm", "Rearm", "",
		{
			{vehicle player setVehicleAmmo 1} remoteExecCall ["call", 0];
		}, {true;}
	],
	["refuel", "Refuel", "",
		{
			{vehicle player setFuel 1} remoteExecCall ["call", 0];
		}, {true;}
	],
	["empty_fuel", "Empty fuel", "",
		{
			{vehicle player setFuel 0} remoteExecCall ["call", 0];
		}, {true;}
	],
	["destroy_engine", "Destroy engine", "",
		{
			{vehicle player setHitPointDamage ["HitEngine", 1]} remoteExecCall ["call", 0];
		}, {true;}
	],
	["destroy_VRotor", "Destroy Tailrotor", "",
		{
			{vehicle player setHitPointDamage ["HitVRotor", 1]} remoteExecCall ["call", 0];
		}, {true;}
	],
	["HitFuel", "Destroy fueltank", "",
		{
			{vehicle player setHitPointDamage ["HitFuel", 1]} remoteExecCall ["call", 0];
		}, {true;}
	]
];

{
	[_target, 1, ["ACE_SelfActions","sandbox_menu","trainer_menu","allplayer_menu",(_x select 0)]] call ace_interact_menu_fnc_removeActionFromObject;
	_action = [(_x select 0), (_x select 1), (_x select 2), (_x select 3), (_x select 4)] call ace_interact_menu_fnc_createAction;
	[_target, 1, ["ACE_SelfActions","sandbox_menu","trainer_menu","allplayer_menu"], _action] call ace_interact_menu_fnc_addActionToObject;
} forEach _actions;
