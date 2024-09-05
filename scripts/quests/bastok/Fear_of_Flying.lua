-----------------------------------
-- Fear of Flying
-----------------------------------
-- Log ID: 1, Quest ID: 35
-- Kurando : !pos -23.887 3.898 0.870 236
-----------------------------------

---@type TQuest
local quest = Quest:new(xi.questLog.BASTOK, xi.quest.id.bastok.FEAR_OF_FLYING)

quest.reward =
{
    fame     = 30,
    fameArea = xi.fameArea.BASTOK,
    item     = xi.item.BLACK_SILK_NECKERCHIEF,
    title    = xi.title.AIRSHIP_DENOUNCER,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == xi.questStatus.QUEST_AVAILABLE and
                player:getFameLevel(xi.fameArea.BASTOK) >= 3
        end,

        [xi.zone.PORT_BASTOK] =
        {
            ['Kurando'] = quest:progressEvent(170),

            onEventFinish =
            {
                [170] = function(player, csid, option, npc)
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
            ['Kurando'] =
            {
                onTrade = function(player, npc, trade)
                    if npcUtil.tradeHasExactly(trade, xi.item.SILKWORM_EGG) then
                        return quest:progressEvent(171)
                    end
                end,
            },

            onEventFinish =
            {
                [171] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:confirmTrade()

                        quest:setVar(player, 'Option', 1)
                    end
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status == xi.questStatus.QUEST_COMPLETED
        end,

        [xi.zone.PORT_BASTOK] =
        {
            ['Kurando'] =
            {
                onTrigger = function(player, npc)
                    if quest:getVar(player, 'Option') == 1 then
                        return quest:progressEvent(172)
                    else
                        return quest:event(173):replaceDefault()
                    end
                end,
            },

            onEventFinish =
            {
                [172] = function(player, csid, option, npc)
                    quest:setVar(player, 'Option', 0)
                end,
            },
        },
    },
}

return quest
