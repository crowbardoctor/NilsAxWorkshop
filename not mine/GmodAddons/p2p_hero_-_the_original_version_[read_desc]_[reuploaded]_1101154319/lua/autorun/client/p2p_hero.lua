-- This script is designed for gmod's P2P hosting, that is all, tyvm.
if game.SinglePlayer() then return end

net.Receive( "Kerblam", function( len, pl )
	for i = 1, #engine.GetAddons() do
		local Vrooom = table.ToString(engine.GetAddons()[i])
		local Waaaam = string.Explode( "wsid=\"", Vrooom )
		local BAAAAM = string.Explode( "\"", Waaaam[2] )
		
		if !file.Exists( "forcedownload.txt", "DATA" ) and steamworks.ShouldMountAddon( BAAAAM[1] ) then
			file.Write( "forcedownload.txt", BAAAAM[1] )
		elseif steamworks.ShouldMountAddon( BAAAAM[1] ) then
			file.Append( "forcedownload.txt", "#"..BAAAAM[1] )
		end
	end
end )