*Code was initially taken from https://forums.bohemia.net/forums/topic/205205-multiplayer-compatible-virtual-garage/ but modified by myself*

# Requirements

You must have markers placed with the following variable names.

```
garageTempspawn
garageGroundspawn
garagePlanespawn
garageStaticspawn
garageWaterspawn
garageHelispawn
```

## To Whitelist

To whitelist vehicles in the vehicle arsenal you must have a marker called `VehicleGarageWhiteList` with the init of the marker containing an array of vehicle class names you can use.

Easy way to get this, is spawn the vehicles down in the editor, select all and right click -> copy class names to clipboard (or the name of the button)