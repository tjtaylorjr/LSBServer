-----------------------------------
-- xi.effect.PROWESS
-- Increased HP and MP
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.HPP, effect:getPower())
    target:addMod(xi.mod.MPP, effect:getPower())
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.HPP, effect:getPower())
    target:delMod(xi.mod.MPP, effect:getPower())
end

return effectObject
