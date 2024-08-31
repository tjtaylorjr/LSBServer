-----------------------------------
-- ID: 6179
-- Item: The Bell Tolls
-- An essay penned by Hrohj Wagrehsa concerning the transmission of Sih Renaye's handbell and the voice of the land.
-- Adventurers note that reading it increases one's handbell skill.
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return xi.itemUtils.skillBookCheck(target, xi.skill.HANDBELL)
end

itemObject.onItemUse = function(target)
    xi.itemUtils.skillBookUse(target, xi.skill.HANDBELL)
end

return itemObject
