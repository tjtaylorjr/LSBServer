-----------------------------------
-- ID: 5428
-- Scroll of Instant Retrace
-- Transports the user to their Allied Nation.
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    if target:getCampaignAllegiance() == 0 then
        return 56
    else
        return 0
    end
end

itemObject.onItemUse = function(target)
    if target:getCampaignAllegiance() > 0 then
        target:addStatusEffectEx(xi.effect.TELEPORT, 0, xi.teleport.id.RETRACE, 0, 3)
    end
end

return itemObject
