-----------------------------------
-- ID: 6379
-- Item: Ornate Stool
-- Item Effect: Grant Ornate stool key item
-----------------------------------
---@type TItem
local itemObject = {}

local keyItemId = xi.ki.ORNATE_STOOL

itemObject.onItemCheck = function(target, item, param, caster)
    if target:hasKeyItem(keyItemId) then
        return xi.msg.basic.ALREADY_HAVE_KEY_ITEM, 0, keyItemId
    end

    return 0
end

itemObject.onItemUse = function(target)
    target:addKeyItem(keyItemId)
    target:messageBasic(xi.msg.basic.OBTAINED_KEY_ITEM, 6379, keyItemId)
end

return itemObject
