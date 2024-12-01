if (!isServer) exitWith {};

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
	
	// sort leader to beginning
	private _unitsFound = [];
	{ 
		private _index = _x getVariable ["grad_convoy_index", -1];
		if (_index > -1) then {
			if (_index == 0) then {
				_unitsFound = [_x] + _unitsFound;
			} else {
				_unitsFound pushBack _x;
			};
		};
	} forEach _objects;	

	[_unitsFound, [5103.11,1372.12]] call grad_zeusmodules_fnc_simpleConvoy;	

}, [_objects, _groups]] call CBA_fnc_waitUntilAndExecute;
