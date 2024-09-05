-----------------------------------
-- Drachenfall
-----------------------------------
-- Log ID: 1, Quest ID: 31
-- Black Mud      : !pos 63.514 7 -0.972 234
-- Waterfall Base : !pos -217.594 98.644 464.722 106
-----------------------------------

---@type TQuest
local quest = Quest:new(xi.questLog.BASTOK, xi.quest.id.bastok.DRACHENFALL)

quest.reward =
{
    fame = 120,
    fameArea = xi.fameArea.BASTOK,
    gil = 2000,
    title = xi.title.DRACHENFALL_ASCETIC,
}

quest.sections =
{
    -- Section: Quest available
    {
        check = function(player, status, vars)
            return status == xi.questStatus.QUEST_AVAILABLE and
                player:getFameLevel(xi.fameArea.BASTOK) >= 2
        end,

        [xi.zone.BASTOK_MINES] =
        {
            ['Black_Mud'] =
            {
                onTrigger = quest:progressEvent(101)
            },

            onEventFinish =
            {
                [101] = function(player, csid, option, npc)
                    if npcUtil.giveItem(player, xi.item.BRASS_CANTEEN) then
                        quest:begin(player)
                    end
                end,
            }
        },
    },

    -- Section: Quest accepted
    {
        check = function(player, status, vars)
            return status == xi.questStatus.QUEST_ACCEPTED
        end,

        [xi.zone.BASTOK_MINES] =
        {
            ['Black_Mud'] =
            {
                onTrade = function(player, npc, trade)
                    if npcUtil.tradeHasExactly(trade, xi.item.CANTEEN_OF_DRACHENFALL_WATER) then
                        return quest:progressEvent(103)
                    end
                end,

                onTrigger = function(player, npc)
                    if
                        not player:findItem(xi.item.BRASS_CANTEEN) and
                        not player:findItem(xi.item.CANTEEN_OF_DRACHENFALL_WATER)
                    then
                        return quest:progressEvent(102)
                    end
                end,
            },

            onEventFinish =
            {
                [102] = function(player, csid, option, npc)
                    npcUtil.giveItem(player, xi.item.BRASS_CANTEEN)
                end,

                [103] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:confirmTrade()
                    end
                end,
            },
        },

        [xi.zone.NORTH_GUSTABERG] =
        {
            ['Waterfall_Base'] =
            {
                onTrade = function(player, npc, trade)
                    if
                        npcUtil.tradeHasExactly(trade, xi.item.BRASS_CANTEEN) and
                        npcUtil.giveItem(player, xi.item.CANTEEN_OF_DRACHENFALL_WATER)
                    then
                        player:confirmTrade()
                    end
                end,
            },
        },
    },
}

return quest
