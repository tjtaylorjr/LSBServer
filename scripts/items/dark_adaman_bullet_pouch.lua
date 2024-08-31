-----------------------------------
-- ID: 5873
-- Dark Adaman Bullet Pouch
-- When used, you will obtain one stack of Dark Adaman Bullets
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return xi.itemUtils.itemBoxOnItemCheck(target)
end

itemObject.onItemUse = function(target)
    npcUtil.giveItem(target, { { xi.item.DARK_ADAMAN_BULLET, 99 } })
end

return itemObject
