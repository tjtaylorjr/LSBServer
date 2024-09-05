-----------------------------------
-- The Quadav's Curse
-----------------------------------
-- Log ID: 1, Quest ID: 4
-- Corann : !pos 90.935 -8.772 32.564 236
-----------------------------------

---@type TQuest
local quest = Quest:new(xi.questLog.BASTOK, xi.quest.id.bastok.THE_QUADAVS_CURSE)

quest.reward =
{
    fame     = 120,
    fameArea = xi.fameArea.BASTOK,
    item     = xi.item.BRONZE_SUBLIGAR,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == xi.questStatus.QUEST_AVAILABLE
        end,

        [xi.zone.PORT_BASTOK] =
        {
            ['Corann'] = quest:progressEvent(80),

            onEventFinish =
            {
                [80] = function(player, csid, option, npc)
                    quest:begin(player)
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status == xi.questStatus.QUEST_ACCEPTED
        end,

        [xi.zone.PORT_BASTOK] =
        {
            ['Corann'] =
            {
                onTrade = function(player, npc, trade)
                    if npcUtil.tradeHasExactly(trade, xi.item.QUADAV_BACKPLATE) then
                        return quest:progressEvent(81)
                    end
                end,
            },

            onEventFinish =
            {
                [81] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:confirmTrade()
                    end
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status == xi.questStatus.QUEST_COMPLETED and
                not player:hasCompletedQuest(xi.questLog.BASTOK, xi.quest.id.bastok.OUT_OF_ONES_SHELL)
        end,

        [xi.zone.PORT_BASTOK] =
        {
            ['Corann'] = quest:event(87):replaceDefault(),
        },
    },
}

return quest
