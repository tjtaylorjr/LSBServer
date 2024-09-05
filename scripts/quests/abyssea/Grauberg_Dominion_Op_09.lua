-----------------------------------
-- Grauberg - Dominion Op #09
-----------------------------------
-- !addquest 8 123
-- Dominion Sergeant (Cornelia's Camp)
-----------------------------------

---@type TQuest
local quest = Quest:new(xi.questLog.ABYSSEA, xi.quest.id.abyssea.DOMINION_OP_09_GRAUBERG)

quest.reward = {}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == xi.questStatus.QUEST_ACCEPTED
        end,

        [xi.zone.ABYSSEA_GRAUBERG] =
        {
            ['Peak_Pugil'] =
            {
                onMobDeath = function(mob, player, optParams)
                    xi.abyssea.dominionOnMobDeath(mob, player, 596)
                end,
            },
        },
    },
}

return quest
