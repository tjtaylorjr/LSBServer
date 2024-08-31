-----------------------------------
-- xi.effect.CONFRONTATION
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    if target:getPet() then
        target:getPet():addStatusEffect(effect)
    end
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    if target:getPet() then
        target:getPet():delStatusEffect(xi.effect.CONFRONTATION)
    end
end

return effectObject
