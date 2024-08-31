-----------------------------------
-- ID: 5867
-- Toolbag Ino
-- When used, you will obtain one stack of inoshishinofuda
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return xi.itemUtils.itemBoxOnItemCheck(target)
end

itemObject.onItemUse = function(target)
    npcUtil.giveItem(target, { { xi.item.INOSHISHINOFUDA, 99 } })
end

return itemObject
