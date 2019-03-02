local function AddPlayerModel( name, model )

    list.Set( "PlayerOptionsModel", name, model )
    player_manager.AddValidModel( name, model )
    player_manager.AddValidHands( "Alyx_Enhanced", "models/sirgibs/arms/c_arms_alyx.mdl", 0, "00000000" )
end

AddPlayerModel( "Alyx_Enhanced", "models/sirgibs/ragdolls/hl2/alyx_enhanced_player.mdl" )

//list.Set( "PlayerOptionsAnimations", "CSS_Phoenix_Enhanced", { "idle_knife" } )
