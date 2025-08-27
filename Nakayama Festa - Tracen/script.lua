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

    swinging_physics.swingOnBody(modelBody.tail1, 180, {-45,180, -180,180, -10,10})
    swinging_physics.swingOnBody(modelBody.tail1.tail2, 180, {-90,180, -180,180, -10,10}, modelBody.tail1, 1)
    swinging_physics.swingOnBody(modelBody.tail1.tail2.tail3, 180, {-45,180, -90,180, -10,10}, modelBody.tail1.tail2, 2)

    --Hairs Physics
end