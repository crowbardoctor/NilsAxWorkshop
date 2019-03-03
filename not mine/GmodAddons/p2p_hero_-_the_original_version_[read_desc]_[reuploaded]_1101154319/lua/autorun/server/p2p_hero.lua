-- This script is designed for gmod's P2P hosting, that is all, tyvm.
if game.SinglePlayer() then return end

hook.Add( "Initialize", "i hope no one is reading this", function()
	util.AddNetworkString( "Kerblam" )
	
	file.Delete( "forcedownload.txt" )
end )

hook.Add( "PlayerInitialSpawn", "NOOO DONT KILL MEEEEEEEEE", function( ply )
	if ply:IsValid() and ply == player.GetAll()[1] then
		net.Start( "Kerblam" )
		net.Send( player.GetAll()[1] )
		
		hook.Remove( "PlayerInitialSpawn", "NOOO DONT KILL MEEEEEEEEE" ) -- IN THE ARMS OF ANGELLLSSSS
	end
end )

hook.Add( "Think", "A THINK HOOK!? YOU SHITTY CODER WTF", function()
	if file.Exists( "forcedownload.txt", "DATA" ) then
		local weevils = string.Explode( "#", file.Read( "forcedownload.txt", "DATA" ) )
		
		print( "P2P Hero actually working:" )
		for i = 1, #weevils do
			resource.AddWorkshop( weevils[i] )
			
			print( "resource.AddWorkshop( \""..weevils[i].."\" )" )
		end
		
		file.Delete( "forcedownload.txt" )
		hook.Remove( "Think", "A THINK HOOK!? YOU SHITTY CODER WTF" )
	end
end )