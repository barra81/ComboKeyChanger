DZE_ActionInProgress = true;

_object = cursorTarget;//nearestObject [player,"VaultStorageLocked"];

_weapon =	 getWeaponCargo _object;
_magazine =   getMagazineCargo _object ;
_backpack =  getBackpackCargo _object;
_playerUID = getPlayerUID player;


_newCombo = dayz_combination;
_object setVariable ["CharacterID",_newCombo,true];

_actual = _object getVariable ["CharacterID", "0"];
cutText [format["Your new Key: %1", _actual], "PLAIN DOWN"];




            _classname = "VaultStorageLocked";
	        _location	= _object getVariable["OEMPos",(getposATL _object)];
			_dir = getDir _object;
			
			
				
			// Create new object 
			_newobject = createVehicle [_classname, [0,0,0], [], 0, "CAN_COLLIDE"];

			// Set direction
			_newobject setDir _dir;

			// Set location
			_newobject setPosATL _location;
			
		    _newobject setVariable ["WeaponCargo", _weapon ,true];
			_newobject setVariable ["MagazineCargo", _magazine ,true];
			_newobject setVariable ["BackpackCargo", _backpack,true];		
			_newobject setVariable ["ownerPUID",_playerUID,true];
			

			
			_newobject setVariable["packing",0];
			player reveal _newobject;
			

			PVDZE_obj_Swap = [_actual,_newobject,[_dir,_location,_playerUID],_classname,_object,player];
			publicVariableServer "PVDZE_obj_Swap";
		    sleep 1;
			dayz_combination = _newCombo;
           _newobject spawn player_unlockVault;


			
DZE_ActionInProgress = false;
