-----------------------------------
-- Forever to Hold
-----------------------------------
-- Log ID: 1, Quest ID: 17
-- Qiji    : !pos 4.257 4.898 -18.92 236
-- Romilda : !pos 5.424 4.898 -18.699 236
-----------------------------------

---@type TQuest
local quest = Quest:new(xi.questLog.BASTOK, xi.quest.id.bastok.FOREVER_TO_HOLD)

quest.reward =
{
    fame     = 80,
    fameArea = xi.fameArea.BASTOK,
    gil      = 300,
    title    = xi.title.QIJIS_FRIEND,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == xi.questStatus.QUEST_AVAILABLE and
                player:getFameLevel(xi.fameArea.BASTOK) >= 2
        end,

        [xi.zone.PORT_BASTOK] =
        {
            ['Qiji'] = quest:progressEvent(123),

            onEventFinish =
            {
                [123] = function(player, csid, option, npc)
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
            ['Qiji'] =
            {
                onTrade = function(player, npc, trade)
                    if npcUtil.tradeHasExactly(trade, xi.item.BRASS_HAIRPIN) then
                        return quest:event(124)
                    end
                end,

                onTrigger = function(player, npc)
                    if quest:getVar(player, 'Prog') == 1 then
                        return quest:progressEvent(126)
                    end
                end,
            },

            ['Romilda'] =
            {
                onTrade = function(player, npc, trade)
                    if npcUtil.tradeHasExactly(trade, xi.item.BRASS_HAIRPIN) then
                        return quest:progressEvent(125)
                    end
                end,
            },

            onEventFinish =
            {
                [125] = function(player, csid, option, npc)
                    player:confirmTrade()

                    quest:setVar(player, 'Prog', 1)
                end,

                [126] = function(player, csid, option, npc)
                    quest:complete(player)
                end,
            },
        },
    },
}

return quest
