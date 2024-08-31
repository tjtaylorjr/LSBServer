-----------------------------------
-- ID: 11002
-- Dragon Tank
-- Dispense: Flask of Dragon Fruit au Lait
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return xi.itemUtils.itemBoxOnItemCheck(target)
end

itemObject.onItemUse = function(target)
    npcUtil.giveItem(target, { { xi.item.FLASK_OF_DRAGON_FRUIT_AU_LAIT, 1 } })
end

return itemObject
