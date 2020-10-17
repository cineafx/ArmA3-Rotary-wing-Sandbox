_target = _this select 0;
_caller = _this select 1;
missionNamespace setvariable [(str _target + "MenuOpen"), _target addAction["<t color='#FF0000'>MenuOpen</t>", "scripts_vanilla\menu\open.sqf", [], 10, false, false, "", "_target == vehicle _this"] ];