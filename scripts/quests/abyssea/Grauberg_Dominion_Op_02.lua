-----------------------------------
-- Grauberg - Dominion Op #02
-----------------------------------
-- !addquest 8 116
-- Dominion Sergeant (Wolfgang's Camp)
-----------------------------------

---@type TQuest
local quest = Quest:new(xi.questLog.ABYSSEA, xi.quest.id.abyssea.DOMINION_OP_02_GRAUBERG)

quest.reward = {}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == xi.questStatus.QUEST_ACCEPTED
        end,

        [xi.zone.ABYSSEA_GRAUBERG] =
        {
            ['Monitor'] =
            {
                onMobDeath = function(mob, player, optParams)
                    xi.abyssea.dominionOnMobDeath(mob, player, 589)
                end,
            },
        },
    },
}

return quest
