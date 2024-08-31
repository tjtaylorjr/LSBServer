-----------------------------------
-- ID: 4659
-- Scroll of Shell IV
-- Teaches the white magic Shell IV
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.SHELL_IV)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.SHELL_IV)
end

return itemObject
