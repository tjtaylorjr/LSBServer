-----------------------------------
-- Stop Your Whining
-----------------------------------
-- Log ID: 5, Quest ID: 132
-- Washu : !pos 49 -6 15 252
-- qm2   : !pos -94.073 -0.999 22.295 124
-----------------------------------
local yhoatorID = zones[xi.zone.YHOATOR_JUNGLE]
-----------------------------------

---@type TQuest
local quest = Quest:new(xi.questLog.OUTLANDS, xi.quest.id.outlands.STOP_YOUR_WHINING)

quest.reward =
{
    item = xi.item.SCROLL_OF_HOJO_ICHI,
    fameArea = xi.fameArea.NORG,
    fame = 75,
    title = xi.title.APPRENTICE_SOMMELIER,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == xi.questStatus.QUEST_AVAILABLE and
                player:getFameLevel(xi.fameArea.NORG) >= 4 and
                player:getMainLvl() >= 10
        end,

        [xi.zone.NORG] =
        {
            ['Washu'] = quest:progressEvent(21),

            onEventFinish =
            {
                [21] = function(player, csid, option, npc)
                    if option == 1 then
                        quest:begin(player)
                        npcUtil.giveKeyItem(player, xi.ki.EMPTY_BARREL)
                    end
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status == xi.questStatus.QUEST_ACCEPTED
        end,

        [xi.zone.NORG] =
        {
            ['Washu'] =
            {
                onTrigger = function(player, npc)
                    if player:hasKeyItem(xi.ki.EMPTY_BARREL) then
                        return quest:progressEvent(22)
                    elseif player:hasKeyItem(xi.ki.BARREL_OF_OPO_OPO_BREW) then
                        return quest:progressEvent(23)
                    end
                end,
            },

            onEventFinish =
            {
                [23] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:delKeyItem(xi.ki.BARREL_OF_OPO_OPO_BREW)
                    end
                end,
            },
        },

        [xi.zone.YHOATOR_JUNGLE] =
        {
            ['qm2'] =
            {
                onTrigger = function(player, npc)
                    if player:hasKeyItem(xi.ki.EMPTY_BARREL) then
                        player:messageSpecial(yhoatorID.text.TREE_CHECK)
                        player:delKeyItem(xi.ki.EMPTY_BARREL)
                        return quest:keyItem(xi.ki.BARREL_OF_OPO_OPO_BREW)
                    elseif player:hasKeyItem(xi.ki.BARREL_OF_OPO_OPO_BREW) then
                        return quest:messageSpecial(yhoatorID.text.TREE_FULL)
                    end
                end,
            }
        },
    },

    {
        check = function(player, status, vars)
            return status == xi.questStatus.QUEST_COMPLETED
        end,

        [xi.zone.NORG] =
        {
            ['Washu'] = quest:event(24):replaceDefault(),
        },
    },
}

return quest
