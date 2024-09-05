-----------------------------------
-- Area: Alzadaal Undersea Ruins
-- Door: Gilded Gateway (Arrapago)
-- !pos -580 0 -159 72
-----------------------------------
local ID = zones[xi.zone.ALZADAAL_UNDERSEA_RUINS]
-----------------------------------
---@type TNpcEntity
local entity = {}

entity.onTrade = function(player, npc, trade)
end

entity.onTrigger = function(player, npc)
    -- TODO: Fix, implement & balance Remnants
    --[[
    if player:hasKeyItem(xi.ki.REMNANTS_PERMIT) then
        local mask = -2
        -- salvage2 NYI
        --if player:getMainLvl() >= 96 then
        --    mask = -14
        --elseif
        if player:getMainLvl() >= 65 then
            mask = -6
        end

        player:startEvent(408, 0, mask, 0, 0, 8)
    else
        player:messageSpecial(ID.text.NOTHING_HAPPENS)
    end
    ]]
    player:messageSpecial(ID.text.NOTHING_HAPPENS)
end

entity.onEventUpdate = function(player, csid, option, npc)
    -- 9 = arrapago, 54 = base salvage number
    local instanceid = bit.rshift(option, 19) + 64

    local party = player:getParty()

    if party ~= nil then
        for i, v in pairs(party) do
            if not v:hasKeyItem(xi.ki.REMNANTS_PERMIT) then
                player:messageText(npc, ID.text.MEMBER_NO_REQS, false)
                player:instanceEntry(npc, 1)
                return
            elseif v:getZoneID() == player:getZoneID() and v:checkDistance(player) > 50 then
                player:messageText(npc, ID.text.MEMBER_TOO_FAR, false)
                player:instanceEntry(npc, 1)
                return
            elseif v:checkImbuedItems() then
                player:messageText(npc, ID.text.MEMBER_IMBUED_ITEM, false)
                player:instanceEntry(npc, 1)
                return
            end
        end
    end

    player:createInstance(instanceid)
end

entity.onEventFinish = function(player, csid, option, npc)
    if (csid == 408 and option == 4) or csid == 116 then
        player:setPos(0, 0, 0, 0, 74)
    end
end

-- TODO: NPC does not support onInstanceCreated.  Move relevant
-- code to instance script when created.
--[[
entity.onInstanceCreated = function(player, target, instance)
    if instance then
        player:setInstance(instance)
        player:instanceEntry(target, 4)
        player:delKeyItem(xi.ki.REMNANTS_PERMIT)

        local party = player:getParty()
        if party ~= nil then
            for i, v in pairs(party) do
                if v:getID() ~= player:getID() and v:getZoneID() == player:getZoneID() then
                    v:setInstance(instance)
                    v:startEvent(116, 8)
                    v:delKeyItem(xi.ki.REMNANTS_PERMIT)
                    v:setLocalVar('SalvageArrapago', 1)
                end
            end
        end
    else
        player:messageText(target, ID.text.CANNOT_ENTER, false)
        player:instanceEntry(target, 3)
    end
end
]]

return entity
