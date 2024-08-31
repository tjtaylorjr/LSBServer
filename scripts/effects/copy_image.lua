-----------------------------------
-- xi.effect.COPY_IMAGE
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:setMod(xi.mod.UTSUSEMI, effect:getSubPower())
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:setMod(xi.mod.UTSUSEMI, 0)
end

return effectObject
