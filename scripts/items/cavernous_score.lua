-----------------------------------
-- ID: 6173
-- Item: Cavernous Score
-- A musical score composed by Lewenhart.
-- Its notes symbolize the damp and musty air that stagnates within an underground cave.
-- Adventurers note that reading it increases one's string instrument skill.
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return xi.itemUtils.skillBookCheck(target, xi.skill.STRING_INSTRUMENT)
end

itemObject.onItemUse = function(target)
    xi.itemUtils.skillBookUse(target, xi.skill.STRING_INSTRUMENT)
end

return itemObject
