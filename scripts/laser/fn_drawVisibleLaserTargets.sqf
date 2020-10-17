
private _seekerVehicle = vehicle ace_player;
private _testSeekerPosASL = AGLtoASL (_seekerVehicle modelToWorldVisual [0,0,1]);
private _testSeekerDir = vectorDirVisual _seekerVehicle;
{
  private _code = _x;
  private _results = [_testSeekerPosASL, _testSeekerDir, 45, 10000, [1550,1550], _code, _seekerVehicle] call ace_laser_fnc_seekerFindLaserSpot;
  private _resultPos = _results select 0;
  if (!isNil "_resultPos") then {
    drawLine3D [ASLtoAGL _testSeekerPosASL, ASLtoAGL _resultPos, [0,0,1,1]];
    drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\select_target_ca.paa", [0,0,1,1], (ASLtoAGL _resultPos), 1.5, 1.5, 45, format ["%1 from %2", _code, _results select 1], 0.5, 0.025, "TahomaB"];
  };
} forEach [1111,1112,1113,1114,1115,1116,1117,1118,1121,1122,1123,1124,1125,1126,1127,1128,
            1131,1132,1133,1134,1135,1136,1137,1138,1141,1142,1143,1144,1145,1146,1147,1148,
            1151,1152,1153,1154,1155,1156,1157,1158,1161,1162,1163,1164,1165,1166,1167,1168,
            1171,1172,1173,1174,1175,1176,1177,1178,1181,1182,1183,1184,1185,1186,1187,1188];


[ace_laser_laserEmitters, {
  _value params ["_obj", "_owner", "_laserMethod", "_waveLength", "_laserCode", "_beamSpread"];

  if (_laserMethod isEqualTo "ace_laser_fnc_findLaserSource") then {
    private _targetObject = _obj getVariable ["ace_laser_targetObject", objNull];
    private _targetPosASL = getPosASL _targetObject;
    drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\select_target_ca.paa", [1,0,0,1], (ASLtoAGL _targetPosASL), 0.5, 0.5, 0, "", 0.5, 0.025, "TahomaB"];

    (_value call ace_laser_fnc_findLaserSource) params ["_laserPosASL", "_laserDir"];
    private _resultsRay = [_laserPosASL, _laserDir, _obj] call ace_laser_fnc_shootRay;

    private _rayPos = _resultsRay select 0;
    if (isNil "_rayPos") then {
      drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\select_target_ca.paa", [1,0,0,1], (ASLtoAGL _targetPosASL), 2, 2, 0, "Nil Ray", 0.5, 0.025, "TahomaB"];
    } else {
      private _diff = _rayPos vectorDistance (getPosASL _targetObject);
      drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\select_target_ca.paa", [1,0,0,1], (ASLtoAGL _rayPos), 2, 2, 0, format ["Diff %1",_diff], 0.5, 0.025, "TahomaB"];
    };
  };

  if ((_laserMethod isEqualType []) && {(count _laserMethod) == 2}) then {
    _laserMethod params ["_modelPosition", "_weaponName"];
    private _laserPosASL = AGLtoASL (_obj modelToWorldVisual _modelPosition);
    drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\select_target_ca.paa", [1,1,0,1], (ASLtoAGL _laserPosASL), 0.5, 0.5, 0, _weaponName, 0.5, 0.025, "TahomaB"];
    private _laserDir = _obj weaponDirection _weaponName;
    private _resultsRay = [_laserPosASL, _laserDir, _obj] call ace_laser_fnc_shootRay;
    private _rayPos = _resultsRay select 0;
    if (!isNil "_rayPos") then {
      drawIcon3D ["\a3\ui_f\data\IGUI\Cfg\Cursors\select_target_ca.paa", [1,1,0,1], (ASLtoAGL _rayPos), 2, 2, 0, _weaponName, 0.5, 0.025, "TahomaB"];
    };
  };
}] call CBA_fnc_hashEachPair;
