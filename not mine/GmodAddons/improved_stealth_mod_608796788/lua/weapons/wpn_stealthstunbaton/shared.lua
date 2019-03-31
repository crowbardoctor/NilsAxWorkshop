if( SERVER ) then
    AddCSLuaFile( "shared.lua" );
end
 
if( CLIENT ) then
    SWEP.PrintName = "Stealth Stun Baton";
    SWEP.Slot = 0;
    SWEP.SlotPos = 4;
    SWEP.DrawAmmo = false;
    SWEP.DrawCrosshair = false;
end
 
if CLIENT then
language.Add("wpn_stealthstunbaton", "Stealth Stun Baton")
end
 
SWEP.Base               = "weapon_base"
SWEP.Category          = "Stealth Tools"
SWEP.Author         = "Max Shadow"
SWEP.Instructions   = "Left Click: Swing. \n\nStuns enemies in one hit."
SWEP.Contact        = ""
SWEP.Purpose        = ""
 
SWEP.HoldType = "melee"
SWEP.ViewModelFOV   = 54
SWEP.ViewModelFlip  = false
 
SWEP.Spawnable          = true
SWEP.AdminSpawnable     = true
SWEP.UseHands			= true
   
SWEP.ViewModel      = "models/weapons/c_stthbaton.mdl"
SWEP.WorldModel   = "models/weapons/w_stthbaton.mdl"
   
-------------Primary Fire Attributes----------------------------------------
SWEP.Primary.ClipSize       = -1
SWEP.Primary.DefaultClip    = -1
SWEP.Primary.Automatic      = true
SWEP.Primary.Ammo           = "none"
  
-------------Secondary Fire Attributes-------------------------------------
SWEP.Secondary.ClipSize     = -1
SWEP.Secondary.DefaultClip  = -1
SWEP.Secondary.Automatic    = false
SWEP.Secondary.Ammo         = "none"

function SWEP:Initialize()
	self:SetWeaponHoldType(self.HoldType)
end

function SWEP:DrawWeaponSelection( x, y, wide, tall, alpha )
		// Set us up the texture
		surface.SetDrawColor( color_transparent )
		surface.SetTextColor( 255, 220, 0, alpha )
		surface.SetFont( "CreditsLogo" )
		local w, h = surface.GetTextSize("n")
		
		// Draw that mother
		surface.SetTextPos( x + ( wide / 2 ) - ( w / 2 ),
							y + ( tall / 2 ) - ( h / 2 ) )
		surface.DrawText("n")
		
		self:PrintWeaponInfo(x + wide + 20, y + tall * 0.95, alpha)
end
 
function SWEP:Precache()
	
	util.PrecacheSound(Sound( "Weapon_StunStick.Melee_Hit" ))
	util.PrecacheSound("weapons/iceaxe/iceaxe_swing1.wav")
	
end
 
function SWEP:Deploy()
	self.Weapon:SendWeaponAnim(ACT_VM_DRAW);
    return true;
end
 
function SWEP:ImpactEffect( traceHit )

	local data = EffectData();
	data:SetNormal( traceHit.HitNormal );
	data:SetOrigin( traceHit.HitPos + ( traceHit.HitNormal * 4.0 ) );
	util.Effect( "StunstickImpact", data );

end
 
function SWEP:MakeSleep(target, bone)
	local ragent = ents.Create("prop_ragdoll")
	ragent:SetModel(target:GetModel())
	ragent:SetSkin(target:GetSkin())
	ragent:SetMaterial(target:GetMaterial())
	ragent:SetPos(target:GetPos())
	ragent:GetTable().ang2 = target:GetAngles()
	npccolor = target:GetColor()
	ragent:SetColor(Color(npccolor.r,npccolor.g,npccolor.b,npccolor.a))
	ragent:Spawn()
	ragent:SetName(target:GetName())
	ragent:SetNWString("sm_NPCclass",target:GetClass())
	ragent:SetNWInt("sm_NPChealth",target:Health())
	ragent:SetNWString("sm_NPCname",target:GetName())
	if IsValid(target:GetActiveWeapon()) then
		ragent:SetNWString("sm_NPCweapon",target:GetActiveWeapon():GetClass())
		local wep = ents.Create("cycler") 
		wep:SetModel( target:GetActiveWeapon():GetModel() )
		wep:SetParent(ragent)
		wep:AddEffects( EF_BONEMERGE )
		wep:Spawn()
	end
	for i = 0,32 do
		ragent:SetBodygroup(i,target:GetBodygroup(i))
	end
	-- Copy bone position
	for i = 0, ragent:GetPhysicsObjectCount( ) do
		local physobj = ragent:GetPhysicsObjectNum( i )
		if (physobj) and IsValid(physobj)then
			local pos, ang = target:GetBonePosition( target:TranslatePhysBoneToBone( i ) )
			physobj:SetPos(pos)
			physobj:SetAngles(ang)
			physobj:EnableMotion(true)
			if i == bone then physobj:ApplyForceCenter((target:GetPos() - self.Owner:GetPos())*100) end
		end
	end
	local sleeptime = GetConVarNumber("stealth_sleeptime")
	ragent:SetNWBool("sm_sleepingNPC",true)
	ragent:SetNWFloat("sm_sleepinit",CurTime())
	ragent:SetNWFloat("sm_sleeptime",sleeptime)
	target:Remove()
	timer.Create("wake_time_"..ragent:EntIndex(),sleeptime,1,function()
		if IsValid(ragent) and ragent:GetNWInt("sm_NPChealth") > 0 then
			-- Spawning the NPC again
			local npc = ents.Create(ragent:GetNWString("sm_NPCclass"))
			npc:SetPos(ragent:GetPos())
			if !(ragent:GetTable().ang2 == nil) then
				npc:SetAngles(ragent:GetTable().ang2)
			end
			if !(ragent:GetNWString("sm_NPCweapon") == nil) then
				npc:SetKeyValue("additionalequipment",ragent:GetNWString("sm_NPCweapon"))
			end
			npc:SetSkin(ragent:GetSkin())
			npc:Activate()
			npc:Spawn()
			npc:SetModel(ragent:GetModel())
			npc:SetMaterial(ragent:GetMaterial())
			npc:SetColor(Color(ragent:GetColor().r,ragent:GetColor().g,ragent:GetColor().b,ragent:GetColor().a))
			npc:SetName(ragent:GetNWString("sm_NPCname"))
			npc:SetHealth(ragent:GetNWInt("sm_NPCHealth"))
			for i = 0,32 do
				npc:SetBodygroup(i,ragent:GetBodygroup(i))
			end
			ragent:Remove()
		end 
	end)
end

function StunnedDamage(npc, dmginfo)
	if npc:GetNWBool("sm_sleepingNPC") == true and !(dmginfo:GetDamageType()==DMG_CRUSH)  then
		npc:SetNWInt("sm_NPChealth",npc:GetNWInt("sm_NPChealth") - dmginfo:GetDamage())
		local effectdata = EffectData()
		effectdata:SetStart( dmginfo:GetDamagePosition( ) ) 
		effectdata:SetAngles( npc:GetAngles() )
		effectdata:SetOrigin( dmginfo:GetDamagePosition( ) )
		effectdata:SetScale( 1 )
		util.Effect( "BloodImpact", effectdata )
		if npc:GetNWInt("sm_NPChealth") <= 0 then
			hook.Run( "AddCorpse", npc)
			npc:SetNWBool("sm_sleepingNPC", false)
		end
	end
end

hook.Add("EntityTakeDamage","StunnedTakesDamage",StunnedDamage)
 
function SWEP:PrimaryAttack()
    if( !self:CanPrimaryAttack() ) then return; end
    self.Weapon:SetNextPrimaryFire( CurTime() + .5 );
    local trace = self.Owner:GetEyeTrace();
    if trace.HitPos:Distance(self.Owner:GetShootPos()) <= 75 then
		self.Weapon:EmitSound(Sound( "Weapon_StunStick.Melee_Hit" ))
		self.Owner:SetAnimation( PLAYER_ATTACK1 );
		self.Weapon:SendWeaponAnim( ACT_VM_HITCENTER );
		if( trace.Entity:IsNPC() and trace.Entity:GetNWBool("sm_stealthNPC") == true ) then
			self:MakeSleep(trace.Entity, trace.PhysicsBone)
        else
			bullet = {}
			bullet.Num    = 1
			bullet.Src    = self.Owner:GetShootPos()
			bullet.Dir    = self.Owner:GetAimVector()
			bullet.Spread = Vector(0, 0, 0)
			bullet.Tracer = 0
			bullet.Force  = 1
			bullet.Damage = 10
			self.Owner:FireBullets(bullet)
		end
		self:ImpactEffect( trace );
    else
        self.Owner:SetAnimation( PLAYER_ATTACK1 );
        self.Weapon:SendWeaponAnim( ACT_VM_MISSCENTER );
        self.Weapon:EmitSound("weapons/iceaxe/iceaxe_swing1.wav")
    end
end

function SWEP:SecondaryAttack()
	return false
end

function SWEP:Reload()
	return false
end

function SWEP:CanPrimaryAttack()
	return true
end

function SWEP:CanSecondaryAttack()
	return false
end