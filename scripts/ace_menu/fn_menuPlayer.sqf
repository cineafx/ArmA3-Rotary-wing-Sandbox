_target = _this select 0;

[_target, 1, ["ACE_SelfActions", "sandbox_menu", "player_menu"]] call ace_interact_menu_fnc_removeActionFromObject;
_action = ["player_menu", "Player menu", "", {true}, {missionNamespace getVariable ["ALLOW_MENU", false] || getPlayerUID _player in instructorUIDs || admin owner _player > 0 || group _player == instructors}] call ace_interact_menu_fnc_createAction;
[_target, 1, ["ACE_SelfActions", "sandbox_menu"], _action] call ace_interact_menu_fnc_addActionToObject;

//[actionid, actionname, statement, condition]

_actions = [
	["arsenal", "Open arsenal", "",
		{
			[arsenal_box, _target] call ace_arsenal_fnc_openbox;
		}, {true;}
	],
	["garage", "Spawn garage", "",
		{
			_pad = createVehicle ["Land_HelipadCircle_F", getPos _target, [], 0, "CAN_COLLIDE"];
			_veh = createVehicle ["PortableHelipadLight_01_white_F", _pad getRelPos[-6.2,0], [], 0, "CAN_COLLIDE"];
			_veh allowDamage false;
			_veh addaction ["Open Virtual Garage", {
													[_this select 1, (_this select 0) getRelPos[6.2,0]] call BIS_fnc_garageNew;
													deleteVehicle (_this select 0);
													deleteVehicle nearestObject [getPos (_this select 0), "Land_HelipadCircle_F"];
													}];
		}, {true;}
	],
	["slingtarget", "Spawn slingload target", "",
		{
			_pos = _target getRelPos[10,0];
			_pos set [2,0];
			_slingtarget = createVehicle ["FlexibleTank_01_forest_F", _pos, [], 0, "CAN_COLLIDE"];
		}, {true;}
	],
	["teleport", "Teleport", "",
		{
			titleText["Select Map Position", "PLAIN"];
			onMapSingleClick "vehicle player setPos _pos; onMapSingleClick '';true;";
		}, {true;}
	],
	["god_on", "Enable Godmode", "",
		{
			_target allowDamage false;
			[vehicle _target, false] remoteExecCall ["allowDamage", vehicle _target];
		}, {true;}
	],
	["god_off", "Disable Godmode", "",
		{
			_target allowDamage true;
			[vehicle _target, true] remoteExecCall ["allowDamage", vehicle _target];
		}, {true;}
	]
];

{
	[_target, 1, ["ACE_SelfActions","sandbox_menu","player_menu",(_x select 0)]] call ace_interact_menu_fnc_removeActionFromObject;
	_action = [(_x select 0), (_x select 1), (_x select 2), (_x select 3), (_x select 4)] call ace_interact_menu_fnc_createAction;
	[_target, 1, ["ACE_SelfActions","sandbox_menu","player_menu"], _action] call ace_interact_menu_fnc_addActionToObject;
} forEach _actions;
