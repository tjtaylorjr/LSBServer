-----------------------------------
-- ID: 5337
-- Sleep Bolt Quiver
-- When used, you will obtain one stack of Sleep Bolts
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return xi.itemUtils.itemBoxOnItemCheck(target)
end

itemObject.onItemUse = function(target)
    npcUtil.giveItem(target, { { xi.item.SLEEP_BOLT, 99 } })
end

return itemObject
