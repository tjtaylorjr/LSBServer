-----------------------------------
-- What Friends Are For
-- Region !pos -389 13 -445 68
-- Tsetseroon !pos -13 -6 69 53
-- Qm9 !pos -406 6.5 -440 68
-----------------------------------

---@type TQuest
local quest = Quest:new(xi.questLog.AHT_URHGAN, xi.quest.id.ahtUrhgan.WHAT_FRIENDS_ARE_FOR)

quest.sections =
{
    -- Section: Quest available
    {
        check = function(player, status, vars)
            return status == xi.questStatus.QUEST_AVAILABLE and vars.Prog == 0
        end,

        [xi.zone.AYDEEWA_SUBTERRANE] =
        {
            onTriggerAreaEnter =
            {
                [2] = function(player, triggerArea)
                    return quest:progressEvent(7)
                end,
            },

            onEventFinish =
            {
                [7] = function(player, csid, option, npc)
                    quest:setVar(player, 'Prog', 1)
                end,
            },
        },

        [xi.zone.NASHMAU] =
        {
            ['Tsetseroon'] =
            {
                onTrigger = function(player, npc)
                    return quest:event(4)
                end,
            },
        },
    },

    -- Section: Quest available, step 2
    {
        check = function(player, status, vars)
            return status == xi.questStatus.QUEST_AVAILABLE and vars.Prog == 1
        end,

        [xi.zone.NASHMAU] =
        {
            ['Tsetseroon'] =
            {
                onTrigger = function(player, npc)
                    return quest:progressEvent(16)
                end,
            },

            onEventFinish =
            {
                [16] = function(player, csid, option, npc)
                    quest:setVar(player, 'Prog', 2)
                    quest:begin(player)
                end,
            },
        },
    },

    -- Section: Quest accepted
    {
        check = function(player, status, vars)
            return status == xi.questStatus.QUEST_ACCEPTED
        end,

        [xi.zone.NASHMAU] =
        {
            ['Tsetseroon'] =
            {
                onTrigger = function(player, npc)
                    if quest:getVar(player, 'Prog') == 2 then
                        return quest:event(17)
                    elseif quest:getVar(player, 'Prog') == 3 then
                        return quest:event(19)
                    elseif quest:getVar(player, 'Prog') == 4 then
                        return quest:progressEvent(20)
                    end
                end,

                onTrade = function(player, npc, trade)
                    if
                        quest:getVar(player, 'Prog') == 2 and
                        npcUtil.tradeHasExactly(trade, { xi.item.CHUNK_OF_TIN_ORE, xi.item.COBALT_JELLYFISH })
                    then
                        return quest:progressEvent(18)
                    end
                end,
            },

            onEventFinish =
            {
                [18] = function(player, csid, option, npc)
                    player:confirmTrade()
                    npcUtil.giveKeyItem(player, xi.ki.POT_OF_TSETSEROONS_STEW)
                    quest:setVar(player, 'Prog', 3)
                end,

                [20] = function(player, csid, option, npc)
                    if player:hasKeyItem(xi.ki.MAP_OF_AYDEEWA_SUBTERRANE) then
                        if npcUtil.giveItem(player, xi.item.IMPERIAL_BRONZE_PIECE) then
                            quest:complete(player)
                        end
                    else
                        if quest:complete(player) then
                            npcUtil.giveKeyItem(player, xi.ki.MAP_OF_AYDEEWA_SUBTERRANE)
                        end
                    end
                end,
            },
        },

        [xi.zone.AYDEEWA_SUBTERRANE] =
        {
            ['qm9'] =
            {
                onTrigger = function(player, npc)
                    if
                        quest:getVar(player, 'Prog') == 3 and
                        player:hasKeyItem(xi.ki.POT_OF_TSETSEROONS_STEW)
                    then
                        return quest:progressEvent(8)
                    end
                end,
            },

            onEventFinish =
            {
                [8] = function(player, csid, option, npc)
                    quest:setVar(player, 'Prog', 4)
                    player:delKeyItem(xi.ki.POT_OF_TSETSEROONS_STEW)
                    if option == 1 then
                        npcUtil.giveKeyItem(player, xi.ki.MAP_OF_AYDEEWA_SUBTERRANE)
                    end
                end,
            },
        },
    },

    -- Section: Quest completed
    {
        check = function(player, status, vars)
            return status == xi.questStatus.QUEST_COMPLETED
        end,

        [xi.zone.NASHMAU] =
        {
            ['Tsetseroon'] =
            {
                onTrigger = function(player, npc)
                    return quest:event(21)
                end,
            },
        },
    },
}

return quest
