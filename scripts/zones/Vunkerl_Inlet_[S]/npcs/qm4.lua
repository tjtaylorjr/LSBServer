-----------------------------------
-- Area: Vunkerl_Inlet_[S]
--  NPC: qm4 (???)
-- Involved In Quest: REDEEMING_ROCKS
-- !pos -412 -29 -45 83
-----------------------------------
local ID = zones[xi.zone.VUNKERL_INLET_S]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    if
        player:getQuestStatus(xi.questLog.CRYSTAL_WAR, xi.quest.id.crystalWar.REDEEMING_ROCKS) and
        player:getCharVar('RedeemingRocksProg') == 3
    then
        player:addKeyItem(xi.ki.PIECE_OF_KIONITE) -- 4th stop for quest "Redeeming Rocks"
        player:messageSpecial(ID.text.KEYITEM_OBTAINED, xi.ki.PIECE_OF_KIONITE)
        player:setCharVar('RedeemingRocksProg', 4)
    else
        player:messageSpecial(ID.text.NOTHING_OUT_OF_ORDINARY)
    end
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
