-----------------------------------
-- xi.effect.ELEMENTAL_SFORZO
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.UDMGMAGIC, -10000)
    -- Todo: status resists
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.UDMGMAGIC, -10000)
    -- Todo: status resists
end

return effectObject
