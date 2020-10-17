_target = _this select 0;

[_target, 1, ["ACE_SelfActions","sandbox_menu","trainer_menu","evaluatee_menu"]] call ace_interact_menu_fnc_removeActionFromObject;
_action = ["evaluatee_menu", "Evaluatee menu", "", {true}, {true}] call ace_interact_menu_fnc_createAction;
[_target, 1, ["ACE_SelfActions","sandbox_menu","trainer_menu"], _action] call ace_interact_menu_fnc_addActionToObject;

//[actionid, actionname, statement, condition]

_actions = [
	["repair", "Repairs", "",
		{
			[vehicle evaluatee, 0] remoteExecCall ["setDamage", vehicle evaluatee];
		}, {true;}
	],
	["rearm", "Rearm", "",
		{
			[vehicle evaluatee, 1] remoteExecCall ["setVehicleAmmo", vehicle evaluatee];
		}, {true;}
	],
	["refuel", "Refuel", "",
		{
			[vehicle evaluatee, 1] remoteExecCall ["setFuel", vehicle evaluatee];
		}, {true;}
	],
	["empty_fuel", "Empty fuel", "",
		{
			[vehicle evaluatee, 0] remoteExecCall ["setFuel", vehicle evaluatee];
		}, {true;}
	],
	["destroy_engine", "Destroy engine", "",
		{
			[vehicle evaluatee, ["HitEngine", 1]] remoteExecCall ["setHitPointDamage", vehicle evaluatee];
		}, {true;}
	],
	["destroy_VRotor", "Destroy Tailrotor", "",
		{
			[vehicle evaluatee, ["HitVRotor", 1]] remoteExecCall ["setHitPointDamage", vehicle evaluatee];
		}, {true;}
	],
	["HitFuel", "Destroy fueltank", "",
		{
			[vehicle evaluatee, ["HitFuel", 1]] remoteExecCall ["setHitPointDamage", vehicle evaluatee];
		}, {true;}
	]
];

{
	[_target, 1, ["ACE_SelfActions","sandbox_menu","trainer_menu","evaluatee_menu",(_x select 0)]] call ace_interact_menu_fnc_removeActionFromObject;
	_action = [(_x select 0), (_x select 1), (_x select 2), (_x select 3), (_x select 4)] call ace_interact_menu_fnc_createAction;
	[_target, 1, ["ACE_SelfActions","sandbox_menu","trainer_menu","evaluatee_menu"], _action] call ace_interact_menu_fnc_addActionToObject;
} forEach _actions;
