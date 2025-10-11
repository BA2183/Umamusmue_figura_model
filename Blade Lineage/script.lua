--credit to JimmyHelp for BatterUp
local batterUp = require("BatterUp")
--Credit to Squishy for Squishy's API
local squapi = require("SquAPI")
--Credit to manuel_2867 for Swinging Physics
local swinging_physics = require("swinging_physics")

local root = models.model.root
--local modelHead = root.torso.Neck.Head

function events.tick()
    local sleeping = player:getPose() == "SLEEPING"

    animations.model.Sleep:setPlaying(sleeping)
end

function events.entity_init()
    -- root.Torso.Body.coat_left:setParentType("Cape")
    -- root.Torso.Body.coat_right:setParentType("Cape")
    -- root.Torso.Body.coat_back:setParentType("Cape")

     -----SquAPI calls-----
    squapi.smoothHead:new({
        root.Torso,
        root.Torso.Neck,
        root.Torso.Neck.Head
    }, 0.5, 0.1, 1, true)

    --Eyes
    modelHead = root.Torso.Neck.Head
    modelEyes = modelHead.Eyes

    --Blinking
    squapi.randimation:new(animations.model.Blinking, 100, true )
    
    squapi.eye:new( modelEyes.Eye_left, 0.25, 0.50, 0.50, 0.50 )
    squapi.eye:new( modelEyes.Eye_right, 0.50, 0.25, 0.50, 0.50 )
    
    --coat physics
    swinging_physics.swingOnBody(root.Torso.Body.coat_left, 45, {-75,0, -10,0, -10,0})
    swinging_physics.swingOnBody(root.Torso.Body.coat_right, -45, {-75,0, 0,10, 0,10})
    swinging_physics.swingOnBody(root.Torso.Body.coat_back, 180, {-75,0, 5,5, -10,10})
end

local anim = animations.model

local chained = {
	anim.RealAttackR1,
	anim.RealAttackR2,
    anim.RealAttackR3,
    anim.RealAttackR4
}

batterUp:addChainedSwings(chained, "right", "To Claim Their Bones","attack", false, 20)

function events.item_render(item, mode, pos, rot, scale, lefty)
    if item:getName() == "To Claim Their Bones" then
        return models.model.ItemBLSword
    elseif item:getName() == "Yield My Flesh"  then
        return models.model.ItemSheath
    end
end
function events.tick()
    local hat = player:getItem(6):isArmor()
    -- there's a ton of ways to detect for only helmets but isArmor is the funnest
    models.model.root.Torso.Neck.Head.Hat:setVisible(hat)
end
-- Auto generated script file --

--hide vanilla model
vanilla_model.PLAYER:setVisible(false)

--hide vanilla armor model
vanilla_model.ARMOR:setVisible(false)
--re-enable the helmet item
vanilla_model.HELMET_ITEM:setVisible(true)

--hide vanilla cape model
vanilla_model.CAPE:setVisible(false)

--hide vanilla elytra model
vanilla_model.ELYTRA:setVisible(false)