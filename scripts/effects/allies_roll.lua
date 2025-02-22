-----------------------------------
-- xi.effect.ALLIES_ROLL
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.SKILLCHAINBONUS, effect:getPower())
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.SKILLCHAINBONUS, effect:getPower())
end

return effectObject
