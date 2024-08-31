-----------------------------------
-- ID: 15842
-- Recall ring: Pashhow
-- Enchantment: "Recall-Pashhow"
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    local result = 0
    if not target:hasKeyItem(xi.ki.PASHHOW_GATE_CRYSTAL) then
        result = 445
    end

    return result
end

itemObject.onItemUse = function(target)
    target:addStatusEffectEx(xi.effect.TELEPORT, 0, xi.teleport.id.PASHH, 0, 4)
end

return itemObject
