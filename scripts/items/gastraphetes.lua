-----------------------------------
-- ID: 19001
-- Item: Gastraphetes
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    if target:getFreeSlotsCount() == 0 then
        return xi.msg.basic.ITEM_UNABLE_TO_USE
    end

    return 0
end

itemObject.onItemUse = function(target)
    npcUtil.giveItem(target, { { xi.item.QUELLING_BOLT, 99 } }) -- Quelling Bolt x99
end

return itemObject
