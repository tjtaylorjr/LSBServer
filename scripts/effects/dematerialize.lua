-----------------------------------
-- xi.effect.DEMATERIALIZE
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.UDMGPHYS, -10000)
    target:addMod(xi.mod.UDMGMAGIC, -10000)
    target:addMod(xi.mod.UDMGBREATH, -10000)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.UDMGPHYS, -10000)
    target:delMod(xi.mod.UDMGMAGIC, -10000)
    target:delMod(xi.mod.UDMGBREATH, -10000)
end

return effectObject
