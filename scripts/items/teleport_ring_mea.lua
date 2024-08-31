-----------------------------------
-- ID: 14663
-- Teleport ring: Mea
-- Enchantment: "Teleport-Mea"
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    local result = 0
    if not target:hasKeyItem(xi.ki.MEA_GATE_CRYSTAL) then
        result = 445
    end

    return result
end

itemObject.onItemUse = function(target)
    target:addStatusEffectEx(xi.effect.TELEPORT, 0, xi.teleport.id.MEA, 0, 4)
end

return itemObject
