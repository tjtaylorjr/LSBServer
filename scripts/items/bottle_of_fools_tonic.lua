-----------------------------------
-- ID: 5846
-- Item: bottle_of_fools_tonic
-- Item Effect: When applied, grants DMGMAGIC -5000 for 60s
--              Does not Grant Spell Immunity (nospellimmune = 1)
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
    local effect        = xi.effect.MAGIC_SHIELD
    local duration      = 60
    local power         = 0
    local nospellimmune = 1

    xi.itemUtils.addItemShield(target, power, duration, effect, nospellimmune)
end

return itemObject
