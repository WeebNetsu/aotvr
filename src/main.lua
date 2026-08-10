local Pokeball = require "objects.pokeball"

-- local hands = {};

--- Current pokeballs on screen, this ensures that newly created balls don't disappear.
---@type Pokeball[]
local onScreenPokeballs = {}

function lovr.load()
    -- Load a 3D model
    -- model = lovr.graphics.newModel('monkey.obj')

    -- Use a dark grey background
    -- lovr.graphics.setBackgroundColor(.2, .2, .2)
end

function lovr.update(dt)
    -- if the player has a free hand and can create a new pokeball
    local allowCreatingPokeball = true

    for _, pokeball in pairs(onScreenPokeballs) do
        if pokeball.inHand then
            local x, y, z = lovr.headset.getPosition("hand/right")
            pokeball:setPosition(x, y, z)
            allowCreatingPokeball = false
        end
    end

    for i, hand in ipairs(lovr.headset.getHands()) do
        if hand == "hand/right" then
            if lovr.headset.isDown("hand/right", "grip") then
                if allowCreatingPokeball then
                    local x, y, z = lovr.headset.getPosition(hand)
                    table.insert(onScreenPokeballs, Pokeball(x, y, z, true))
                end
            elseif lovr.headset.wasReleased("hand/right", "grip") then
                for _, pokeball in pairs(onScreenPokeballs) do
                    if pokeball.inHand then
                        pokeball.inHand = false;
                        pokeball.x = 0
                        pokeball.y = #onScreenPokeballs / 2
                        pokeball.z = -3
                    end
                end
            end
        end
    end
end

function lovr.draw(pass)
    -- transforms = lovr.headset.getSkeleton("right")
    -- pass:text(transforms, 0, 1.7, -3, .5)

    for _, pokeball in pairs(onScreenPokeballs) do
        pokeball:draw(pass)
    end

    -- for i, hand in ipairs(lovr.headset.getHands()) do
    --     -- pass:text(hand, 0, 0.7, -3, .5)
    --     if hand == "hand/right" then
    --         -- x, y, z = lovr.headset.getAngularVelocity(hand)
    --         local x, y, z = lovr.headset.getPosition(hand)

    --         -- pass:text(x, 0, 1.7, -3, .5)
    --         -- pass:text(y, 0, 3.7, -3, .5)
    --         -- pass:text(z, 0, 5.7, -3, .5)

    --         -- pass:setColor(1, 0, 0)

    --         pass:setColor(1, 0, 0)
    --         if lovr.headset.isDown(hand, "grip") then
    --             pass:sphere(x, y, z, .05)
    --         end
    --     end
    --     -- print(hand, lovr.headset.getPose(hand))
    -- end


    -- -- Draw the model
    -- pass:setColor(1, 1, 1)
    -- pass:draw(model, -.5, 1, -3)

    -- -- Draw a red cube using the "cube" primitive
    -- pass:setColor(1, 0, 0)
    -- pass:cube(.5, 1, -3, .5, lovr.timer.getTime())

    -- local x, y, z = lovr.headset.getPosition()
    -- pass:sphere(-x, y, -z, .1)
end
