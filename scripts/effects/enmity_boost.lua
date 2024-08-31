-----------------------------------
-- xi.effect.ENMITY_BOOST
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.ENMITY, effect:getPower())
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.ENMITY, effect:getPower())
end

return effectObject
