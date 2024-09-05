-----------------------------------
-- Northward
-----------------------------------
-- Log ID: 3, Quest ID: 24
-- Radeivepart : !pos 5 9 -39 243
-----------------------------------

---@type TQuest
local quest = Quest:new(xi.questLog.JEUNO, xi.quest.id.jeuno.NORTHWARD)

quest.reward =
{
    exp      = 2000,
    fame     = 30,
    fameArea = xi.fameArea.JEUNO,
    gil      = 2000,
    keyItem  = xi.ki.MAP_OF_CASTLE_ZVAHL,
    title    = xi.title.ENVOY_TO_THE_NORTH,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == xi.questStatus.QUEST_AVAILABLE and
                player:getFameLevel(xi.fameArea.JEUNO) >= 4
        end,

        [xi.zone.RULUDE_GARDENS] =
        {
            ['Radeivepart'] = quest:progressEvent(159, { [0] = 1, [7] = 8 }),

            onEventFinish =
            {
                [159] = function(player, csid, option, npc)
                    if option == 1 then
                        quest:begin(player)
                    end
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status == xi.questStatus.QUEST_ACCEPTED
        end,

        [xi.zone.RULUDE_GARDENS] =
        {
            ['Radeivepart'] =
            {
                onTrade = function(player, npc, trade)
                    if npcUtil.tradeHasExactly(trade, xi.item.FLAME_DEGEN) then
                        return quest:progressEvent(61)
                    end
                end,

                onTrigger = quest:event(159, { [0] = 2, [7] = 8 }),
            },

            onEventFinish =
            {
                [61] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:confirmTrade()
                    end
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status == xi.questStatus.QUEST_COMPLETED
        end,

        [xi.zone.RULUDE_GARDENS] =
        {
            ['Radeivepart'] = quest:event(159, { [0] = 3, [7] = 8 }):replaceDefault(),
        },
    },
}

return quest
