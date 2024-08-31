-----------------------------------
-- ID: 6438
-- Voluspa Bullet Pouch
-- When used, you will obtain one stack of Voluspa Bullets
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return xi.itemUtils.itemBoxOnItemCheck(target)
end

itemObject.onItemUse = function(target)
    npcUtil.giveItem(target, { { xi.item.VOLUSPA_BULLET, 99 } })
end

return itemObject
