-----------------------------------
-- Uleguerand - Dominion Op #10
-----------------------------------
-- !addquest 8 110
-- Dominion Sergeant (Romaa Mihgo's Camp)
-----------------------------------

---@type TQuest
local quest = Quest:new(xi.questLog.ABYSSEA, xi.quest.id.abyssea.DOMINION_OP_10_ULEGUERAND)

quest.reward = {}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == xi.questStatus.QUEST_ACCEPTED
        end,

        [xi.zone.ABYSSEA_ULEGUERAND] =
        {
            ['Hoarmite'] =
            {
                onMobDeath = function(mob, player, optParams)
                    xi.abyssea.dominionOnMobDeath(mob, player, 583)
                end,
            },
        },
    },
}

return quest
