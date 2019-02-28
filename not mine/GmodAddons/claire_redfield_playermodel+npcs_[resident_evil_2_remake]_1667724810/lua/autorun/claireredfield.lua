 /*
	Addon by FYK
 */
 
 player_manager.AddValidModel( "Claire Redfield",     "models/player/assasinge/claireredfield.mdl" );
 list.Set( "PlayerOptionsModel", "Claire Redfield",   "models/player/assasinge/claireredfield.mdl" );
 player_manager.AddValidHands( "Claire Redfield", "models/player/assasinge/c_arms_claire.mdl", 0, "00000000" )
 
 local Category = "Resident Evil 2" 
 
 local NPC = {   Name = "Claire Redfield",
                Class = "npc_citizen",
                Model = "models/player/assasinge/claireredfield.mdl", 
                Health = "100", 
                KeyValues = { citizentype = 4 }, 
                Weapons = { "weapons_smg1" }, 
                Category = Category }
                               
list.Set( "NPC", "npc_clai_ally", NPC )

local Category = "Resident Evil 2" 
 
local NPC = {   Name = "Claire Redfield Hostile", 
                Class = "npc_combine",
                Model = "models/player/assasinge/claireredfield.mdl", 
                Health = "100", 
                Weapons = { "weapons_smg1" }, 
                Category = Category }
list.Set( "NPC", "npc_clai_hostile", NPC )