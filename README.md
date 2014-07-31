ComboKeyChanger
===============
Copy the whole folder "ckc" into your missionfile.pbo



_______________________________________________________________________________________________________________________________________
in your description.ext


add


#include "ckc\ckc_defines.hpp"
#include "ckc\ckc_ui.hpp"
#include "ckc\ckc_SafeUI.hpp"

at the very bottom

________________________________________________________________________________________________________________________________________
in your compiles.sqf


add


ckc_button     =	compile preprocessFileLineNumbers "ckc\ckc_button.sqf";
ckc_upddoor    =        compile preprocessFileLineNumbers "ckc\ckc_upddoor.sqf";
ckc_updSafe    =        compile preprocessFileLineNumbers "ckc\ckc_updSafe.sqf";

below


player_unlockDoor      =        compile preprocessFileLineNumbers "\z\addons\dayz_code\compile\player_unlockDoor.sqf";



_________________________________________________________________________________________________________________________________________
in your fn_selfActions.sqf


add 


//Allow owner to change Door code

if((_isDestructable || _cursorTarget isKindOf "Land_DZE_WoodDoorLocked_Base" || _cursorTarget isKindOf "CinderWallDoorLocked_DZ_Base") && (DZE_Lock_Door == _ownerID)) then {
		if ((s_player_lastTarget select 1) != _cursorTarget) then {
			if (s_player_ckc > 0) then {	
				player removeAction s_player_ckc;
				s_player_ckc = -1;
			};
		};

		if (s_player_ckc < 0) then {
			s_player_lastTarget set [1,_cursorTarget];	
		        s_player_ckc = player addaction["Set new Code", "ckc\ckc_startUI.sqf","",0,false,true,"", ""];
		};
	} else {
		player removeAction s_player_ckc;
		s_player_ckc = -1;
	};



//Allow owner to change vault code

_unlockedVault = ["VaultStorage"];

	if(typeOf(cursortarget) in _unlockedVault && _ownerID != "0" && (player distance _cursorTarget < 2)) then {
	
	if (s_player_Safe_ckc < 0) then {
	if ((typeOf(cursortarget) == "VaultStorage") &&(_ownerID == dayz_combination || _ownerID == dayz_playerUID)  ) then {
     
	 //if (s_player_Safe_ckc < 0 && (_ownerID == dayz_combination || _ownerID == dayz_playerUID)) then {
			
			s_player_Safe_ckc = player addaction["Set new Code", "ckc\ckc_startSafeUI.sqf","",1,false,true,"", ""];
		};
		};
	} else {
		player removeAction s_player_Safe_ckc;
		s_player_Safe_ckc = -1;

	};


ABOVE



             //Allow owner to pack vault




----------------------------------------------------------------------------------------------------------------------------------------------
in your fn_selfActions.sqf


add


        player removeAction s_player_ckc;
	s_player_ckc = -1;
        player removeAction s_player_Safe_ckc;
        s_player_Safe_ckc = -1;


below



	player removeAction s_player_upgrade_build;
	s_player_upgrade_build = -1;
	player removeAction s_player_maint_build;
	s_player_maint_build = -1;
	player removeAction s_player_downgrade_build;
	s_player_downgrade_build = -1;
