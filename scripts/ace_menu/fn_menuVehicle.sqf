_target = _this select 0;

[_target, 1, ["ACE_SelfActions","sandbox_menu","vehicle_menu"]] call ace_interact_menu_fnc_removeActionFromObject;
_action = ["vehicle_menu", "Vehicle menu", "", {true}, {missionNamespace getVariable ["ALLOW_MENU", false] || getPlayerUID _player in instructorUIDs || admin owner _player > 0 || group _player == instructors}] call ace_interact_menu_fnc_createAction;
[_target, 1, ["ACE_SelfActions","sandbox_menu"], _action] call ace_interact_menu_fnc_addActionToObject;

//[actionid, actionname, statement, condition]

_actions = [
	["changepylon", "Change pylons", "",
		{
			_target spawn GOM_fnc_aircraftLoadout;
		}, {true;}
	],
	["repair", "Repairs", "",
		{
			[vehicle _target, 0] remoteExecCall ["setDamage", vehicle _target];
		}, {true;}
	],
	["rearm", "Rearm", "",
		{
			[vehicle _target, 1] remoteExecCall ["setVehicleAmmo", vehicle _target];
		}, {true;}
	],
	["refuel", "Refuel", "",
		{
			[vehicle _target, 1] remoteExecCall ["setFuel", vehicle _target];
		}, {true;}
	],
	["empty_fuel", "Empty fuel", "",
		{
			[vehicle _target, 0] remoteExecCall ["setFuel", vehicle _target];
		}, {true;}
	],
	["destroy_engine", "Destroy engine", "",
		{
			[vehicle _target, ["HitEngine", 1]] remoteExecCall ["setHitPointDamage", vehicle _target];
		}, {true;}
	],
	["destroy_VRotor", "Destroy Tailrotor", "",
		{
			vehicle _target setHitPointDamage ["HitVRotor", 1];
			[vehicle _target, ["HitVRotor", 1]] remoteExecCall ["setHitPointDamage", vehicle _target];
		}, {true;}
	],
	["HitFuel", "Destroy fueltank", "",
		{
			[vehicle _target, ["HitFuel", 1]] remoteExecCall ["setHitPointDamage", vehicle _target];
		}, {true;}
	]
];

{
	[_target, 1, ["ACE_SelfActions","sandbox_menu","vehicle_menu",(_x select 0)]] call ace_interact_menu_fnc_removeActionFromObject;
	_action = [(_x select 0), (_x select 1), (_x select 2), (_x select 3), (_x select 4)] call ace_interact_menu_fnc_createAction;
	[_target, 1, ["ACE_SelfActions","sandbox_menu","vehicle_menu"], _action] call ace_interact_menu_fnc_addActionToObject;
} forEach _actions;
