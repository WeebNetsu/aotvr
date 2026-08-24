local Pokeball = require "objects.pokeball"

-- local hands = {};

--- Current pokeballs on screen, this ensures that newly created balls don't disappear.
---@type Pokeball[]
local onScreenPokeballs

--- This will pretty much contain our physics https://lovr.org/docs/lovr.physics
---@type World
local world
--- This is our world ground, physics will interact with it and have collisions
---@type Collider
local ground

local groundSize = {
    x = -100,
    y = 0,
    z = -100,
    width = 400,
    height = 1,
    depth = 400
}

local playerZ = 0
local speed = 2.0

function lovr.load()
    onScreenPokeballs = {}
    world = lovr.physics.newWorld()

    ground = world:newBoxCollider(groundSize.x, groundSize.y, groundSize.z, groundSize.width, groundSize.height,
        groundSize.depth)
    ground:setKinematic(true)
    ground:setFriction(1)

    -- box = world:newSphereCollider(0, 2.5, -7, 0.6)


    lovr.timer.step() -- Reset the timer before the first update
end

function lovr.update(dt)
    world:update(dt)

    playerZ = playerZ - speed * dt


    -- if the player has a free hand and can create a new pokeball
    local allowCreatingPokeball = true

    for _, pokeball in pairs(onScreenPokeballs) do
        if pokeball.inHand then
            local x, y, z = lovr.headset.getPosition("hand/right")
            pokeball.collision:setPosition(x, y, z)
            allowCreatingPokeball = false
        end
    end

    for i, hand in ipairs(lovr.headset.getHands()) do
        if hand == "hand/right" then
            if lovr.headset.isDown("hand/right", "grip") then
                if allowCreatingPokeball then
                    local x, y, z = lovr.headset.getPosition(hand)
                    table.insert(onScreenPokeballs, Pokeball(world, x, y, z, true))
                end
            elseif lovr.headset.wasReleased("hand/right", "grip") then
                for _, pokeball in pairs(onScreenPokeballs) do
                    if pokeball.inHand then
                        pokeball.inHand = false;
                        pokeball.collision:setGravityScale(1)
                        -- pokeball.x = 0
                        -- pokeball.y = #onScreenPokeballs / 2
                        -- pokeball.z = -3
                        -- pokeball:addCollision(world)
                    end
                end
            end
        end
    end
end

function lovr.draw(pass)
    local xaxis, yaxis = lovr.headset.getAxis("right", "thumbstick")
    -- pass:setColor(1, 0, 0)
    -- local x, y, z = box:getPosition()
    -- pass:sphere(x, y, z, 0.6)

    -- local x, y, z = lovr.headset.getPosition()

    local x, y, z = lovr.headset.getPose("camera")


    -- for i, hand in ipairs(lovr.headset.getHands()) do
    --     -- pass:text(hand, 0, 0.7, -3, .5)
    --     if hand == "hand/right" then
    --         -- x, y, z = lovr.headset.getAngularVelocity(hand)
    --         local x, y, z = lovr.headset.getPosition(hand)

    pass:text(xaxis, 0, 1.7, -3, .5)
    pass:text(yaxis, 0, 3.7, -3, .5)
    pass:text(z, 0, 5.7, -3, .5)

    pass:translate(x, y, -playerZ)

    --         -- pass:setColor(1, 0, 0)

    --         pass:setColor(1, 0, 0)
    --         if lovr.headset.isDown(hand, "grip") then
    --             pass:sphere(x, y, z, .05)
    --         end
    --     end
    --     -- print(hand, lovr.headset.getPose(hand))
    -- end

    pass:setColor(0, 1, 0)
    pass:box(groundSize.x, groundSize.y, groundSize.z, groundSize.width, groundSize.height, groundSize.depth)

    pass:setColor(0, 1, 1)
    pass:box(0, 0, -50, 10, 30, 30)

    for _, pokeball in pairs(onScreenPokeballs) do
        pokeball:draw(pass)
    end
end
