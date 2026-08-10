---@class Pokeball
---@field x number
---@field y number
---@field z number
---@field inHand boolean -- whether pokeball is currently being carried in hand
---@field draw fun(self: Pokeball, pass: Pass)
---@field setPosition fun(self: Pokeball, x: number, y: number, z: number)

---@param x number
---@param y number
---@param z number
---@param inHand boolean
---@return Pokeball
local function Pokeball(x, y, z, inHand)
    ---@type Pokeball
    local self = {
        x = x or 0,
        y = y or 0,
        z = z or 0,
        inHand = inHand,

        draw = function(self, pass)
            pass:setColor(1, 0, 0)

            pass:sphere(self.x, self.y, self.z, .05)
        end,

        setPosition = function(self, x, y, z)
            self.x = x
            self.y = y
            self.z = z
        end
    }

    return self
end

return Pokeball
