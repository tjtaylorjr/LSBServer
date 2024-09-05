-----------------------------------
-- Ode to the Serpents
-----------------------------------
-- Log ID: 6, Quest ID: 44
-- Fari-Wari: !pos 80 -6 -137 50
-----------------------------------

---@type TQuest
local quest = Quest:new(xi.questLog.AHT_URHGAN, xi.quest.id.ahtUrhgan.ODE_TO_THE_SERPENTS)

quest.reward =
{
    item = xi.item.IMPERIAL_GOLD_PIECE,
}

quest.sections =
{

    {
        check = function(player, status, vars)
            return status == xi.questStatus.QUEST_AVAILABLE and
            player:hasCompletedQuest(xi.questLog.AHT_URHGAN, xi.quest.id.ahtUrhgan.SAGA_OF_THE_SKYSERPENT)
        end,

        [xi.zone.AHT_URHGAN_WHITEGATE] =
        {
            ['Fari-Wari'] = quest:progressEvent(882),

            onEventFinish =
            {
                [882] = function(player, csid, option, npc)
                    quest:begin(player)
                    npcUtil.giveKeyItem(player, xi.ki.BIYAADAS_LETTER)
                end,
            },
        },
    },
    {
        check = function(player, status, vars)
            return status == xi.questStatus.QUEST_ACCEPTED
        end,

        [xi.zone.AHT_URHGAN_WHITEGATE] =
        {
            ['Fari-Wari'] =
            {
                onTrigger = function(player, npc)
                    if
                        player:hasCompletedQuest(xi.questLog.AHT_URHGAN, xi.quest.id.ahtUrhgan.WHEN_THE_BOW_BREAKS) and
                        player:hasCompletedQuest(xi.questLog.AHT_URHGAN, xi.quest.id.ahtUrhgan.FIST_OF_THE_PEOPLE)
                    then
                        return quest:progressEvent(883)
                    else
                        return quest:event(891)
                    end
                end,
            },

            onEventFinish =
            {
                [883] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:delKeyItem(xi.ki.BIYAADAS_LETTER)
                    end
                end,
            },
        },
    },
}

return quest
