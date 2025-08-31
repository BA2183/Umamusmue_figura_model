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
        root.torso.Head
    }, 0.8, 0.1, 1, true)

    --Eyes
    modelHead = root.torso.Head
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
    first_hairs = modelHead.hairs.first_hairs
    second_hairs = modelHead.hairs.second_hairs
    third_hairs = modelHead.hairs.third_hairs
    forth_hairs = modelHead.hairs.forth_hairs
    back_hairs = modelHead.hairs.back_hairs_1
    
    swinging_physics.swingOnHead(first_hairs.first_hair_r_1, -90, {-10,10, 0,0, -5,5})
    swinging_physics.swingOnHead(first_hairs.first_hair_r_1.first_hair_r_2, -90, {-0,0, -90,90, 0,0}, first_hairs.first_hair_r_1)
    swinging_physics.swingOnHead(first_hairs.first_hair_l_1, 90, {-10,10, 0,0, -5,5})
    swinging_physics.swingOnHead(first_hairs.first_hair_l_1.first_hair_l_2, 90, {0,0, -90,90, 0,0}, first_hairs.first_hair_l_1)
    swinging_physics.swingOnHead(second_hairs.second_hair_r_1, -90, {-5,10, 0,0, -5,5})
    swinging_physics.swingOnHead(second_hairs.second_hair_r_1.second_hair_r_2, -90, {-0,0, -90,90, 0,0}, second_hairs.second_hair_r_1)
    swinging_physics.swingOnHead(second_hairs.second_hair_l_1, 90, {-5,10, 0,0, -5,5})
    swinging_physics.swingOnHead(second_hairs.second_hair_l_1.second_hair_l_2, 90, {0,0, -90,90, 0,0}, second_hairs.second_hair_r_1)
    swinging_physics.swingOnHead(third_hairs.third_hair_r_1, -90, {-5,10, 0,0, -5,5})
    swinging_physics.swingOnHead(third_hairs.third_hair_r_1.third_hair_r_2, -90, {-0,0, -90,90, 0,0}, third_hairs.third_hair_r_1)
    swinging_physics.swingOnHead(third_hairs.third_hair_l_1, 90, {-5,10, 0,0, -5,5})
    swinging_physics.swingOnHead(third_hairs.third_hair_l_1.third_hair_l_2, 90, {0,0, -90,90, 0,0}, third_hairs.third_hair_l_1)
    swinging_physics.swingOnHead(forth_hairs.forth_hair_r_1, 180, {-5,10, 0,0, -5,5})
    swinging_physics.swingOnHead(forth_hairs.forth_hair_r_1.forth_hair_r_2, 180, {-0,0, -90,90, 0,0}, forth_hairs.forth_hair_r_1)
    swinging_physics.swingOnHead(forth_hairs.forth_hair_l_1, 180, {-5,10, 0,0, -5,5})
    swinging_physics.swingOnHead(forth_hairs.forth_hair_l_1.forth_hair_l_2, 180, {0,0, -90,90, 0,0}, forth_hairs.forth_hair_l_1)
    swinging_physics.swingOnHead(back_hairs, 180, {-5,10, 0,0, -10,10})
    swinging_physics.swingOnHead(back_hairs.back_hairs_2, 180, {-5,10, 0,0, -10,10}, back_hairs)

    -- swinging_physics.swingOnHead(first_hairs.first_hair_r_2, -90, {0,0, -2,2, 0,0}, first_hairs)
    -- swinging_physics.swingOnHead(first_hairs.first_hair_l_2, 90, {0,0, -2,2, 0,0}, first_hairs)
    -- swinging_physics.swingOnHead(second_hairs.second_hair_r_2, -90, {0,0, -2,2, 0,0}, second_hairs)
    -- swinging_physics.swingOnHead(second_hairs.second_hair_l_2, 90, {0,0, -2,2, 0,0}, second_hairs)
    -- swinging_physics.swingOnHead(third_hairs.third_hair_r_2, -90, {0,0, -2,2, 0,0}, third_hairs)
    -- swinging_physics.swingOnHead(third_hairs.third_hair_l_2, 90, {0,0, -2,2, 0,0}, third_hairs)
    -- swinging_physics.swingOnHead(forth_hairs.forth_hair_r_2, 180, {0,0, -2,2, 0,0}, forth_hairs)
    -- swinging_physics.swingOnHead(forth_hairs.forth_hair_l_2, 180, {0,0, -2,2, 0,0}, forth_hairs)
    
end