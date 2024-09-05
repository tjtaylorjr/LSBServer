-----------------------------------
-- Hearts of Mythril
-----------------------------------
-- Log ID: 1, Quest ID: 6
-- Elki     : !pos -17.087 -0.05 52.745 234
-- Monument : !pos 300 -62.803 498.2 106
-----------------------------------

---@type TQuest
local quest = Quest:new(xi.questLog.BASTOK, xi.quest.id.bastok.HEARTS_OF_MYTHRIL)

quest.reward =
{
    fame     = 80,
    fameArea = xi.fameArea.BASTOK,
    item     = xi.item.SITABAKI,
    title    = xi.title.PURSUER_OF_THE_PAST,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == xi.questStatus.QUEST_AVAILABLE
        end,

        [xi.zone.BASTOK_MINES] =
        {
            ['Elki'] = quest:progressEvent(41),

            onEventFinish =
            {
                [41] = function(player, csid, option, npc)
                    if option == 0 then
                        npcUtil.giveKeyItem(player, xi.ki.BOUQUET_FOR_THE_PIONEERS)
                        quest:begin(player)
                    end
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status == xi.questStatus.QUEST_ACCEPTED
        end,

        [xi.zone.BASTOK_MINES] =
        {
            ['Elki'] =
            {
                onTrigger = function(player, npc)
                    if quest:getVar(player, 'Prog') == 1 then
                        return quest:progressEvent(42)
                    end
                end,
            },

            onEventFinish =
            {
                [42] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        xi.quest.setMustZone(player, xi.questLog.BASTOK, xi.quest.id.bastok.THE_ELEVENTHS_HOUR)
                    end
                end,
            },
        },

        [xi.zone.NORTH_GUSTABERG] =
        {
            ['Monument'] =
            {
                onTrigger = function(player, npc)
                    if player:hasKeyItem(xi.ki.BOUQUET_FOR_THE_PIONEERS) then
                        return quest:progressEvent(11)
                    end
                end,
            },

            onEventFinish =
            {
                [11] = function(player, csid, option, npc)
                    if option == 0 then
                        quest:setVar(player, 'Prog', 1)
                        player:delKeyItem(xi.ki.BOUQUET_FOR_THE_PIONEERS)
                    end
                end,
            },
        },
    },
}

return quest
