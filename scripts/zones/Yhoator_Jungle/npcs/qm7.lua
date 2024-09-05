-----------------------------------
-- Area: Yhoator Jungle
--  NPC: ??? (Beastmen Treasure qm7/chest3)
-- !pos 205.932 -1.097 -174.886 124
-----------------------------------
local ID = zones[xi.zone.YHOATOR_JUNGLE]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrigger = function(player, npc)
    xi.bmt.handleQmOnTrigger(player, npc, ID.text.SOMETHING_IS_BURIED_HERE, ID.text.NOTHING_OUT_OF_ORDINARY, ID.npc.BEASTMEN_TREASURE_OFFSET)
end

entity.onTrade = function(player, npc, trade)
    xi.bmt.handleQmOnTrade(player, npc, trade, ID.npc.BEASTMEN_TREASURE_OFFSET)
end

entity.onEventFinish = function(player, csid)
    xi.bmt.handleQmOnEventFinish(player, csid)
end

return entity
