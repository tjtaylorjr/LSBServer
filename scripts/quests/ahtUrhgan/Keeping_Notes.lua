-----------------------------------
-- Keeping Notes
-- Ahkk Jharcham, Whitegate , !pos 0.1 -1 -76 50
-----------------------------------

---@type TQuest
local quest = Quest:new(xi.questLog.AHT_URHGAN, xi.quest.id.ahtUrhgan.KEEPING_NOTES)

quest.sections =
{
    -- Section: Quest available
    {
        check = function(player, status, vars)
            return status == xi.questStatus.QUEST_AVAILABLE
        end,

        [xi.zone.AHT_URHGAN_WHITEGATE] =
        {
            ['Ahkk_Jharcham'] =
            {
                onTrigger = function(player, npc)
                    return quest:progressEvent(9)
                end,
            },

            onEventFinish =
            {
                [9] = function(player, csid, option, npc)
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

        [xi.zone.AHT_URHGAN_WHITEGATE] =
        {
            ['Ahkk_Jharcham'] =
            {
                onTrigger = function(player, npc)
                    return quest:progressEvent(10)
                end,

                onTrade = function(player, npc, trade)
                    if npcUtil.tradeHasExactly(trade, { xi.item.SHEET_OF_PARCHMENT, xi.item.JAR_OF_BLACK_INK }) then
                        return quest:progressEvent(11)
                    else
                        return quest:event(14)
                    end
                end,
            },

            onEventFinish =
            {
                [11] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:confirmTrade()
                        local mhflag = player:getMoghouseFlag()
                        player:setMoghouseFlag(mhflag + 0x0010)
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

        [xi.zone.AHT_URHGAN_WHITEGATE] =
        {
            ['Ahkk_Jharcham'] =
            {
                onTrigger = function(player, npc)
                    return quest:event(12)
                end,

                onTrade = function(player, npc, trade)
                    if npcUtil.tradeHasExactly(trade, xi.item.SHEET_OF_PARCHMENT) then
                        return quest:event(13)
                    else
                        return quest:event(14)
                    end
                end,
            },
        },
    },
}

return quest
