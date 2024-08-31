-----------------------------------
-- xi.effect.RAMUHS_FAVOR
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.CRITHITRATE, effect:getPower())
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.CRITHITRATE, effect:getPower())
end

return effectObject
