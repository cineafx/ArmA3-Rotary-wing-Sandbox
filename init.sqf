//global vars
missionNamespace setVariable ["instructorUIDs",["76561198098229239"/*cineafx*/, "76561198043206843"/*gadsada*/, "76561198043103580"/*mitens*/, "76561198098139408"/*shroomzeh*/, "76561198024775102"/*v1ru5*/]];
missionNamespace setVariable ["ACE_PRESENT",isClass(configFile >> "CfgPatches" >> "ace_main")];
missionNamespace setVariable ["ALLOW_MENU",false];

if(!isMultiplayer) then {
	{
		deleteVehicle _x;
	} forEach allUnits - allPlayers;
};

//Arsenal
if (ACE_PRESENT) then {
	[arsenal_box, true] call ace_arsenal_fnc_initBox;
	arsenal_box addAction["ACE Arsenal", {[ _this select 0, _this select 1] call ace_arsenal_fnc_openbox;},[],9];
	arsenal_box addAction ["Vanilla Arsenal", {["Open",true] spawn BIS_fnc_arsenal},[],8];
} else {
	arsenal_box addAction ["Arsenal", {["Open",true] spawn BIS_fnc_arsenal},[],8];
};
arsenal_box addAction ["Set Viewdistance to 4k", {setViewDistance 4000},[],6];
arsenal_box addAction ["Set Viewdistance to 8k", {setViewDistance 8000},[],5];
arsenal_box addAction ["Set Viewdistance to 12k", {setViewDistance 12000},[],4];
arsenal_box addAction ["Set Viewdistance to 20k (Slight lag)", {setViewDistance 20000},[],3];
arsenal_box addAction ["Set Viewdistance to 40k (Very high lag)", {setViewDistance 40000},[],2];
arsenal_box addAction ["Reset ACE_GForceCoef (Only use if stuff broke)", {(_this select 1) setVariable ["ACE_GForceCoef", 0.5];},[],2];

//Timemachine box
timeMachine addAction ["Skip time", {createDialog "RscDisplayAttributesModuleSkiptime";},[],9];
timeMachine addAction ["Set date", {createDialog "RscDisplayAttributesModuleSetDate";},[],8,true,true,"",'isClass(configFile >> "CfgPatches" >> "achilles_modules_f_achilles")'];

//setup garage / laptop
garage addaction ["Open Virtual Garage", {[_this select 1, getPos spawn_pad_1] call BIS_fnc_garageNew;}];
garage addaction ["Change Loadout", {[_this select 1] spawn GOM_fnc_aircraftLoadout}];
//_add = garage spawn GOM_fnc_addAircraftLoadoutToObject;

//Better Virtual garage
bis_fnc_garageNew = {
	_caller = _this select 0;
	_pos = _this select 1;

	{deleteVehicle _x;}foreach nearestObjects [_pos, ["AllVehicles"], 15];
	sleep(0.1);
	BIS_fnc_garage_center  = createVehicle [ "Land_HelipadEmpty_F", _pos, [], 0, "CAN_COLLIDE" ];
	[ "Open", true ] call BIS_fnc_garage;
	sleep(2);

	waitUntil{isNull (uinamespace getvariable ["BIS_fnc_arsenal_cam",objnull])};
	sleep(0.1);
	{_caller moveInDriver _x}foreach nearestObjects [_pos, ["AllVehicles"], 10];

	[_caller, _pos] spawn {
		_caller = _this select 0;
		_pos = _this select 1;
		waitUntil{(vehicle _caller) != _caller};
		_vehType = typeOf Vehicle _caller;
		deleteVehicle (Vehicle _caller);
		{deleteVehicle _x;}foreach nearestObjects [_pos, ["AllVehicles"], 15];
		sleep 0.1;
		_veh = createVehicle [_vehType, _pos, [], 0, "CAN_COLLIDE"];
		_caller moveInDriver _veh;
	};
};
