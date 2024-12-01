params ["_intel", ["_index", 0]];


private _texts = ["
FROM: OperationsHQ@redveil.io\n
TO: FieldCommand@redveil.io\n
SUBJECT: Status Update: Lipova Lhota\n
\n
Command,\n
\n
The forward base at Lipova Lhota is operational and fully stocked.\n
The recent shipment of munitions has been distributed as instructed,\n
with additional reserves stored in the main depot. Patrol schedules\n
have been updated to account for increased traffic in the area.\n
\n
Our regional handler will arrive tomorrow to inspect the site.\n
Ensure all personnel are briefed and ready. Discreet coordination\n
with local sympathizers has been successful—no external\n
interference has been reported thus far.\n
\n
Priority Task: Begin preparing the southern approach for fallback\n
positions in case of emergency. Lipova Lhota must remain secure\n
until phase two is complete.\n
\n
Do not use this channel for further updates. Switch to\n
secure comms as of 1900 hours.\n
\n",
"mrk_inteloffice_4"];


private _texture = "#(rgb,2048,2048,3)text(0,0,""LucidaConsoleB"",0.025,""#ffffff"",""#262626""," + "\n\n\n\n\n\n\n" + _texts#_index#0 + ")";

_intel setvariable ["bis_fnc_initInspectable_data",[_texture,_texts#_index#0,"",1]];



//--- Add action
if (isnil {_intel getvariable "bis_fnc_initInspectable_actionID"}) then {
    private _actionID = [
        //--- 0: Target
        _intel,

        //--- 1: Title
        localize "STR_A3_Functions_F_Orange_Examine",

        //--- 2: Idle Icon
        "\a3\Ui_f\data\IGUI\Cfg\HoldActions\holdAction_search_ca.paa",

        //--- 3: Progress Icon
        "\a3\Ui_f\data\IGUI\Cfg\HoldActions\holdAction_search_ca.paa",

        //--- 4: Condition Show
        "_this distance _target < 3",

        //--- 5: Condition Progress
        nil,

        //--- 6: Code Start
        {},

        //--- 7: Code Progress
        {
            _progressTick = _this select 4;
            if (_progressTick % 2 == 0) exitwith {};
            playsound3d [((getarray (configfile >> "CfgSounds" >> "Orange_Action_Wheel" >> "sound")) param [0,""]) + ".wss",player,false,getposasl player,1,0.9 + 0.2 * _progressTick / 24];
        },

        //--- 8: Code Completed
        {[_this select 0,true] call bis_fnc_initInspectable;
        // copyToClipboard str _this;
        (_this select 3 select 0) setMarkerAlpha 1; // args is #3 whyever
        "Marked location on map" call CBA_fnc_notify;
        },

        //--- 9: Code Interrupted
        {},

        //--- 10: Arguments
        [_texts#_index#1],

        //--- 11: Duration
        0.5,

        //--- 12: Priority
        nil,

        //--- 13: Remove When Completed
        false
    ] call bis_fnc_holdActionAdd;
    _intel setvariable ["bis_fnc_initInspectable_actionID",_actionID];
};
