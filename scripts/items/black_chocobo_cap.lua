-----------------------------------
-- ID: 25585
-- Black Chocobo Cap
-- Enchantment: "Teleport" (Upper Jeuno Chocobo Stables)
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
    target:addStatusEffectEx(xi.effect.TELEPORT, 0, xi.teleport.id.CHOCO_UPPER_JEUNO, 0, 4)
end

return itemObject
