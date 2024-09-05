-----------------------------------
-- A Stone's Throw Away
-----------------------------------
-- !addquest 9 56
-- Apolliane : !pos 447.088 -15.846 -320 265
-----------------------------------
local morimarID = zones[xi.zone.MORIMAR_BASALT_FIELDS]
-----------------------------------

---@type TQuest
local quest = Quest:new(xi.questLog.ADOULIN, xi.quest.id.adoulin.A_STONES_THROW_AWAY)

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

        [xi.zone.MORIMAR_BASALT_FIELDS] =
        {
            ['Apolliane'] = quest:progressEvent(2571),

            onEventFinish =
            {
                [2571] = function(player, csid, option, npc)
                    quest:begin(player)
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status == xi.questStatus.QUEST_ACCEPTED
        end,

        [xi.zone.MORIMAR_BASALT_FIELDS] =
        {
            ['Apolliane'] =
            {
                onTrade = function(player, npc, trade)
                    -- TODO: Morimar Basalt Fields HELM is not implemented at this time.  When it is,
                    -- on mining a Marble Nugget, set the Prog quest variable to 1, as this quest requires
                    -- the player to mine this object.
                    if
                        npcUtil.tradeHasExactly(trade, xi.item.MARBLE_NUGGET) and
                        quest:getVar(player, 'Prog') == 1
                    then
                        return quest:progressEvent(2573)
                    end
                end,

                onTrigger = quest:event(2572),
            },

            onEventFinish =
            {
                [2573] = function(player, csid, option, npc)
                    player:messageSpecial(morimarID.text.YOU_HAVE_LEARNED, xi.ki.DEMOLISHING)

                    if quest:complete(player) then
                        player:addKeyItem(xi.ki.DEMOLISHING)
                        player:confirmTrade()
                    end
                end,
            },
        },
    },
}

return quest
