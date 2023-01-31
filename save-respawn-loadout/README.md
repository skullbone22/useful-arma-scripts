
# Save Respawn Loadout

Copy the file [`OnPlayerRespawn.sqf`](./onPlayerRespawn.sqf) into the root directory of the mission file. Where `mission.ext` will be.

Then copy the following code into the Int of any object you want to have the action on. (Excluding the ACE interaction, how to set up is explained later)

<br/>

## Customizability

* You can customize the action's color by changing the value of `#28B463` to any HTML Color. You can find HTML colors [here](https://htmlcolorcodes.com). *(For ACE interact, the icon will not be colored, just the text)*

* You can customize the image which would be replacing `\a3\ui_f\data\igui\cfg\Actions\gear_ca.paa` with another image found in an Arma 3 PBO (How to/examples to be added)

* You can customize the text by changing where it says `Save Loadout`

<br/>

### Save Respawn On Object

``` sqf
this addAction[
    "<t color='#28B463'>
        <img image='\a3\ui_f\data\igui\cfg\Actions\gear_ca.paa' /> 
        Save Loadout
    </t>",
    {player setVariable ["Saved_Loadout",getUnitLoadout player]}
]
```

<hr/>

### Save Respawn On Object ACE 

*This requires Ace to be installed*

This code can be put into the init of any object, but will only effect those of the class `I_supplyCrate_F` change this to affect different object (Warning: It will effect all objects of this class). It can also be placed directly into the `init.sqf` file of mission (this file must be located in the root directory of your mission).

``` sqf
_saveRespawnLoadout = [
	"Save Respawn Loadout",
	"<t color='#28B463'>Save Respawn Loadout<t/>",
	 "\a3\ui_f\data\igui\cfg\Actions\gear_ca.paa",
	 {player setVariable ["Saved_Loadout",getUnitLoadout player]},
	 {true}
	] call ace_interact_menu_fnc_createAction;
	
["I_supplyCrate_F", 0, ["ACE_MainActions"], _saveRespawnLoadout, true] call ace_interact_menu_fnc_addActionToClass; 
```

<hr />

### Save Respawn In Area

This Code must be placed inside of a trigger area in the `On Activation` with the following settings:
- Type: `none`
- Activation: `Any Player`
- Activation Type: `Present`

To ensure the option is removed when a player walks out of the area, ensure to add the second block of code.

``` sqf
// On Activation
{
    _x addAction[
        "<t color='#28B463'>
            <img image='\a3\ui_f\data\igui\cfg\Actions\gear_ca.paa' /> 
            Save Loadout
        </t>",
        {player setVariable ["Saved_Loadout",getUnitLoadout player]}
    ]
} forEach thislist
```

``` sqf
// On Deactivation
player removeAction 0
```