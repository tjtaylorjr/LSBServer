-----------------------------------
-- ID: 15194
-- Item: Maats Cap
-- Teleports to Ru'Lude gardens
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
    target:addStatusEffectEx(xi.effect.TELEPORT, 0, xi.teleport.id.MAAT, 0, 4)
end

return itemObject
