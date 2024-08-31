-----------------------------------
-- xi.effect.LETHARGIC_DAZE_3
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.EVA, -16)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.EVA, -16)
end

return effectObject
