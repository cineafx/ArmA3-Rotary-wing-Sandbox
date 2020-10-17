params ["_newUnit", "_oldUnit", "_respawn", "_respawnDelay"];

if (ACE_PRESENT) then {
	[_newUnit] call CINE_sandbox_fnc_menuSetup;
} else {
	[_newUnit] execVM "scripts_vanilla\setup.sqf";
};

//only apply loadout on first spawn.
if (isNull _oldUnit) then {
  if (ACE_PRESENT) then {
		_newUnit setVariable ["ACE_GForceCoef", 0.5];
		_newUnit setUnitLoadout [[],[],[],["U_B_HeliPilotCoveralls",[["ACE_Flashlight_XL50",1],["ACE_MapTools",1],["ACE_microDAGR",1],["ACE_packingBandage",4],["ACE_morphine",1],["ACE_epinephrine",1],["ACE_tourniquet",1]]],["V_TacVest_blk",[["SmokeShell",2,1],["SmokeShellPurple",2,1]]],[],"H_PilotHelmetHeli_B","",[],["ItemMap","ItemGPS","ItemRadio","ItemCompass","ItemWatch","NVGoggles"]];
	} else {
		_newUnit setUnitLoadout [[],[],[],["U_B_HeliPilotCoveralls",[["FirstAidKit",3]]],["V_TacVest_blk",[["SmokeShell",2,1],["SmokeShellPurple",2,1]]],[],"H_PilotHelmetHeli_B","",[],["ItemMap","ItemGPS","ItemRadio","ItemCompass","ItemWatch","NVGoggles"]];
	};
};
