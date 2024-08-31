-----------------------------------
-- ID: 4657
-- Scroll of Shell II
-- Teaches the white magic Shell II
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return target:canLearnSpell(xi.magic.spell.SHELL_II)
end

itemObject.onItemUse = function(target)
    target:addSpell(xi.magic.spell.SHELL_II)
end

return itemObject
