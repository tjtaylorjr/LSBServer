-----------------------------------
-- ID: 6409
-- Item: Ephramadian Throne
-- Item Effect: Grant Ephramadian throne key item
-----------------------------------
---@type TItem
local itemObject = {}

local keyItemId = xi.ki.EPHRAMADIAN_THRONE

itemObject.onItemCheck = function(target, item, param, caster)
    if target:hasKeyItem(keyItemId) then
        return xi.msg.basic.ALREADY_HAVE_KEY_ITEM, 0, keyItemId
    end

    return 0
end

itemObject.onItemUse = function(target)
    target:addKeyItem(keyItemId)
    target:messageBasic(xi.basic.OBTAINED_KEY_ITEM, 6409, keyItemId)
end

return itemObject
