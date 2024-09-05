-----------------------------------
-- Mom, the Adventurer?
-----------------------------------
-- Log ID: 1, Quest ID: 21
-- Nbu Latteh : !pos -114.777 -4 -113.301 235
-- Roh Latteh : !pos -11.823 6.999 -9.249 234
-----------------------------------

---@type TQuest
local quest = Quest:new(xi.questLog.BASTOK, xi.quest.id.bastok.MOM_THE_ADVENTURER)

quest.reward =
{
    fame     = 20,
    fameArea = xi.fameArea.BASTOK,
    title    = xi.title.RINGBEARER,
}

local handleEventFinish = function(player, csid, option, npc)
    if quest:complete(player) then
        local gilReward = csid == 233 and 200 or 100

        player:delKeyItem(xi.ki.LETTER_FROM_ROH_LATTEH)
        npcUtil.giveCurrency(player, 'gil', gilReward)
        quest:setMustZone(player)
    end
end

quest.sections =
{
    {
        check = function(player, status, vars)
            return status ~= xi.questStatus.QUEST_ACCEPTED and
                vars.Prog == 0
        end,

        [xi.zone.BASTOK_MARKETS] =
        {
            ['Nbu_Latteh'] = quest:progressEvent(230),

            onEventFinish =
            {
                [230] = function(player, csid, option, npc)
                    if npcUtil.giveItem(player, xi.item.FIRE_CRYSTAL) then
                        quest:setVar(player, 'Prog', 1)

                        if player:getQuestStatus(quest.areaId, quest.questId) == xi.questStatus.QUEST_AVAILABLE then
                            quest:begin(player)
                        end
                    end
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status ~= xi.questStatus.QUEST_AVAILABLE and
                vars.Prog == 1
        end,

        [xi.zone.BASTOK_MARKETS] =
        {
            ['Nbu_Latteh'] =
            {
                onTrigger = function(player, npc)
                    if player:hasKeyItem(xi.ki.LETTER_FROM_ROH_LATTEH) then
                        if player:seenKeyItem(xi.ki.LETTER_FROM_ROH_LATTEH) then
                            return quest:progressEvent(234)
                        else
                            return quest:progressEvent(233)
                        end
                    else
                        return quest:event(231)
                    end
                end,
            },

            onEventFinish =
            {
                [233] = handleEventFinish,
                [234] = handleEventFinish,
            },
        },

        [xi.zone.BASTOK_MINES] =
        {
            ['Roh_Latteh'] =
            {
                onTrade = function(player, npc, trade)
                    if
                        npcUtil.tradeHasExactly(trade, xi.item.COPPER_RING) and
                        not player:hasKeyItem(xi.ki.LETTER_FROM_ROH_LATTEH)
                    then
                        return quest:progressEvent(95)
                    end
                end,
            },

            onEventFinish =
            {
                [95] = function(player, csid, option, npc)
                    player:confirmTrade()

                    npcUtil.giveKeyItem(player, xi.ki.LETTER_FROM_ROH_LATTEH)
                end,
            },
        },
    },
}

return quest
