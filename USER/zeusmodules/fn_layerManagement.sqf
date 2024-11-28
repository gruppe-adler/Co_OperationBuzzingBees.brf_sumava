private _reinforcements1 = getMissionLayerEntities "reinforcements1";


_reinforcements1 params [["_objects", []], ["_markers", []], ["_groups", []]];


{ 
	_x hideObjectGlobal true;
} forEach _objects;


[{
	params ["_objects"];
	missionNameSpace getVariable ["buzzingbee_reinforcements1", false]
},{
	params ["_objects", "_groups"];
	{
		_x hideObjectGlobal false;
	} forEach _objects;

	{ 
		_x addWaypoint [[5103.11,1372.12], 0];
		// [_x] call grad_zeusmodules_fnc_simpleConvoy;
	} forEach _groups;

	

}, [_objects, _groups]] call CBA_fnc_waitUntilAndExecute;
