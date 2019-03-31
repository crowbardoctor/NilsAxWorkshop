if( SERVER ) then
    AddCSLuaFile( "shared.lua" );
end
 
if( CLIENT ) then
    SWEP.PrintName = "Sound Grenade";
    SWEP.Slot = 4;
    SWEP.SlotPos = 4;
    SWEP.DrawAmmo = true;
    SWEP.DrawCrosshair = false;
end
 
if CLIENT then
language.Add("wpn_soundgrenade", "Sound Grenade")
end
 
SWEP.Base               = "weapon_base"
SWEP.Category          = "Stealth Tools"
SWEP.Author         = "Max Shadow"
SWEP.Instructions   = "Left Click: Throw far. \nRight Click: Throw close. \n\nEmits a gunshot sound to attract nearby enemies."
SWEP.Contact        = ""
SWEP.Purpose        = ""
 
SWEP.HoldType = "grenade"
SWEP.ViewModelFOV   = 54
SWEP.ViewModelFlip  = false
 
SWEP.Spawnable          = true
SWEP.AdminSpawnable     = true
SWEP.UseHands			= true

SWEP.ViewModel			= "models/weapons/c_grensnd.mdl"
SWEP.WorldModel			= "models/weapons/w_grensnd.mdl"

game.AddAmmoType( {	name = "sm_soundgrenade", maxcarry = 3} )
if ( CLIENT ) then language.Add( "sm_soundgrenade_ammo", "Sound Grenade" ) end

SWEP.Primary.ClipSize		= -1
SWEP.Primary.DefaultClip	= 1
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "sm_soundgrenade"

SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo		= "none"

//When the script loads, the sound ''Metal.SawbladeStick'' will be precached, 
//and a local variable with the sound name created.
--local ShootSound = Sound("Metal.SawbladeStick")
--killicon.AddFont( "wpn_soundgrenade", "HalfLife2", "4", Color( 255, 80, 0, 255 ) )

function SWEP:Initialize()
	self:SetWeaponHoldType(self.HoldType)
end

function SWEP:DrawWeaponSelection( x, y, wide, tall, alpha )
	// Set us up the texture
	surface.SetDrawColor( color_transparent )
	surface.SetTextColor( 255, 220, 0, alpha )
	surface.SetFont( "CreditsLogo" )
	local w, h = surface.GetTextSize("k")
	
	// Draw that mother
	surface.SetTextPos( x + ( wide / 2 ) - ( w / 2 ),
						y + ( tall / 2 ) - ( h / 2 ) )
	surface.DrawText("k")
	
	self:PrintWeaponInfo(x + wide + 20, y + tall * 0.95, alpha)
end

function SWEP:Reload()
end
 
function SWEP:Think()
end

function SWEP:Deploy()
	self.Weapon:SendWeaponAnim(ACT_VM_DRAW);
	return true
end

function SWEP:Holster(selwep)
	if timer.Exists("anim_timer"..tostring(self.Weapon)) then
		timer.Remove("anim_timer"..tostring(self.Weapon))
	end
	
	return true	
end

function SWEP:PrimaryAttack()
	if ( self.Owner:GetAmmoCount( self:GetPrimaryAmmoType() ) > 0 ) then
		local ent = ents.Create( "ent_soundgrenade" )
		local Forward = self.Owner:EyeAngles():Forward()
		local Right = self.Owner:EyeAngles():Right()
		local Up = self.Owner:EyeAngles():Up()
		ent:SetNetworkedBool( "Active", false )
		ent:SetPos( self.Owner:GetShootPos() + Forward * 8 + Right * 6 + Up * -3)
		ent:SetOwner(self.Owner)
		ent:Spawn()
		ent:Activate()
		ent:GetPhysicsObject():ApplyForceCenter( self.Owner:GetAimVector() * 6000 )
		
		self.Owner:SetAnimation(PLAYER_ATTACK1)
		self.Weapon:SendWeaponAnim( ACT_VM_THROW )
		self.Weapon:SetNextPrimaryFire( CurTime() + 1.2 )
		self.Weapon:SetNextSecondaryFire( CurTime() + 1.2 )

		undo.Create("sound_grenade")
		undo.AddEntity( ent )
		undo.SetPlayer( self.Owner )
		undo.Finish()

		self:TakePrimaryAmmo( 1 )
		timer.Create( "anim_timer"..tostring(self.Weapon), 0.5, 1, function()
			if ( self.Owner:GetAmmoCount( self:GetPrimaryAmmoType() ) <= 0 ) then self.Owner:StripWeapon( self:GetClass() )
			else self.Weapon:SendWeaponAnim( ACT_VM_DRAW ) end
		end)
	end
end
 
function SWEP:SecondaryAttack()
	if ( self.Owner:GetAmmoCount( self:GetPrimaryAmmoType() ) > 0 ) then
		local ent = ents.Create( "ent_soundgrenade" )
		local Forward = self.Owner:EyeAngles():Forward()
		local Right = self.Owner:EyeAngles():Right()
		local Up = self.Owner:EyeAngles():Up()
		ent:SetNetworkedBool( "Active", false )
		ent:SetPos( self.Owner:GetShootPos() + Forward * 8 + Right * 6 + Up * -3)
		ent:SetOwner(self.Owner)
		ent:Spawn()
		ent:Activate()
		ent:GetPhysicsObject():ApplyForceCenter( self.Owner:GetAimVector() * 3000 )
		
		self.Owner:SetAnimation(PLAYER_ATTACK1)
		self.Weapon:SendWeaponAnim( ACT_VM_SECONDARYATTACK )
		self.Weapon:SetNextPrimaryFire( CurTime() + 1.2 )
		self.Weapon:SetNextSecondaryFire( CurTime() + 1.2 )

		undo.Create("sound_grenade")
		undo.AddEntity( ent )
		undo.SetPlayer( self.Owner )
		undo.Finish()

		self:TakePrimaryAmmo( 1 )
		timer.Create( "anim_timer"..tostring(self.Weapon), 0.5, 1, function()
			if ( self.Owner:GetAmmoCount( self:GetPrimaryAmmoType() ) <= 0 ) then self.Owner:StripWeapon( self:GetClass() )
			else self.Weapon:SendWeaponAnim( ACT_VM_DRAW ) end
		end)
	end
end

function SWEP:CanPrimaryAttack()
	return true
end

function SWEP:CanSecondaryAttack()
	return true
end