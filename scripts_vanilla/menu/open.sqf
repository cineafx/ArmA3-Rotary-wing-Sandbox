_target = _this select 0;
_caller = _this select 1;
_id = _this select 2;


_MenuOpen = missionNamespace getvariable (str _target + "MenuOpen");
_target removeAction _MenuOpen;
missionNamespace setvariable [(str _target + "MenuClose"), _target addAction["<t color='#FF0000'>Close Menu</t>","scripts_vanilla\menu\close.sqf", [], 10, false, false, "", "_target == vehicle _this"] ];

missionNamespace setvariable [(str _target + "VA"), _target addAction ["<t color='#00FF00'>Virtual Arsenal</t>", {["Open",true] spawn BIS_fnc_arsenal}, [], 10, false, false, "", "_target == vehicle _this"] ];
missionNamespace setvariable [(str _target + "Tele"), _target addAction ["<t color='#FFFF00'>Teleport</t>","scripts_vanilla\tele.sqf", [], 10, false, false, "", "_target == vehicle _this"] ];


missionNamespace setvariable [(str _target + "Repair"), _target addAction["Repair", "scripts_vanilla\menu\items\repair.sqf", [], 10, false, false, "", "_target == vehicle _this"] ];
missionNamespace setvariable [(str _target + "Rearm"), _target addAction["Rearm", "scripts_vanilla\menu\items\rearm.sqf", [], 10, false, false, "", "_target == vehicle _this"] ];
missionNamespace setvariable [(str _target + "Refuel"), _target addAction["Refuel", "scripts_vanilla\menu\items\refuel.sqf", [], 10, false, false, "", "_target == vehicle _this"] ];
missionNamespace setvariable [(str _target + "EmptyFuel"), _target addAction["Empty fuel", "scripts_vanilla\menu\items\empty_fuel.sqf", [], 10, false, false, "", "_target == vehicle _this"] ];
missionNamespace setvariable [(str _target + "DestroyEngine"), _target addAction["Destroy engine", "scripts_vanilla\menu\items\destroy_engine.sqf", [], 10, false, false, "", "_target == vehicle _this"] ];
missionNamespace setvariable [(str _target + "DestroyTailrotor"), _target addAction["Destroy tailrotor", "scripts_vanilla\menu\items\destroy_tailrotor.sqf", [], 10, false, false, "", "_target == vehicle _this"] ];
missionNamespace setvariable [(str _target + "GodOn"), _target addAction["godmode on", "scripts_vanilla\menu\items\god_on.sqf", [], 10, false, false, "", "_target == vehicle _this"] ];
missionNamespace setvariable [(str _target + "GodOff"), _target addAction["godmode off", "scripts_vanilla\menu\items\god_off.sqf", [], 10, false, false, "", "_target == vehicle _this"] ];
