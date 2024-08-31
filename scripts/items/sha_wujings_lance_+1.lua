-----------------------------------
--  ID: 21868
--  Sha Wujing's lance +1
--  When used, you will obtain a stack of Distilled Water
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return xi.itemUtils.itemBoxOnItemCheck(target)
end

itemObject.onItemUse = function(target)
    npcUtil.giveItem(target, { { xi.item.FLASK_OF_DISTILLED_WATER, 12 } })
end

return itemObject
