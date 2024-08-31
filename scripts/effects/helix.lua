-----------------------------------
-- xi.effect.HELIX
-----------------------------------
---@type TEffect
local effectObject = {}

effectObject.onEffectGain = function(target, effect)
end

effectObject.onEffectTick = function(target, effect)
    local dmg = utils.stoneskin(target, effect:getPower())

    if dmg > 0 then
        target:takeDamage(dmg)
    end
end

effectObject.onEffectLose = function(target, effect)
end

return effectObject
