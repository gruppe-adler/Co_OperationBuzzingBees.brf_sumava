params ["_position"];

// gets executed everywhere

private _nearestPhone = nearestObject [_position, "Land_SatellitePhone_F"];

if (isNull _nearestPhone) exitWith { diag_log "didnt find phone"; };

_nearestPhone setVariable ["grad_answered", false];


[{
    params ["_args", "_handle"];
    _args params ["_nearestPhone", "_ring"];

    if (_nearestPhone getVariable ["grad_answered", false]) exitWith {
        [_handle] call CBA_fnc_removePerFrameHandler;
    };

    private _ring = _nearestPhone say3D (selectRandom ["phoneRing1", "phoneRing2"]);  

    [{
	    params ["_nearestPhone", "_ring"];
        (_nearestPhone getVariable ["grad_answered", false])
    },{
        params ["_nearestPhone", "_ring"];
        deleteVehicle _ring;
    }, [_nearestPhone, _ring], 10] call CBA_fnc_waitUntilAndExecute;        

}, 5, [_nearestPhone, _ring]] call CBA_fnc_addPerFrameHandler;




private _action = _nearestPhone addAction
[
    "Answer phone",    // title
    {
        params ["_target", "_caller", "_actionId", "_arguments"]; // script

		[_target, "radiocall1"] remoteExec ["say3D"];
		_target setVariable ["grad_answered", true, true];

        [_target, "Hey mates, we just saw 3 helicopters flying in your direction. Keep your heads low. If anything happens, retreat to Yuriks office at 0-51 0-19, I repeat 0-51 0-19, he will have company. Borislav, out.", 15] call {
            params ["_unit", "_text", "_distance"];
            [["SATELLITE PHONE", _text, 0]] remoteExec ["BIS_fnc_EXP_camp_playSubtitles", call BIS_fnc_listPlayers select { _x distance _unit < _distance }];
        };

        "mrk_intelradio" setMarkerAlpha 1;

    },
    nil,        // arguments
    1.5,        // priority
    true,       // showWindow
    true,       // hideOnUse
    "",         // shortcut
    "!(_target getVariable ['grad_answered', false])",     // condition
    3,         // radius
    false,      // unconscious
    "",         // selection
    ""          // memoryPoint
];

[{
	params ["_nearestPhone", "_action"];

	_nearestPhone setVariable ["grad_answered", false, true];

}, [_nearestPhone, _action], 5] call CBA_fnc_waitAndExecute;