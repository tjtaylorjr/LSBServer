-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Telmoda
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    local telmodaMadaline = player:getCharVar('Telmoda_Madaline_Event')

    if telmodaMadaline ~= 1 then
        player:setCharVar('Telmoda_Madaline_Event', 1)
        player:startEvent(531)
    else
        player:startEvent(616)
    end
end

entity.onEventUpdate = function(player, csid, option, npc)
end

entity.onEventFinish = function(player, csid, option, npc)
end

return entity
