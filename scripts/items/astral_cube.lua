-----------------------------------
-- ID: 6413
-- Item: Astral Cube
-- Item Effect: Grant Astral cube key item
-----------------------------------
---@type TItem
local itemObject = {}

local keyItemId = xi.ki.ASTRAL_CUBE

itemObject.onItemCheck = function(target, item, param, caster)
    if target:hasKeyItem(keyItemId) then
        return xi.msg.basic.ALREADY_HAVE_KEY_ITEM, 0, keyItemId
    end

    return 0
end

itemObject.onItemUse = function(target)
    target:addKeyItem(keyItemId)
    target:messageBasic(xi.basic.OBTAINED_KEY_ITEM, 6413, keyItemId)
end

return itemObject
