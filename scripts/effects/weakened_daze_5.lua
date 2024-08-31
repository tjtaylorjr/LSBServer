-----------------------------------
-- xi.effect.WEAKENED_DAZE_5
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.MEVA, -30)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.MEVA, -30)
end

return effectObject
