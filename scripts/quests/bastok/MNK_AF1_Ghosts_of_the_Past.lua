-----------------------------------
-- Ghosts of the Past
-----------------------------------
-- Log ID: 1, Quest ID: 51
-- Oggbi : !pos -159 -7 5 236
-- qm4   : !pos -174 0 369 196
-----------------------------------
local gusgenMinesID = zones[xi.zone.GUSGEN_MINES]
-----------------------------------

---@type TQuest
local quest = Quest:new(xi.questLog.BASTOK, xi.quest.id.bastok.GHOSTS_OF_THE_PAST)

quest.reward =
{
    fame     = 20,
    fameArea = xi.fameArea.BASTOK,
    item     = xi.item.BEAT_CESTI,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == xi.questStatus.QUEST_AVAILABLE and
                player:getMainJob() == xi.job.MNK and
                player:getMainLvl() >= xi.settings.main.AF1_QUEST_LEVEL
        end,

        [xi.zone.PORT_BASTOK] =
        {
            ['Oggbi'] = quest:progressEvent(231),

            onEventFinish =
            {
                [231] = function(player, csid, option, npc)
                    quest:begin(player)
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status == xi.questStatus.QUEST_ACCEPTED
        end,

        [xi.zone.GUSGEN_MINES] =
        {
            ['qm4'] =
            {
                onTrade = function(player, npc, trade)
                    if
                        npcUtil.tradeHasExactly(trade, xi.item.PICKAXE) and
                        not player:hasItem(xi.item.MINERS_PENDANT) and
                        not GetMobByID(gusgenMinesID.mob.WANDERING_GHOST):isSpawned()
                    then
                        player:confirmTrade()
                        SpawnMob(gusgenMinesID.mob.WANDERING_GHOST):updateClaim(player)

                        -- TODO: Determine if this spawn has a message associated with it.
                        return quest:noAction()
                    end
                end,
            },
        },

        [xi.zone.PORT_BASTOK] =
        {
            ['Oggbi'] =
            {
                onTrade = function(player, npc, trade)
                    if npcUtil.tradeHasExactly(trade, xi.item.MINERS_PENDANT) then
                        return quest:progressEvent(232)
                    end
                end,
            },

            onEventFinish =
            {
                [232] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:confirmTrade()

                        xi.quest.setMustZone(player, xi.questLog.BASTOK, xi.quest.id.bastok.THE_FIRST_MEETING)
                    end
                end,
            },
        },
    },
}

return quest
