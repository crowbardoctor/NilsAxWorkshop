AddCSLuaFile()

EFFECT.Material = Material( "stealth/calm.png" )

function EFFECT:Init( data )	
	self.EndTime = CurTime() + 2
	self.Entity = data:GetEntity()
	
	self.Height = 75
	self.EndHeight = 85
	
	self.Alpha = 255
end

function EFFECT:DoRemove()	
	self.Remove = true
end

function EFFECT:Render()
	render.SetMaterial( self.Material )
	self.Height = Lerp( FrameTime() * 5, self.Height, self.EndHeight)
	
	if ( ( self.EndTime - CurTime() ) < 0.5 ) then
		self.Alpha = math.Clamp( Lerp( FrameTime() * 7, self.Alpha, 0 ), 0, 255 )
	end
	
	if IsValid(self.Entity) then
		render.DrawSprite( self.Entity:GetPos() + Vector( 0, 0, self.Height ), 16, 16, Color( 255, 255, 255, self.Alpha )  )
	end
end

function EFFECT:Think()
	if IsValid(self.Entity) then
		self:SetPos( self.Entity:GetPos() )
	end
	
	if self.Remove == true then return false end
	
	return self.EndTime > CurTime()
end