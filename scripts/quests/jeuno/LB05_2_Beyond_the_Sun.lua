-----------------------------------
-- Beyond the Sun
-----------------------------------
-- Log ID: 3, Quest ID: 76
-- Maat : !pos 8 3 118 243
-----------------------------------
local ruludeID = zones[xi.zone.RULUDE_GARDENS]
-----------------------------------

---@type TQuest
local quest = Quest:new(xi.questLog.JEUNO, xi.quest.id.jeuno.BEYOND_THE_SUN)

quest.reward =
{
    item = xi.item.MAATS_CAP,
    title = xi.title.ULTIMATE_CHAMPION_OF_THE_WORLD,
}

quest.sections =
{
    -- Section: Quest available.
    {
        check = function(player, status, vars)
            return status == xi.questStatus.QUEST_AVAILABLE and
                player:getQuestStatus(xi.questLog.JEUNO, xi.quest.id.jeuno.SHATTERING_STARS) == xi.questStatus.QUEST_COMPLETED
        end,

        [xi.zone.RULUDE_GARDENS] =
        {
            ['Maat'] =
            {
                onTrigger = function(player, npc)
                    if player:getMainJob() <= 15 then
                        if utils.mask.isFull(player:getCharVar('maatsCap'), 15) then -- Defeated maat on 15 jobs
                            return quest:progressEvent(74)
                        else
                            return quest:event(78, player:getMainJob()) -- Rematch dialog. Job dependant.
                        end
                    else
                        return quest:messageText(ruludeID.text.MAAT_CAP_PLACEHOLDER)
                    end
                end,
            },

            onEventFinish =
            {
                [74] = function(player, csid, option, npc)
                    quest:complete(player)
                end,
            },
        },
    },

    -- Section: Quest completed.
    {
        check = function(player, status, vars)
            return status == xi.questStatus.QUEST_COMPLETED
        end,

        [xi.zone.RULUDE_GARDENS] =
        {
            ['Maat'] =
            {
                onTrigger = function(player, npc)
                    return quest:event(94) -- Default dialog after completing this quest? Needs confirmation.
                end,
            },
        },
    },
}

return quest
