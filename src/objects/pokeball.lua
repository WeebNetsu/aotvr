---@class Pokeball
---@field inHand boolean -- whether pokeball is currently being carried in hand
---@field collision Collider
---@field draw fun(self: Pokeball, pass: Pass)

---@param world World
---@param x number
---@param y number
---@param z number
---@param inHand boolean
---@return Pokeball
local function Pokeball(world, x, y, z, inHand)
    local radius = .05

    local collision = world:newSphereCollider(x, y, z, radius)
    collision:setGravityScale(0)

    ---@type Pokeball
    local pokeball = {
        inHand = inHand,
        collision = collision,

        draw = function(self, pass)
            pass:setColor(1, 0, 0)

            local x, y, z = self.collision:getPosition()
            pass:sphere(x, y, z, radius)
        end,
    }

    return pokeball
end

return Pokeball
