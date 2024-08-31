-----------------------------------
-- ID: 5314
-- Toolbag Sanjaku-tenugui
-- When used, you will obtain one stack of Sanjaku-tenugui
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return xi.itemUtils.itemBoxOnItemCheck(target)
end

itemObject.onItemUse = function(target)
    npcUtil.giveItem(target, { { xi.item.SANJAKU_TENUGUI, 99 } })
end

return itemObject
