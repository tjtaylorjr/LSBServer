-----------------------------------
-- ID: 4742
-- Scroll of Shellra V
-- Teaches the white magic Shellra V
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.SHELLRA_V)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.SHELLRA_V)
end

return itemObject
