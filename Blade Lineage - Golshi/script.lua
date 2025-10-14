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

        --Ears physic
    ModelEars = modelHead.Ears
    squapi.ear:new(ModelEars.ear_l_1, ModelEars.ear_r_1, 0.25, nil, nil, false, nil, 0.2, 0.5)
    
    --coat physics
    swinging_physics.swingOnBody(root.Torso.Body.coat_left, 45, {-75,0, -10,0, -10,0})
    swinging_physics.swingOnBody(root.Torso.Body.coat_right, -45, {-75,0, 0,10, 0,10})
    swinging_physics.swingOnBody(root.Torso.Body.coat_back, 180, {-75,0, 5,5, -10,10})

    --Tail physic
    modelBody = root.Torso.Body
    swinging_physics.swingOnBody(modelBody.tail1, 180, {-45,0, 0,0, -10,10})
    swinging_physics.swingOnBody(modelBody.tail1.tail2, 180, {-25,5, 0,0, -10,10})
    swinging_physics.swingOnBody(modelBody.tail1.tail2.tail3, 180, {-15,19, 0,0, -10,10}, modelBody.tail1.tail2, 2)

    --Hairs Physics
    modelHair = modelHead.Hair
     --root hair
    hair_1 = modelHair.hair1
    --2nd layer
    hair_21 = hair_1.hair21
    hair_22 = hair_1.hair22
    -- --3rd layer
    hair_31 = hair_21.hair31
    hair_32 = hair_21.hair32
    hair_33 = hair_22.hair33
    hair_34 = hair_22.hair34
    -- --4th layer
    hair_41 = hair_31.hair41
    hair_42 = hair_31.hair42
    hair_43 = hair_32.hair43
    hair_44 = hair_32.hair44
    hair_45 = hair_33.hair45
    hair_46 = hair_33.hair46
    hair_47 = hair_34.hair47
    hair_48 = hair_34.hair48

    swinging_physics.swingOnHead(hair_1, 90, {-25,0 ,0,0, 0,0})

    swinging_physics.swingOnHead(hair_21, 180, {-25,0 ,0,0, -10,10}, hair_1)
    swinging_physics.swingOnHead(hair_22, 180, {-25,0 ,0,0, -10,10}, hair_1)

    swinging_physics.swingOnHead(hair_31, 180, {-25,5 ,0,0, -15,15}, hair_21)
    swinging_physics.swingOnHead(hair_32, 180, {-25,5 ,0,0, -15,15}, hair_21)
    swinging_physics.swingOnHead(hair_33, 180, {-25,5 ,0,0, -15,15}, hair_22)
    swinging_physics.swingOnHead(hair_34, 180, {-25,5 ,0,0, -15,15}, hair_22)

    swinging_physics.swingOnHead(hair_41, 180, {-25,5 ,0,0, -25,25}, hair_31)
    swinging_physics.swingOnHead(hair_42, 180, {-25,5 ,0,0, -25,25}, hair_31)
    swinging_physics.swingOnHead(hair_43, 180, {-25,5 ,0,0, -25,25}, hair_32)
    swinging_physics.swingOnHead(hair_44, 180, {-25,5 ,0,0, -25,25}, hair_32)
    swinging_physics.swingOnHead(hair_45, 180, {-25,5 ,0,0, -25,25}, hair_33)
    swinging_physics.swingOnHead(hair_46, 180, {-25,5 ,0,0, -25,25}, hair_33)
    swinging_physics.swingOnHead(hair_47, 180, {-25,5 ,0,0, -25,25}, hair_34)
    swinging_physics.swingOnHead(hair_48, 180, {-25,5 ,0,0, -25,25}, hair_34)

    --front hair
    swinging_physics.swingOnHead(modelHair.hair_front, 0, {-5,5, 0,0, 0,5})
    swinging_physics.swingOnHead(modelHair.hair_left, 90, {-5,0, -5,0, -5,0})
    swinging_physics.swingOnHead(modelHair.hair_right, -90, {0,5, 0,5, 0,5})
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