vanilla_model.PLAYER:setVisible(false)

function events.tick()
    local crouching = player:getPose() == "CROUCHING"
    local sprinting = player:isSprinting()
    local blocking = player:isBlocking()
    local fishing = player:isFishing()
    local sleeping = player:getPose() == "SLEEPING"
    local swimming = player:getPose() == "SWIMMING"
    local flying = player:getPose() == "FALL_FLYING"
    local walking = player:getVelocity().xz:length() > .01

    animations.model.stand:setPlaying(not walking and not crouching)
    animations.model.walk:setPlaying(walking and not sprinting and not crouching)
    animations.model.run:setPlaying(sprinting)
    animations.model.crouch_walk:setPlaying(crouching and walking)
    animations.model.crouch_stand:setPlaying(crouching and not walking)
end