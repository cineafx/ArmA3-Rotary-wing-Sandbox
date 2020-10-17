_target = _this select 0;

[_target, 1, ["ACE_SelfActions","sandbox_menu"]] call ace_interact_menu_fnc_removeActionFromObject;
_action = ["sandbox_menu", "Sandbox menu", "\a3\ui_f\data\Map\Diary\Icons\playerGuer_ca.paa", {true}, {true}] call ace_interact_menu_fnc_createAction;
[_target, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;

//everybody always
[_target] call CINE_sandbox_fnc_menuAll;

//enableable by trainers
[_target] call CINE_sandbox_fnc_menuPlayer;
[_target] call CINE_sandbox_fnc_menuVehicle;

//trainer only
[_target] call CINE_sandbox_fnc_menuTrainer;
[_target] call CINE_sandbox_fnc_menuEvaluatee;
[_target] call CINE_sandbox_fnc_menuAllPlayer;
