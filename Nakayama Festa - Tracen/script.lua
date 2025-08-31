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

    animations.model.sleep:setPlaying(sleeping)
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

    --Tail physic
    modelBody =  root.torso.Body

    swinging_physics.swingOnBody(modelBody.tail1, 180, {-45,0, 0,0, -10,10})
    swinging_physics.swingOnBody(modelBody.tail1.tail2, 180, {-25,5, 0,0, -10,10}, modelBody.tail1, 1)
    swinging_physics.swingOnBody(modelBody.tail1.tail2.tail3, 180, {-15,19, 0,0, -10,10}, modelBody.tail1.tail2, 2)

    --Hairs Physics
    -- direction: basically imagine it dangling from a stick thats pointing in this direction
    --     0 means forward, 45 is 45 degree to the left, 90 is 90 degree to the left, and so on all the way around
    -- limits: limit rotation for each axis, table layout {xLow, xHigh, yLow, yHigh, zLow, zHigh} (optional)
    -- source: example script from manuel_2867
    -- x: front and back(-) swing
    -- y: left(-) and right, spin
    -- z: left(-) and right, swing
    modelHair = root.torso.Neck.Head.hair

    -- front hair
    swinging_physics.swingOnHead(modelHair.front_hair, 0, {0,45, -2.5,2.5, -2.5,2.5})
    swinging_physics.swingOnHead(modelHair.hair_left, 90, {-2.5,2.5, 0,0, -10,0})
    swinging_physics.swingOnHead(modelHair.hair_right, -90, {-2.5,2.5, 0,0, 0, 10})
    swinging_physics.swingOnHead(modelHair.hair_left_front, 90, {-2.5,20, 0,0, -10,0})
    swinging_physics.swingOnHead(modelHair.hair_right_front, -90, {-2.5,25, 0,0, 0, 10})

    -- side hair
    swinging_physics.swingOnHead(modelHair.hair_left_back, 90, {-15,15, -5,5, -5,5})
    swinging_physics.swingOnHead(modelHair.hair_right_back, -90, {-15,15, -5,5, -5,5})

    -- back hair
    swinging_physics.swingOnHead(modelHair.back_hair, 180, {-45, 2.5, -5,5, -5,5})
    swinging_physics.swingOnHead(modelHair.back_hair.back_hair_2, 180, {-30, 5, -2.5,2.5, -10,10}, modelHair.back_hair)
    swinging_physics.swingOnHead(modelHair.back_hair.back_hair_3, 180, {-30, 5, -2.5,2.5, -10,10}, modelHair.back_hair)

    swinging_physics.swingOnHead(modelHair.back_hair.back_hair_2.back_hair_22, 180, {-15,7.5, -5,5, -10,10}, modelHair.back_hair.back_hair_2)
    swinging_physics.swingOnHead(modelHair.back_hair.back_hair_2.back_hair_22.back_hair_222, 180, {0,10, -7.5,7.5, -10,10}, modelHair.back_hair.back_hair_2.back_hair_22)
    swinging_physics.swingOnHead(modelHair.back_hair.back_hair_3.back_hair_33, 180, {-15,7.5, -5,5, -10,10}, modelHair.back_hair.back_hair_3)
    swinging_physics.swingOnHead(modelHair.back_hair.back_hair_3.back_hair_33.back_hair_333, 180, {0,10, -7.5,7.5, -10,10}, modelHair.back_hair.back_hair_3.back_hair_33)
end