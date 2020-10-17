//[player] call CINE_sandbox_fnc_laserTarget

params[["_remoteTarget", ace_player]];

{
  private _target = ace_player;
  _handler = _target getVariable["drawVisibleLaserTargetsHandler",-1];
  if (_handler >= 0) then {
    [_handler] call CBA_fnc_removePerFrameHandler;
    _handler = -1;
  } else {
    _handler = [{call CINE_sandbox_fnc_drawVisibleLaserTargets}, 0] call CBA_fnc_addPerFrameHandler;
  };
  _target setVariable ["drawVisibleLaserTargetsHandler", _handler];

} remoteExecCall ["call", _remoteTarget, false];

true;



/*
_arr = [];
for "_i3" from 1 to 8 do {
  for "_i4" from 1 to 8 do {
    _arr pushBack (parseNumber format["11%1%2", _i3, _i4]);
  };
};
*/
