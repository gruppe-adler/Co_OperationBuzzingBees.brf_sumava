if (!isServer) exitWith {};

private _reinforcements1 = getMissionLayerEntities "reinforcements1";
_reinforcements1 params [["_objects1", []], ["_markers", []], ["_groups1", []]];

{ 
	_x hideObjectGlobal true;
} forEach _objects1;

[{
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
			_unitsFound set [_index, _x];
			/*if (_index == 0) then {
				_unitsFound = [_x] + _unitsFound;
			} else {
				systemchat str _unitsFound;
				_unitsFound set [_index, _x];
			};*/
		};
	} forEach _objects;
	// systemchat str _unitsFound;

	[_unitsFound, [5103.11,1372.12]] call grad_zeusmodules_fnc_simpleConvoy;	

}, [_objects1, _groups1]] call CBA_fnc_waitUntilAndExecute;


// 2

private _reinforcements2 = getMissionLayerEntities "reinforcements2";
_reinforcements2 params [["_objects2", []], ["_markers", []], ["_groups2", []]];

{ 
	_x hideObjectGlobal true;
} forEach _objects2;

[{
	missionNameSpace getVariable ["buzzingbee_reinforcements2", false]
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
			_unitsFound set [_index, _x];
			/*if (_index == 0) then {
				_unitsFound = [_x] + _unitsFound;
			} else {
				systemchat str _unitsFound;
				_unitsFound set [_index, _x];
			};*/
		};
	} forEach _objects;
	// systemchat str _unitsFound;

	[_unitsFound, [5766.81,10855.7]] call grad_zeusmodules_fnc_simpleConvoy;	

}, [_objects2, _groups2]] call CBA_fnc_waitUntilAndExecute;


// 3

private _reinforcements3 = getMissionLayerEntities "reinforcements3";
_reinforcements3 params [["_objects3", []], ["_markers", []], ["_groups3", []]];

{ 
	_x hideObjectGlobal true;
} forEach _objects3;

[{
	missionNameSpace getVariable ["buzzingbee_reinforcements3", false]
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
			_unitsFound set [_index, _x];
			/*if (_index == 0) then {
				_unitsFound = [_x] + _unitsFound;
			} else {
				systemchat str _unitsFound;
				_unitsFound set [_index, _x];
			};*/
		};
	} forEach _objects;	
	systemchat str _unitsFound;

	[_unitsFound, [9136.81,11239.7]] call grad_zeusmodules_fnc_simpleConvoy;	

}, [_objects3, _groups3]] call CBA_fnc_waitUntilAndExecute;




// 3

private _reinforcements4 = getMissionLayerEntities "reinforcements4";
_reinforcements4 params [["_objects4", []], ["_markers", []], ["_groups4", []]];

{ 
	_x hideObjectGlobal true;
} forEach _objects4;

[{
	missionNameSpace getVariable ["buzzingbee_reinforcements4", false]
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
			_unitsFound set [_index, _x];
			/*if (_index == 0) then {
				_unitsFound = [_x] + _unitsFound;
			} else {
				systemchat str _unitsFound;
				_unitsFound set [_index, _x];
			};*/
		};
	} forEach _objects;	
	// systemchat str _unitsFound;

	[_unitsFound, [2572.1,6252.99]] call grad_zeusmodules_fnc_simpleConvoy;	

}, [_objects4, _groups4]] call CBA_fnc_waitUntilAndExecute;