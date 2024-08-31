-----------------------------------
-- xi.effect.BATTUTA
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    xi.job_utils.rune_fencer.onBattutaEffectGain(target, effect)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    xi.job_utils.rune_fencer.onBattutaEffectLose(target, effect)
end

return effectObject
