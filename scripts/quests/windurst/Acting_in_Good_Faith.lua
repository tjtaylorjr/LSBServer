-----------------------------------
-- Acting in Good Faith
-----------------------------------
-- !addquest 2 64
-- Gantineux : !pos -83 -9 3 238
-- qm1       : !pos -17 0 59 195 (I-10)
-- Eperdur   : !pos 129 -6 96 231
-----------------------------------
local eldiemeID = zones[xi.zone.THE_ELDIEME_NECROPOLIS]
-----------------------------------

---@type TQuest
local quest = Quest:new(xi.questLog.WINDURST, xi.quest.id.windurst.ACTING_IN_GOOD_FAITH)

quest.reward =
{
    fame     = 30,
    fameArea = xi.fameArea.WINDURST,
    item     = xi.item.SCROLL_OF_TELEPORT_MEA,
    title    = xi.title.PILGRIM_TO_MEA,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == xi.questStatus.QUEST_AVAILABLE and
                player:getFameLevel(xi.fameArea.WINDURST) >= 4 and
                player:getMainLvl() >= 10
        end,

        [xi.zone.WINDURST_WATERS] =
        {
            ['Gantineux'] = quest:progressEvent(10019),

            onEventFinish =
            {
                [10019] = function(player, csid, option, npc)
                    if option == 0 then
                        npcUtil.giveKeyItem(player, xi.ki.SPIRIT_INCENSE)
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

        [xi.zone.WINDURST_WATERS] =
        {
            ['Gantineux'] =
            {
                onTrigger = function(player, npc)
                    if player:hasKeyItem(xi.ki.SPIRIT_INCENSE) then
                        return quest:event(10020)
                    elseif player:hasKeyItem(xi.ki.GANTINEUXS_LETTER) then
                        return quest:event(10022)
                    else
                        return quest:progressEvent(10021)
                    end
                end,
            },

            onEventFinish =
            {
                [10021] = function(player, csid, option, npc)
                    npcUtil.giveKeyItem(player, xi.ki.GANTINEUXS_LETTER)
                end,
            },
        },

        [xi.zone.THE_ELDIEME_NECROPOLIS] =
        {
            ['qm1'] =
            {
                onTrigger = function(player, npc)
                    if player:hasKeyItem(xi.ki.SPIRIT_INCENSE) then
                        return quest:progressEvent(50)
                    end
                end,
            },

            onEventFinish =
            {
                [50] = function(player, csid, option, npc)
                    player:messageSpecial(eldiemeID.text.SPIRIT_INCENSE_EMITS_PUTRID_ODOR, xi.ki.SPIRIT_INCENSE)
                    player:delKeyItem(xi.ki.SPIRIT_INCENSE)
                end,
            },
        },

        [xi.zone.NORTHERN_SAN_DORIA] =
        {
            ['Eperdur'] =
            {
                onTrigger = function(player, npc)
                    if player:hasKeyItem(xi.ki.GANTINEUXS_LETTER) then
                        return quest:progressEvent(680)
                    end
                end,
            },

            onEventFinish =
            {
                [680] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:delKeyItem(xi.ki.GANTINEUXS_LETTER)
                    end
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status == xi.questStatus.QUEST_COMPLETED
        end,

        [xi.zone.WINDURST_WATERS] =
        {
            ['Gantineux'] = quest:event(10023):replaceDefault(),
        },
    },
}

return quest
