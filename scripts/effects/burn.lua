-----------------------------------
-- xi.effect.BURN
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
    local statReduction = (effect:getPower() - 1) * 2 + 5 -- Caster merits are included already.

    target:addMod(xi.mod.REGEN_DOWN, effect:getPower())
    target:addMod(xi.mod.INT, -statReduction)

    target:delStatusEffect(xi.effect.FROST)
end

effectObject.onEffectTick = function(target, effect)
end

effectObject.onEffectLose = function(target, effect)
    local statReduction = (effect:getPower() - 1) * 2 + 5 -- Caster merits are included already.

    target:delMod(xi.mod.REGEN_DOWN, effect:getPower())
    target:delMod(xi.mod.INT, -statReduction)
end

return effectObject
