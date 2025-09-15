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

    --Charm physic
    modelCharm = modelHead.ear_r_1.charm
    swinging_physics.swingOnHead(modelCharm, -45, {-20,10, 0,0, -0.5,15})
    swinging_physics.swingOnHead(modelCharm.charm2, -45, {-17.5,7.5, 0,0, -0.5,12.5})
    swinging_physics.swingOnHead(modelCharm.charm2.charm3, -45, {-15,5, 0,0, -0.5,10})
    swinging_physics.swingOnHead(modelCharm.charm2.charm3.charm4, -45, {-12.5,2.5, 0,0, -0.5,7.5})
    swinging_physics.swingOnHead(modelCharm.charm2.charm3.charm4.charm5, -45, {-10,0, 0,0, -0.5,5})
    swinging_physics.swingOnHead(modelCharm.charm2.charm3.charm4.charm5.charm6, -45, {-7.5,0, 0,0, -0.5,2.5})
    swinging_physics.swingOnHead(modelCharm.charm2.charm3.charm4.charm5.charm6.charm7, -45, {-5,0, 0,0, -0.5,2.5})

    --Tail physic
    modelBody =  root.torso.Body

    --Chest physic
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

    swinging_physics.swingOnBody(modelBody.tail1, 180, {-45,0, 0,0, -10,10})
    swinging_physics.swingOnBody(modelBody.tail1.tail2, 180, {-25,5, 0,0, -10,10})
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
    modelHairRight = modelHair.hair_side_right
    modelHairLeft = modelHair.hair_side_left
    modelHairBack = modelHair.hair_back
    modelHairAhoge = modelHair.hair_ahoge
    modelHairTailRight = modelHair.hair_tail_right
    modelHairTailLeft = modelHair.hair_tail_left

    -- front hairs
    swinging_physics.swingOnHead(modelHair.hair_front_right, 0, {-0.5,5, -2.5,2.5, -2.5,5})
    swinging_physics.swingOnHead(modelHair.hair_front_left, 0, {-0.5,5, -2.5,2.5, -5,2.5})
    swinging_physics.swingOnHead(modelHair.hair_extra, 0, {0,25, -2.5,2.5, -25,25})
    swinging_physics.swingOnHead(modelHair.hair_extra.hair_extra2, 0, {10,25, -2.5,2.5, -25,25}, modelHair.hair_extra, 1)

    -- back hairs
    swinging_physics.swingOnHead(modelHairBack.hair_back_right, 180, {-2.5,0, -2.5,2.5, -2.5,5})
    swinging_physics.swingOnHead(modelHairBack.hair_back_left, 180, {-2.5,0, -2.5,2.5, -5,2.5})
    swinging_physics.swingOnHead(modelHairBack.hair_back_mid, 180, {-2.5,0, -2.5,2.5, -2.5,2.5})

    -- ahoge
    swinging_physics.swingOnHead(modelHairAhoge, 0, {0,0, -45,45, -15,15})
    swinging_physics.swingOnHead(modelHairAhoge.hair_ahoge2, 0, {0,0, -45,45, -5,5})
    swinging_physics.swingOnHead(modelHairAhoge.hair_ahoge2.hair_ahoge3, 0, {0,0, -45,45, -5,5})
    swinging_physics.swingOnHead(modelHairAhoge.hair_ahoge2.hair_ahoge3.hair_ahoge4, 0, {0,0, -45,45, -5,5})

    -- side right
    swinging_physics.swingOnHead(modelHairRight.hair_side_front_right, -45, {-2.5,5, -2.5,2.5, 0,2.5})
    swinging_physics.swingOnHead(modelHairRight.hair_side_back_right, -45, {-5,2.5, -2.5,2.5, 0,2.5})
    swinging_physics.swingOnHead(modelHairRight.hair_side_mid_right, -45, {-2.5,2.5, -2.5,2.5, 0,2.5})

    -- side left
    swinging_physics.swingOnHead(modelHairLeft.hair_side_front_left, 45, {-2.5,5, -2.5,2.5, -2.5,0})
    swinging_physics.swingOnHead(modelHairLeft.hair_side_back_left, 45, {-5,2.5, -2.5,2.5, -2.5,0})
    swinging_physics.swingOnHead(modelHairLeft.hair_side_mid_left, 45, {-2.5,2.5, -2.5,2.5, -2.5,0})

    -- tail right
    swinging_physics.swingOnHead(modelHairTailRight, 180, {-20,5, -2.5,2.5, -7.5,17.5})
    swinging_physics.swingOnHead(modelHairTailRight.hair_tail_right2, 180, {-17.5,2.5, -2.5,2.5, -7.5,15})
    swinging_physics.swingOnHead(modelHairTailRight.hair_tail_right2.hair_tail_right3, 180, {-15,0, -2.5,2.5, -7.5,12.5})
    swinging_physics.swingOnHead(modelHairTailRight.hair_tail_right2.hair_tail_right3.hair_tail_right4, 180, {-12.5,0, -2.5,2.5, -7.5,10})

    -- tail left
    swinging_physics.swingOnHead(modelHairTailLeft, 180, {-20,5, -2.5,2.5, -17.5,7.5})
    swinging_physics.swingOnHead(modelHairTailLeft.hair_tail_left2, 180, {-17.5,2.5, -2.5,2.5, -15,7.5})
    swinging_physics.swingOnHead(modelHairTailLeft.hair_tail_left2.hair_tail_left3, 180, {-15,0, -2.5,2.5, -12.5,7.5})
    swinging_physics.swingOnHead(modelHairTailLeft.hair_tail_left2.hair_tail_left3.hair_tail_left4, 180, {-12.5,0, -2.5,2.5, -10,7.5})
end