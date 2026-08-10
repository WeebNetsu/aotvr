-- local hands = {};

function lovr.load()
    -- Load a 3D model
    -- model = lovr.graphics.newModel('monkey.obj')

    -- Use a dark grey background
    -- lovr.graphics.setBackgroundColor(.2, .2, .2)
end

function lovr.update(dt)
    -- print('updating', dt)
    -- hands = lovr.headset.getHands()
end

function lovr.draw(pass)
    -- transforms = lovr.headset.getSkeleton("right")
    -- pass:text(transforms, 0, 1.7, -3, .5)

    for i, hand in ipairs(lovr.headset.getHands()) do
        -- pass:text(hand, 0, 0.7, -3, .5)
        if hand == "hand/right" then
            -- x, y, z = lovr.headset.getAngularVelocity(hand)
            x, y, z = lovr.headset.getPosition(hand)

            -- pass:text(x, 0, 1.7, -3, .5)
            -- pass:text(y, 0, 3.7, -3, .5)
            -- pass:text(z, 0, 5.7, -3, .5)

            -- pass:setColor(1, 0, 0)
            pass:sphere(x, y, z, .05)
        end
        -- print(hand, lovr.headset.getPose(hand))
    end


    -- -- Draw the model
    -- pass:setColor(1, 1, 1)
    -- pass:draw(model, -.5, 1, -3)

    -- -- Draw a red cube using the "cube" primitive
    -- pass:setColor(1, 0, 0)
    -- pass:cube(.5, 1, -3, .5, lovr.timer.getTime())

    -- local x, y, z = lovr.headset.getPosition()
    -- pass:sphere(-x, y, -z, .1)
end
