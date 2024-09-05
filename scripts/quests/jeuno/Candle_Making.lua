-----------------------------------
-- Candle Making
-----------------------------------
-- !addquest 3 22
-- Rouliette : !pos -24 -2 11 244
-----------------------------------

---@type TQuest
local quest = Quest:new(xi.questLog.JEUNO, xi.quest.id.jeuno.CANDLE_MAKING)

quest.reward =
{
    fame     = 30,
    fameArea = xi.fameArea.JEUNO,
    keyItem  = xi.ki.HOLY_CANDLE,
    title    = xi.title.BELIEVER_OF_ALTANA,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == xi.questStatus.QUEST_AVAILABLE and
                player:getQuestStatus(xi.questLog.JEUNO, xi.quest.id.jeuno.A_CANDLELIGHT_VIGIL) == xi.questStatus.QUEST_ACCEPTED
        end,

        [xi.zone.UPPER_JEUNO] =
        {
            ['Rouliette'] = quest:progressEvent(36),

            onEventFinish =
            {
                [36] = function(player, csid, option, npc)
                    quest:begin(player)
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status == xi.questStatus.QUEST_ACCEPTED
        end,

        [xi.zone.UPPER_JEUNO] =
        {
            ['Rouliette'] =
            {
                onTrade = function(player, npc, trade)
                    if npcUtil.tradeHasExactly(trade, xi.item.LANOLIN_CUBE) then
                        return quest:progressEvent(37)
                    end
                end,

                onTrigger = function(player, npc)
                    return quest:progressEvent(36)
                end,
            },

            onEventFinish =
            {
                [37] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:confirmTrade()
                    end
                end,
            },
        },
    },
}

return quest
