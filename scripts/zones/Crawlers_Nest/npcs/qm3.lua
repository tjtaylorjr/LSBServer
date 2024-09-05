-----------------------------------
-- Area: Crawlers' Nest
--  NPC: ??? - Drone Crawler (Spawn area 1)
-- !pos 4.045 -2.703 285.026 197
-----------------------------------
local ID = zones[xi.zone.CRAWLERS_NEST]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
    if npcUtil.tradeHas(trade, xi.item.ROLANBERRY_881_CE) then -- Rolanberry 881
        player:confirmTrade()
        if
            math.random(1, 100) > 50 or
            not npcUtil.popFromQM(player, npc, ID.mob.AWD_GOGGIE - 4, { claim = true, hide = 0 })
        then
            player:messageSpecial(ID.text.NOTHING_SEEMS_TO_HAPPEN)
        end
    end
end

entity.onTrigger = function(player, npc)
end

return entity
