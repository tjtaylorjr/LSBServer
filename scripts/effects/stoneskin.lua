-----------------------------------
-- xi.effect.STONESKIN
-- Absorbs a certain amount of damage from physical and magical attacks.
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:setMod(xi.mod.STONESKIN, effect:getPower())
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:setMod(xi.mod.STONESKIN, 0)
end

return effectObject
