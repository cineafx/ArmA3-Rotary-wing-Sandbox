

if (!canSuspend) exitWith {};

_projectile = _this select 6;

_markerTrace = "EH_Fired_Bullet";
_cnt = random 50000;
_markerTrace = format ["%1_%2",_markerTrace,_cnt];

_marker = createMarker[_markerTrace,(getPos _projectile)];
_marker setMarkerShape "ICON";
_marker setMarkerType "mil_dot";
_marker setMarkerSize [0.5, 0.5];

_markerHeight = "EH_Fired_Bullet";
_cnt = random 50000+50000;
_markerHeight = format ["%1_%2",_markerHeight,_cnt];

/*
_markerH = createMarker[_markerHeight,(getPos _projectile)];
_markerH setMarkerShape "ICON";
_markerH setMarkerType "mil_dot";
_markerH setMarkerSize [0.5, 0.5];
*/
_timeStart = time;

_impact = [];
_time = 0;
while {alive _projectile} do {
	_time = round ((time - _timeStart) * 10)/10;
	_pos = getPosATL _projectile;

	if (_pos select 2 > 1000) then {
		_marker setMarkerColor "ColorGreen";
	};

	if (_pos select 2 > 500 && _pos select 2 < 1000) then {
		_marker setMarkerColor "ColorYellow";
	};

	if (_pos select 2 > 150 && _pos select 2 < 500) then {
		_marker setMarkerColor "ColorOrange";
	};

	if (_pos select 2 < 150) then {
		_marker setMarkerColor "ColorRed";
	};

	_marker setMarkerPos _pos;
	_marker setMarkerText format ["TOF: %1s",str _time];
	_impact = getPosASL _projectile;

	sleep 0.01;
};

_marker setMarkerText format [""];

[{{deleteMarker _x} forEach [_this # 0];}, [_marker], 15] call CBA_fnc_waitAndExecute;

true
