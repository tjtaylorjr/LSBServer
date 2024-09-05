-----------------------------------
-- Minesweeper
-----------------------------------
-- Log ID: 1, Quest ID: 39
-- Gerbaum : !pos -119.899 -3.492 -74.651 234
-----------------------------------

---@type TQuest
local quest = Quest:new(xi.questLog.BASTOK, xi.quest.id.bastok.MINESWEEPER)

quest.reward =
{
    fame     = 8,
    fameArea = xi.fameArea.BASTOK,
    gil      = 150,
    title    = xi.title.ZERUHN_SWEEPER,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == xi.questStatus.QUEST_AVAILABLE
        end,

        [xi.zone.BASTOK_MINES] =
        {
            ['Gerbaum'] = quest:progressEvent(108),

            onEventFinish =
            {
                [108] = function(player, csid, option, npc)
                    quest:begin(player)
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status ~= xi.questStatus.QUEST_AVAILABLE
        end,

        [xi.zone.BASTOK_MINES] =
        {
            ['Gerbaum'] =
            {
                onTrade = function(player, npc, trade)
                    if npcUtil.tradeHasExactly(trade, { { xi.item.PINCH_OF_ZERUHN_SOOT, 3 } }) then
                        return quest:progressEvent(109)
                    end
                end,
            },

            onEventFinish =
            {
                [109] = function(player, csid, option, npc)
                    player:confirmTrade()

                    -- From previous implementation, award 75 fame (67 + 8) on first completion,
                    -- and 8 fame for any subsequent trade.
                    if player:getQuestStatus(quest.areaId, quest.questId) == xi.questStatus.QUEST_ACCEPTED then
                        player:addFame(xi.fameArea.BASTOK, 67)
                    end

                    quest:complete(player)
                end,
            },
        },
    },
}

return quest
