-----------------------------------
-- When the Bow Breaks
-----------------------------------
-- Log ID: 6, Quest ID: 45
-- Gaweesh: !pos -64 -7 38 48
-- Giwahb Watchtower: !pos -339 -37 654 51
-----------------------------------
local ID = zones[xi.zone.WAJAOM_WOODLANDS]
-----------------------------------

---@type TQuest
local quest = Quest:new(xi.questLog.AHT_URHGAN, xi.quest.id.ahtUrhgan.WHEN_THE_BOW_BREAKS)

quest.reward =
{
    title = xi.title.GALESERPENT_GUARDIAN,
}

quest.sections =
{

    {
        check = function(player, status, vars)
            return status == xi.questStatus.QUEST_AVAILABLE and
            player:hasCompletedQuest(xi.questLog.AHT_URHGAN, xi.quest.id.ahtUrhgan.ODE_TO_THE_SERPENTS)
        end,

        [xi.zone.AL_ZAHBI] =
        {
            ['Gaweesh'] = quest:progressEvent(280),

            onEventFinish =
            {
                [280] = function(player, csid, option, npc)
                    quest:begin(player)
                end,
            },
        },
    },
    {
        check = function(player, status, vars)
            return status == xi.questStatus.QUEST_ACCEPTED
        end,

        [xi.zone.WAJAOM_WOODLANDS] =
        {
            ['Giwahb_Watchtower'] =
            {
                onTrade = function(player, npc, trade)
                    if npcUtil.tradeHasExactly(trade, xi.item.FRAYED_ARROW) then
                        return quest:progressEvent(512)
                    end
                end,
            },

            onEventFinish =
            {
                [512] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:confirmTrade()
                        player:messageSpecial(ID.text.INCREASED_STANDING)
                        player:addCurrency('imperial_standing', 500)
                    end
                end,
            },
        },
    },
}

return quest
