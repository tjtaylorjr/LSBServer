-----------------------------------
-- xi.effect.AUBADE
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    target:addMod(xi.mod.SLEEPRES, effect:getPower())
    target:addMod(xi.mod.LULLABYRES, effect:getPower())
    target:addMod(xi.mod.CHR, effect:getSubPower()) -- Apply Stat Buff from AUGMENT_SONG_STAT
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    target:delMod(xi.mod.SLEEPRES, effect:getPower())
    target:delMod(xi.mod.LULLABYRES, effect:getPower())
    target:delMod(xi.mod.CHR, effect:getSubPower()) -- Remove Stat Buff from AUGMENT_SONG_STAT
end

return effectObject
