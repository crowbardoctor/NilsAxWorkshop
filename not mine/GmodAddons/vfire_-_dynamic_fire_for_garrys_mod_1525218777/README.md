vFire adds a realistic, firey experience to Garry's Mod.

Default fire is replaced by one that looks and behaves like the real thing - it grows, spreads, attaches to surfaces, animates, and burns everything (it can) to a crisp.

_________________________________________________________________________

### Features
- Fires are spawned by igniting props and explosions
- Fires of different sizes, automatic growth and spread based on what is being burnt
- Fires grow bigger if fed with any flamable object: wood, rubber, cardboard, plastic, etc.
- Fires attach to any surface or character
- Light and glow effects
- NPCs respond to being burnt by running around screaming in pain
- Fires are affected by wind depending on their environment
- Physical fire balls
- Custom scorch decals of different sizes
- Tickrate throttling and spacial clustering for optimization purposes

### Client Console Commands
- vfire_lod: Set to 0 to disable all fire LODs, 1 for automatic LODs, and 2 to force LODs on.
- vfire_enable_glows: Set to 0 to disable fire glow effects.
- vfire_enable_lights: Set to 0 to disable all fire light effects for increased performance at the cost of visual fidelity.
- vfire_light_brightness: Set the fire light brightness multiplier.
- vfire_default_visual_settings: Reset all visual settings to default values.

### Server Console Commands
- vfire_spread_boost: Set the spread boost of new fires. Higher values will achieve faster, and stronger spread.
- vfire_enable_damage: Set to 0 to disable fire damage.
- vfire_enable_damage_in_vehicles: Set to 1 to damage players inside burning vehicles.
- vfire_damage_multiplier: Set the damage multiplier for fires, 0 disables all damage.
- vfire_enable_explosion_fires: Set to 0 to disable explosions creating fire.
- vfire_enable_explosion_effects: Set to 0 to disable fancy explosion effects, won't work if explosion fires is off.
- vfire_enable_decals: Set to 0 to disable fire decals.
- vfire_decal_probability: Set the probability (a value between 0 and 1) of creating fire decals.
- vfire_enable_spread: Set to 0 to disable fire spread.
- vfire_spread_delay: Set fire spread delay in seconds - the smaller the number the faster fires will spread.
- vfire_decay_rate: Set fire decay rate, 1 is max decay rate, 0 is no decay rate.
- vfire_affect_npcs: Set to 0 to disable custom NPC behavior.
- vfire_remove_all: Remove all active fires.
- vfire_default_settings: Reset all settings to default values.

_________________________________________________________________________

vFire comes with its very own flamethrower, available at: https://steamcommunity.com/sharedfiles/filedetails/?id=1525572545 and a Dragon Breath shotgun available at: https://steamcommunity.com/sharedfiles/filedetails/?id=1643778026

Fires are best extinguished with: https://steamcommunity.com/sharedfiles/filedetails/?id=104607228 - any other extinguisher SWEP will also extinguish fires - but immediately.

_________________________________________________________________________

### vFire Interface for Developers
Want to create a new SWEP or Tool? vFire can be easily integrated by developers into any server or addon using a simple interface - please see the 'vFire Interface for Developers' section on the Facepunch thread: https://forum.facepunch.com/f/gmodaddon/btrqa/vFire-Dynamic-Fire/1/

### Reporting Bugs
If you're experiencing crashes, any sort of errors, or invisible fires, please temporarily disable all of your addons using the Addons > Disable All button, re-enable vFire, and see if the problem persists. If the problem persists, please open a discussion describing the problem (and steps to reproduce) in detail. If the problem is gone, then other addons are in conflict with vFire; the problem is outside vFire's scope.

### Concerned about performance?
vFire utilizes a handful of optimization techinques including spacial clustering, prioritization based server and client tickrate throttling, automatic LOD transitions, and more to maximize performance - clients are even more worry free if they set gmod_mcore_test to 1.
In case that's not enough, you can always use both the provided client and server ConVars to effectively minimize loads, and set vFire to match your requirements. Server owners are recommended to use the vfire_decay_rate setting to make fires die faster to decrease load accumulation.

_________________________________________________________________________

### Credits
Valve is the author of the sounds and spritecards used - I did everything else.
