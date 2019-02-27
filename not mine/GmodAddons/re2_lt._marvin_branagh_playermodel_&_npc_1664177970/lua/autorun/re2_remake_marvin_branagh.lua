--Add Playermodel
player_manager.AddValidModel( "RE2 Remake Lt. Marvin Branagh", "models/player/re2_remake_lt_marvin_branagh.mdl" )
player_manager.AddValidHands( "RE2 Remake Lt. Marvin Branagh", "models/arms/re2_remake_lt_marvin_branagh_arms.mdl", 0, "00000000" )

local Category = "RE2"

local NPC =
{
	Name = "RE2 Remake Lt. Marvin Branagh (Friendly)",
	Class = "npc_citizen",
	KeyValues = { citizentype = 4 },
	Model = "models/npc/re2_remake_lt_marvin_branagh_npc.mdl",
	Category = Category
}

list.Set( "NPC", "re2_remake_lt_marvin_branagh_friendly", NPC )

local NPC =
{
	Name = "RE2 Remake Lt. Marvin Branagh (Enemy)",
	Class = "npc_combine_s",
	Numgrenades = "4",
	Model = "models/npc/re2_remake_lt_marvin_branagh_npc.mdl",
	Category = Category
}

list.Set( "NPC", "re2_remake_lt_marvin_branagh_enemy", NPC )
