-----------------------------------
-- Father Figure
-----------------------------------
-- Log ID: 1, Quest ID: 29
-- Michea : !pos -298 -16 -157 235
-----------------------------------

---@type TQuest
local quest = Quest:new(xi.questLog.BASTOK, xi.quest.id.bastok.FATHER_FIGURE)

quest.reward =
{
    fame     = 120,
    fameArea = xi.fameArea.BASTOK,
    gil      = 2200,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == xi.questStatus.QUEST_AVAILABLE and
                player:hasCompletedQuest(xi.questLog.BASTOK, xi.quest.id.bastok.THE_ELVAAN_GOLDSMITH) and
                player:getFameLevel(xi.fameArea.BASTOK) >= 2
        end,

        [xi.zone.BASTOK_MARKETS] =
        {
            ['Michea'] = quest:progressEvent(240),

            onEventFinish =
            {
                [240] = function(player, csid, option, npc)
                    quest:begin(player)
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status == xi.questStatus.QUEST_ACCEPTED
        end,

        [xi.zone.BASTOK_MARKETS] =
        {
            ['Michea'] =
            {
                onTrade = function(player, npc, trade)
                    if npcUtil.tradeHasExactly(trade, xi.item.SILVER_INGOT) then
                        return quest:progressEvent(241)
                    end
                end,
            },

            onEventFinish =
            {
                [241] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:confirmTrade()
                    end
                end,
            },
        },
    },
}

return quest
