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
    swinging_physics.swingOnHead(modelHead.ear_r_1.ear_r_2.charm_1, -90, {-25,25, -25,25, -25,25}, modelHead.ear_r_1)
    swinging_physics.swingOnHead(modelHead.ear_r_1.ear_r_2.charm_1.charm_2, -90, {-25,25, -25,25, -25,25}, modelHead.ear_l_1.charm_1)

    swinging_physics.swingOnHead(modelHead.ear_r_1.ear_r_2.charm_3, -90, {-45,45, 0,0, 0,0}, modelHead.ear_r_1)
    swinging_physics.swingOnHead(modelHead.ear_r_1.ear_r_2.charm_3.charm_4, -90, {-45,45, 0,0, 0,0}, modelHead.ear_r_1.charm_3)

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
    modelHair = modelHead.hair
    modelHairLeft = modelHair.hair_left
    modelHairRight = modelHair.hair_right
    modelHairBack = modelHair.back_hair1

        --Front hair
    swinging_physics.swingOnHead(modelHair.hair_front_mid, 0, {0,15, -2.5,2.5, -2.5,2.5})
    swinging_physics.swingOnHead(modelHair.hair_front_left, 0, {0,5, -3,2, -5,2})
    swinging_physics.swingOnHead(modelHair.hair_front_right, 0, {0,5, -2,3, -2,5})
    swinging_physics.swingOnHead(modelHair.hair_front_mid.hair_front_mid_side, 0, {0,0, 0,0, -10,10})

        --right hair
    swinging_physics.swingOnHead(modelHairRight.hair_right1, -90, {-2.5,2.5, 0,0, 0,2.5})
    swinging_physics.swingOnHead(modelHairRight.hair_right2, -90, {-2.5,2.5, 0,0, 0,3})
    swinging_physics.swingOnHead(modelHairRight.hair_right3, -90, {-2.5,2.5, 0,0, 0,2.5})
    swinging_physics.swingOnHead(modelHairRight.hair_right4, -90, {-2.5,2.5, 0,0, 0,2})

        --left hair
    swinging_physics.swingOnHead(modelHairLeft.hair_left1, 90, {-2.5,2.5, 0,0, -2.5,0})
    swinging_physics.swingOnHead(modelHairLeft.hair_left2, 90, {-2.5,2.5, 0,0, -3,0})
    swinging_physics.swingOnHead(modelHairLeft.hair_left3, 90, {-2.5,2.5, 0,0, -2.5,0})
    swinging_physics.swingOnHead(modelHairLeft.hair_left4, 90, {-2.5,2.5, 0,0, -2,0})

        --back hair
    swinging_physics.swingOnHead(modelHairBack, -180, {-25,5, 0,0, -5,5})
    swinging_physics.swingOnHead(modelHairBack.back_hair2, -180, {-15,5, 0,0, -5,5}, modelHairBack)

    modelHairBack3 = modelHairBack.back_hair2.back_hair3
    modelHairBack4 = modelHairBack.back_hair2.back_hair4
    modelHairBack5 = modelHairBack.back_hair2.back_hair5
    modelHairBack6 = modelHairBack.back_hair2.back_hair6

    swinging_physics.swingOnHead(modelHairBack3, -180, {-10,0, 0,0, -2.5,2.5}, modelHairBack.back_hair2)
    swinging_physics.swingOnHead(modelHairBack3.back_hair33, -180, {-10,0, 0,0, -2.5,2.5}, modelHairBack3)
    swinging_physics.swingOnHead(modelHairBack3.back_hair33.back_hair333, -180, {-10,0, 0,0, -2.5,2.5}, modelHairBack3.back_hair33)

    swinging_physics.swingOnHead(modelHairBack4, -180, {-10,0, 0,0, -2.5,2.5}, modelHairBack.back_hair2)
    swinging_physics.swingOnHead(modelHairBack4.back_hair44, -180, {-10,0, 0,0, -2.5,2.5}, modelHairBack4)
    swinging_physics.swingOnHead(modelHairBack4.back_hair44.back_hair444, -180, {-10,0, 0,0, -2.5,2.5}, modelHairBack4.back_hair44)

    swinging_physics.swingOnHead(modelHairBack5, -180, {-10,0, -0,0, -2.5,2.5}, modelHairBack.back_hair2)
    swinging_physics.swingOnHead(modelHairBack5.back_hair55, -180, {-10,0, 0,0, -2.5,2.5}, modelHairBack5)
    swinging_physics.swingOnHead(modelHairBack5.back_hair55.back_hair555, -180, {-10,0, 0,0, -2.5,2.5}, modelHairBack5.back_hair55)

    swinging_physics.swingOnHead(modelHairBack6, -180, {-10,0, -0,0, -2.5,2.5}, modelHairBack.back_hair2)
    swinging_physics.swingOnHead(modelHairBack6.back_hair66, -180, {-10,0, 0,0, -2.5,2.5}, modelHairBack6)
    swinging_physics.swingOnHead(modelHairBack6.back_hair66.back_hair666, -180, {-10,0, 0,0, -2.5,2.5}, modelHairBack6.back_hair66)  
end