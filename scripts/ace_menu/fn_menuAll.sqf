_target = _this select 0;

[_target, 1, ["ACE_SelfActions", "sandbox_menu", "all_menu"]] call ace_interact_menu_fnc_removeActionFromObject;
_action = ["all_menu", "All menu", "", {true}, {true}] call ace_interact_menu_fnc_createAction;
[_target, 1, ["ACE_SelfActions", "sandbox_menu"], _action] call ace_interact_menu_fnc_addActionToObject;

//[actionid, actionname, statement, condition]

_actions = [
	["laserTarget", "Toggle laser spotting", "",
		{
			[player] call CINE_sandbox_fnc_laserTarget
		}, {true;}
	],
	["trackShell", "Enable projectile tracker (own vehicle)", "",
		{
			(vehicle _target) addEventHandler ['Fired', {_this spawn CINE_sandbox_fnc_trackShell;}];
		}, {true;}
	],
	["viewdistance_4000", "Set viewdistance: 4000", "",
		{
			setViewDistance 4000;
			setObjectViewDistance 4000; 
		}, {true;}
	],
	["viewdistance_8000", "Set viewdistance: 8000", "",
		{
			setViewDistance 8000;
			setObjectViewDistance 8000;
		}, {true;}
	]
];

{
	[_target, 1, ["ACE_SelfActions","sandbox_menu","all_menu",(_x select 0)]] call ace_interact_menu_fnc_removeActionFromObject;
	_action = [(_x select 0), (_x select 1), (_x select 2), (_x select 3), (_x select 4)] call ace_interact_menu_fnc_createAction;
	[_target, 1, ["ACE_SelfActions","sandbox_menu","all_menu"], _action] call ace_interact_menu_fnc_addActionToObject;
} forEach _actions;
