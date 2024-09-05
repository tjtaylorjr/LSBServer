-----------------------------------
-- Area: Windurst Woods
-- NPC: A.M.A.N Validator
-- !pos 89.9 -4.2 -47.63 241
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    xi.deeds.validatorOnTrigger(player, npc)
end

entity.onEventUpdate = function(player, csid, option, npc)
    xi.deeds.validatorOnEventUpdate(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
    xi.deeds.validatorOnEventFinish(player, csid, option, npc)
end

return entity
