 /*
	Addon by FYK
 */
 
 player_manager.AddValidModel( "Aviator Mario",     "models/player/assasinge/aviator_mario.mdl" );
 list.Set( "PlayerOptionsModel", "Aviator Mario",   "models/player/assasinge/aviator_mario.mdl" );
 player_manager.AddValidHands( "Aviator Mario", "models/player/assasinge/c_arms_aviator.mdl", 0, "00000000" )
 
 local Category = "Super Mario Odyssey NPCs" 
 
 local NPC = {   Name = "Aviator Mario",
                Class = "npc_citizen",
                Model = "models/player/assasinge/aviator_mario.mdl", 
                Health = "100", 
                KeyValues = { citizentype = 4 }, 
                Weapons = { "weapons_smg1" }, 
                Category = Category }
                               
list.Set( "NPC", "npc_avia_ally", NPC )

local Category = "Super Mario Odyssey NPCs" 
 
local NPC = {   Name = "Aviator Mario Hostile", 
                Class = "npc_combine",
                Model = "models/player/assasinge/aviator_mario.mdl", 
                Health = "100", 
                Weapons = { "weapons_smg1" }, 
                Category = Category }
list.Set( "NPC", "npc_avia_hostile", NPC )