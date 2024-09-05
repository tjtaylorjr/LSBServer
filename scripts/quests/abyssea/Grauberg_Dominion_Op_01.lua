-----------------------------------
-- Grauberg - Dominion Op #01
-----------------------------------
-- !addquest 8 115
-- Dominion Sergeant (Wolfgang's Camp)
-----------------------------------

---@type TQuest
local quest = Quest:new(xi.questLog.ABYSSEA, xi.quest.id.abyssea.DOMINION_OP_01_GRAUBERG)

quest.reward = {}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == xi.questStatus.QUEST_ACCEPTED
        end,

        [xi.zone.ABYSSEA_GRAUBERG] =
        {
            ['Sinister_Seidel'] =
            {
                onMobDeath = function(mob, player, optParams)
                    xi.abyssea.dominionOnMobDeath(mob, player, 588)
                end,
            },
        },
    },
}

return quest
