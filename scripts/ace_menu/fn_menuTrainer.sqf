_target = _this select 0;

[_target, 1, ["ACE_SelfActions", "sandbox_menu", "trainer_menu"]] call ace_interact_menu_fnc_removeActionFromObject;
_action = ["trainer_menu", "Trainer menu", "", {true}, {getPlayerUID _player in instructorUIDs || admin owner _player > 0 || group _player == instructors}] call ace_interact_menu_fnc_createAction;
[_target, 1, ["ACE_SelfActions", "sandbox_menu"], _action] call ace_interact_menu_fnc_addActionToObject;

//[actionid, actionname, statement, condition]

_actions = [
	["allow_menu_f", "Disallow menu for all", "\a3\ui_f\data\gui\RscCommon\RscCheckBox\CheckBox_checked_ca.paa",
		{
			missionNamespace setVariable ["ALLOW_MENU", false];
		}, {
			missionNamespace getVariable ["ALLOW_MENU", false];
		}
	],
	["allow_menu_t", "Allow menu for all", "\a3\ui_f\data\gui\RscCommon\RscCheckBox\CheckBox_unchecked_ca.paa",
		{
			missionNamespace setVariable ["ALLOW_MENU", true];
		}, {
			!(missionNamespace getVariable ["ALLOW_MENU", false]);
		}
	]
];

{
	[_target, 1, ["ACE_SelfActions","sandbox_menu","trainer_menu",(_x select 0)]] call ace_interact_menu_fnc_removeActionFromObject;
	_action = [(_x select 0), (_x select 1), (_x select 2), (_x select 3), (_x select 4)] call ace_interact_menu_fnc_createAction;
	[_target, 1, ["ACE_SelfActions","sandbox_menu","trainer_menu"], _action] call ace_interact_menu_fnc_addActionToObject;
} forEach _actions;
