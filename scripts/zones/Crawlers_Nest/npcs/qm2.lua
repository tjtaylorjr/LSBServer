-----------------------------------
-- Area: Crawlers' Nest
--  NPC: ??? - Guardian Crawler (Spawn area 2)
-- !pos 44.436 -2.602 195.381 197
-----------------------------------
local ID = zones[xi.zone.CRAWLERS_NEST]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    if npcUtil.tradeHas(trade, xi.item.ROLANBERRY) then -- Rolanberry
        player:confirmTrade()
        if
            math.random(1, 100) > 38 or
            not npcUtil.popFromQM(player, npc, ID.mob.AWD_GOGGIE - 5, { claim = true, hide = 0 })
        then
            player:messageSpecial(ID.text.NOTHING_SEEMS_TO_HAPPEN)
        end
    end
end

entity.onTrigger = function(player, npc)
end

return entity
