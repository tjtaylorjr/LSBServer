-----------------------------------
-- Lerene's Lament
-----------------------------------
-- !addquest 9 126
-- Lerene : !pos -46.876 -179.334 -28.602 274
-----------------------------------
local outerRaKaznarID = zones[xi.zone.OUTER_RAKAZNAR]
-----------------------------------

---@type TQuest
local quest = Quest:new(xi.questLog.ADOULIN, xi.quest.id.adoulin.LERENES_LAMENT)

quest.reward =
{
    fameArea = xi.fameArea.ADOULIN,
    bayld    = 500,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == xi.questStatus.QUEST_AVAILABLE
        end,

        [xi.zone.OUTER_RAKAZNAR] =
        {
            ['Lerene'] = quest:progressEvent(22),

            onEventFinish =
            {
                [22] = function(player, csid, option, npc)
                    if option == 2 then
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

        [xi.zone.OUTER_RAKAZNAR] =
        {
            ['Lerene'] =
            {
                onTrade = function(player, npc, trade)
                    if npcUtil.tradeHasExactly(trade, { { xi.item.SQUARE_OF_ANCESTRAL_CLOTH, 2 } }) then
                        return quest:progressEvent(24)
                    end
                end,

                onTrigger = quest:event(23),
            },

            onEventFinish =
            {
                [24] = function(player, csid, option, npc)
                    npcUtil.giveKeyItem(player, xi.ki.LERENES_PATEN)
                    player:messageSpecial(outerRaKaznarID.text.YOU_HAVE_LEARNED, xi.ki.PULVERIZING)

                    if quest:complete(player) then
                        player:confirmTrade()
                        player:addKeyItem(xi.ki.PULVERIZING)
                    end
                end,
            },
        },
    },
}

return quest
