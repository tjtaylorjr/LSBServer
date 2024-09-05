-----------------------------------
-- Vanishing Act
-- Ulamaal, Whitegate, !pos 93 -7.5 -128 50
-- Fochacha, Whitegate , !pos 3 -1 -10.781 50
-- Qutiba, Whitegate, !pos 92 -7.5 -130 50
-----------------------------------

---@type TQuest
local quest = Quest:new(xi.questLog.AHT_URHGAN, xi.quest.id.ahtUrhgan.VANISHING_ACT)

quest.reward =
{
    item = xi.item.IMPERIAL_SILVER_PIECE
}

quest.sections =
{
    -- Section: Quest available
    {
        check = function(player, status, vars)
            return status == xi.questStatus.QUEST_AVAILABLE and
                player:hasCompletedQuest(xi.questLog.AHT_URHGAN, xi.quest.id.ahtUrhgan.DELIVERING_THE_GOODS)
        end,

        [xi.zone.AHT_URHGAN_WHITEGATE] =
        {
            ['Qutiba'] =
            {
                onTrigger = function(player, npc)
                    if quest:getMustZone(player) or quest:getVar(player, 'Stage') > os.time() then
                        return quest:progressEvent(52)
                    else
                        return quest:progressEvent(42) -- Starts Quest
                    end
                end,
            },

            ['Ulamaal'] =
            {
                onTrigger = function(player, npc)
                    if player:needToZone() or quest:getVar(player, 'Stage') > os.time() then
                        return quest:progressEvent(53)
                    else
                        return quest:progressEvent(42) -- Starts Quest
                    end
                end,
            },

            ['Fochacha'] =
            {
                onTrigger = function(player, npc)
                    return quest:progressEvent(47)
                end
            },

            onEventFinish =
            {
                [42] = function(player, csid, option, npc)
                    if option == 0 then
                        quest:setVar(player, 'Stage', 0)
                        quest:begin(player)
                    end
                end,
            },
        },
    },

    -- Section: Quest accepted
    {
        check = function(player, status, vars)
            return status == xi.questStatus.QUEST_ACCEPTED
        end,

        [xi.zone.AHT_URHGAN_WHITEGATE] =
        {
            ['Fochacha'] =
            {
                onTrigger = function(player, npc)
                    if quest:getVar(player, 'Prog') == 0 then
                        return quest:progressEvent(43)
                    else
                        return quest:progressEvent(49)
                    end
                end,
            },

            ['Ulamaal'] =
            {
                onTrigger = function(player, npc)
                    if player:hasKeyItem(xi.ki.RAINBOW_BERRY) then
                        return quest:progressEvent(45)
                    else
                        return quest:progressEvent(54)
                    end
                end,
            },

            ['Qutiba'] =
            {
                onTrigger = function(player, npc)
                    if player:hasKeyItem(xi.ki.RAINBOW_BERRY) then
                        return quest:progressEvent(45)
                    else
                        return quest:progressEvent(54)
                    end
                end,
            },

            onTriggerAreaEnter =
            {
                [2] = function(player, triggerArea)
                    if quest:getVar(player, 'Prog') == 1 then
                        return quest:progressEvent(44)
                    end
                end,
            },

            onEventFinish =
            {
                [43] = function(player, csid, option, npc)
                    quest:setVar(player, 'Prog', 1)
                end,

                [44] = function(player, csid, option, npc)
                    player:setPos(-80, -6, 122, 5)
                    quest:setVar(player, 'Prog', 2)
                end,

                [45] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:needToZone(true)
                        player:delKeyItem(xi.ki.RAINBOW_BERRY)
                        -- Set variable for 'A taste of Honey' ToAU quest.
                        player:setVar('Quest[6][12]Stage', getMidnight())
                    end
                end,
            },
        },

        [xi.zone.WAJAOM_WOODLANDS] =
        {
            ['Harvesting_Point'] =
            {
                onTrade = function(player, npc, trade)
                    if
                        npcUtil.tradeHasExactly(trade, xi.item.SICKLE) and
                        quest:getVar(player, 'Prog') == 2 and
                        not player:hasKeyItem(xi.ki.RAINBOW_BERRY)
                    then
                        player:setLocalVar('questItem', 1)
                        return quest:progressEvent(507, { [0] = 4294966520 })
                    end
                end,
            },

            onEventFinish =
            {
                [507] = function(player, csid, option, npc)
                    if player:getLocalVar('questItem') == 1 then
                        npcUtil.giveKeyItem(player, xi.ki.RAINBOW_BERRY)
                        player:setLocalVar('questItem', 0)
                    end
                end,
            },
        },
    },

    -- Section: Quest completed
    {
        check = function(player, status, vars)
            return status == xi.questStatus.QUEST_COMPLETED
        end,

        [xi.zone.AHT_URHGAN_WHITEGATE] =
        {
            ['Ulamaal'] =
            {
                onTrigger = function(player, npc)
                    player:setLocalVar('recipe', 58)
                    return quest:event(58)
                end,
            },

            ['Fochacha'] =
            {
                onTrigger = function(player, npc)
                    return quest:event(59)
                end,
            },

            onEventUpdate =
            {
                [58] = function(player, csid, option, npc)
                    if player:getLocalVar('recipe') == 58 then
                        player:setLocalVar('recipe', 1)
                        player:updateEvent(5579, 1, 255, 0, 67108863, 5976652, 4095, 0)
                    elseif player:getLocalVar('recipe') == 1 then
                        player:setLocalVar('recipe', 2)
                        player:updateEvent(4096, 615, 936, 1523, 67108863, 5976652, 4, 0)
                    elseif player:getLocalVar('recipe') == 2 then
                        player:setLocalVar('recipe', 3)
                        player:updateEvent(2214, 2237, 4509, 5568)
                    elseif player:getLocalVar('recipe') == 3 then
                        player:setLocalVar('recipe', 0)
                        player:updateEvent(5575)
                    end
                end,
            },
        },
    },
}

return quest
