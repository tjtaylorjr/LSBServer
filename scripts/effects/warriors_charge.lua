-----------------------------------
-- xi.effect.WARRIORS_CHARGE
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.TRIPLE_ATTACK, effect:getPower())
    target:addMod(xi.mod.DOUBLE_ATTACK, 100)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.TRIPLE_ATTACK, effect:getPower())
    target:delMod(xi.mod.DOUBLE_ATTACK, 100)
end

return effectObject
