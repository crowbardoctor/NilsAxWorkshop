AddCSLuaFile( "cl_init.lua" )
AddCSLuaFile( "shared.lua" )
include('shared.lua')

function ENT:Initialize()
	
	self.Entity:SetModel("models/weapons/w_pxsr.mdl")
	
	self:PhysicsInit(SOLID_VPHYSICS)
	self.Entity:SetMoveType( MOVETYPE_VPHYSICS )
	self.Entity:SetSolid( SOLID_VPHYSICS )
	self.Entity:DrawShadow( false )
	self.Entity:SetCollisionGroup( COLLISION_GROUP_WEAPON )
	
	local phys = self.Entity:GetPhysicsObject()
	if (phys:IsValid()) then
		phys:Wake()
		phys:SetMass(6.5)
		phys:SetDamping(0.1,5)
	end
	
	self:SetFriction(3)
	
	self.phase = 1
	self.timeleft = CurTime() + 2 -- HOW LONG BEFORE TURNING ON
	self:Think()
end

 function ENT:Think()
	
	if self.timeleft < CurTime() then
		if self.phase == 1 then self:TurnOn()
		elseif self.phase == 2	then self:Remove() end
	end

	self.Entity:NextThink( CurTime() )
	return true
end

function ENT:TurnOn()
	self.phase = 2

	if not IsValid(self.Owner) then
		self.Entity:Remove()
		return
	end
	
	self.Entity:EmitSound( "items/battery_pickup.wav", 100, 80, 1, CHAN_AUTO )

	hook.Run( "TurnOnSensor", self, true )

	self.timeleft = CurTime() + GetConVarNumber("stealth_sensortime")
end

/*---------------------------------------------------------
OnTakeDamage
---------------------------------------------------------*/
function ENT:OnTakeDamage( dmginfo )
end


/*---------------------------------------------------------
Use
---------------------------------------------------------*/
function ENT:Use( activator, caller, type, value )
end


/*---------------------------------------------------------
StartTouch
---------------------------------------------------------*/
function ENT:StartTouch( entity )
end


/*---------------------------------------------------------
EndTouch
---------------------------------------------------------*/
function ENT:EndTouch( entity )
end


/*---------------------------------------------------------
Touch
---------------------------------------------------------*/
function ENT:Touch( entity )
end