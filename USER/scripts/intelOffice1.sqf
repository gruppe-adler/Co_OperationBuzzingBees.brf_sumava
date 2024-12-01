params ["_intel", ["_index", 0]];


private _texts = 
[
    ["
FROM: LogisticsOps@redveil.io\n
TO: HarbringerHQ@redveil.io\n
SUBJECT: Monthly Report - U Sv Antonina\n
\n
Harbringer,\n
\n
As expected, the latest transfers to red veil accounts went\n
through without issue. Your oversight on funds and recruitment\n
is noted and appreciated. Ensure all activities remain discrete,\n
and maintain your security detail around the clock.\n
\n
Reminder: The next $25,000 transfer is scheduled for processing\n
next week. Any delay will raise suspicion.\n
\n
Keep your logs secured in your office. No margin for error.\n
\n
Ivan\n
", "mrk_inteloffice_0"],
["FROM: CourierDivision@redveil.io\n
TO: ShepherdComm@redveil.io\n
SUBJECT: Delivery Instructions\n
\n
Shepherd,\n
\n
Your last communication raised concerns. Are there issues\n
at Hradesice Church? This level of silence is unusual for you.\n
\n
You are tasked with delivering the package to the handler\n
on schedule. Ensure no records of this transaction exist—digital\n
or physical. If compromised, we will send you backup from\n
Bilovky area.\n
Don't fuck this up!\n
\n
Courier Division\n",
"mrk_inteloffice_1"],
["FROM: InfluenceOps@redveil.io\n
TO: SilentVoiceHQ@redveil.io\n
SUBJECT: Community Operations\n
\n
Silent Voice,\n
\n
Your influence in the market district is proving invaluable.\n
The locals continue to trust you, which helps keep external\n
interest at bay. Ensure the new propaganda materials are\n
distributed before the weekend.\n
\n
Regarding your recent meetings: use the dead mailbox in Maly Bors\n
Church tombstone for all sensitive discussions. The main sanctuary\n
must remain accessible to the public to maintain your cover.\n
\n
Report any changes in local sentiment immediately. The town must\n
stay under control.\n
\n",
"mrk_inteloffice_2"],
["FROM: TacticalOps@redveil.io\n
TO: TorchbearerHQ@redveil.io\n
SUBJECT: Arms Stockpile Update\n
\n
Torchbearer,\n
\n
We’ve confirmed the arrival of the latest shipment at Kliment.\n
Secure the cache in the graveyard hut until further\n
instructions. You’ll be notified when it’s time to move the\n
supplies to the new staging area.\n
\n
Be advised: we’ve intercepted chatter about enemy reconnaissance\n
near your location. Expect potential intrusions. Hold your\n
position and prepare your team to defend the site.\n
\n
Maintain radio silence unless absolutely necessary.\n
\n",
"mrk_inteloffice_3"]
];




private _texture = "#(rgb,2048,2048,3)text(0,0,""LucidaConsoleB"",0.025,""#ffffff"",""#262626""," + "\n\n\n\n\n\n\n" + _texts#_index#0 + ")";

_intel setvariable ["bis_fnc_initInspectable_data",[_texture,_texts#_index#0,"",1]];

_intel setObjectTexture ["monitor", _texture];


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
