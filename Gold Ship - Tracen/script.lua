-- Auto generated script file --

--hide vanilla model
vanilla_model.PLAYER:setVisible(false)
vanilla_model.ARMOR:setVisible(false)
vanilla_model.CAPE:setVisible(false)
vanilla_model.ELYTRA:setVisible(false)

local root = models.model.root

--Credit to Squishy for making Squishy's API
local squapi = require("SquAPI")
--Credit to manuel_2867 for making Swinging Physics
local swinging_physics = require("swinging_physics")

function events.tick()
    local sleeping = player:getPose() == "SLEEPING"
    local gliding = player:getPose() == "FALL_FLYING"

    animations.model.sleep:setPlaying(sleeping)
    animations.model.flying:setPlaying(gliding)
end

function events.entity_init()
     -----SquAPI calls-----
    squapi.smoothHead:new({
        root.torso,
        root.torso.Neck,
        root.torso.Neck.Head
    }, 0.5, 0.1, 1, true)

    --Eyes
    modelHead = root.torso.Neck.Head
    modelEyes = modelHead.Eyes
    
    squapi.eye:new( modelEyes.l_eye, 0.25, 0.75, 0.50, 0.50 )
    squapi.eye:new( modelEyes.r_eye, 0.75, 0.25, 0.50, 0.50 )

    --Blinking
    squapi.randimation:new(animations.model.blinking, 100, true )

    --Idle Tail
    squapi.randimation:new(animations.model.tail_idle, 500, true )

    --Idle Ears
    squapi.randimation:new(animations.model.ear_idle, 200, false)

    --Ears physic
    squapi.ear:new(modelHead.ear_l_1, modelHead.ear_r_1, 0.25, nil, nil, false, nil, nil, nil)

    --Chest physics
    modelBody =  root.torso.Body
    squapi.bewb:new(modelBody.Chest, 
    2, --(2) bendability
    0.05, --(0.05) stiff
    0.8, --(0.9) bounce
    true, --(true) doIdle
    2, --(4) idleStrength
    1, --(1) idleSpeed
    -5, --(-10) downLimit
    25  --(25) upLimit
    )

    -- --Chest bow physics
    -- swinging_physics.swingOnBody(modelBody.Chest.bows.ribbon_up_left, 0)
    -- swinging_physics.swingOnBody(modelBody.Chest.bows.ribbon_up_right, 0)
    -- swinging_physics.swingOnBody(modelBody.Chest.bows.ribbon_down_left, 0)
    -- swinging_physics.swingOnBody(modelBody.Chest.bows.ribbon_down_right, 0)

    --Tail physic
    swinging_physics.swingOnBody(modelBody.tail1, 180, {-45,0, 0,0, -10,10})
    swinging_physics.swingOnBody(modelBody.tail1.tail2, 180, {-25,5, 0,0, -10,10}, modelBody.tail1, 1)
    swinging_physics.swingOnBody(modelBody.tail1.tail2.tail3, 180, {-15,19, 0,0, -10,10}, modelBody.tail1.tail2, 2)

    --Hairs Physics
     --root hair
    hair_1 = modelHead.hair1
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

    swinging_physics.swingOnBody(hair_1, 90, {-25,0 ,0,0, 0,0})

    swinging_physics.swingOnBody(hair_21, 180, {-25,0 ,0,0, -10,10}, hair_1)
    swinging_physics.swingOnBody(hair_22, 180, {-25,0 ,0,0, -10,10}, hair_1)

    swinging_physics.swingOnBody(hair_31, 180, {-25,5 ,0,0, -15,15}, hair_21)
    swinging_physics.swingOnBody(hair_32, 180, {-25,5 ,0,0, -15,15}, hair_21)
    swinging_physics.swingOnBody(hair_33, 180, {-25,5 ,0,0, -15,15}, hair_22)
    swinging_physics.swingOnBody(hair_34, 180, {-25,5 ,0,0, -15,15}, hair_22)

    swinging_physics.swingOnBody(hair_41, 180, {-25,5 ,0,0, -25,25}, hair_31)
    swinging_physics.swingOnBody(hair_42, 180, {-25,5 ,0,0, -25,25}, hair_31)
    swinging_physics.swingOnBody(hair_43, 180, {-25,5 ,0,0, -25,25}, hair_32)
    swinging_physics.swingOnBody(hair_44, 180, {-25,5 ,0,0, -25,25}, hair_32)
    swinging_physics.swingOnBody(hair_45, 180, {-25,5 ,0,0, -25,25}, hair_33)
    swinging_physics.swingOnBody(hair_46, 180, {-25,5 ,0,0, -25,25}, hair_33)
    swinging_physics.swingOnBody(hair_47, 180, {-25,5 ,0,0, -25,25}, hair_34)
    swinging_physics.swingOnBody(hair_48, 180, {-25,5 ,0,0, -25,25}, hair_34)
end