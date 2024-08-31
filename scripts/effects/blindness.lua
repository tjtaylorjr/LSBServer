-----------------------------------
-- xi.effect.BLINDNESS
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.ACC, -effect:getPower())
    target:addMod(xi.mod.RACC, -effect:getPower())

    -- Immunobreak reset.
    target:setMod(xi.mod.BLIND_IMMUNOBREAK, 0)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.ACC, -effect:getPower())
    target:delMod(xi.mod.RACC, -effect:getPower())
end

return effectObject
