-----------------------------------
-- ID: 5341
-- Spartan Bullet Pouch
-- When used, you will obtain one stack of Spartan Bullets
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return xi.itemUtils.itemBoxOnItemCheck(target)
end

itemObject.onItemUse = function(target)
    npcUtil.giveItem(target, { { xi.item.SPARTAN_BULLET, 99 } })
end

return itemObject
