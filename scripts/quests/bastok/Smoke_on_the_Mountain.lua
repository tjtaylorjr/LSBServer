-----------------------------------
-- Shady Business
-----------------------------------
-- Log ID: 1, Quest ID: 15
-- Hungry Wolf : !pos -25.861 -11 -30.172 237
-- Offa: !pos -283-6 -15.9 -140.3 235
-- ??? (Campfire) !pos 461.8 -20.9 -578.5 107
-----------------------------------
local southGustabergID = zones[xi.zone.SOUTH_GUSTABERG]
-----------------------------------

---@type TQuest
local quest = Quest:new(xi.questLog.BASTOK, xi.quest.id.bastok.SMOKE_ON_THE_MOUNTAIN)

quest.reward =
{
    fame     = 5,
    fameArea = xi.fameArea.BASTOK,
    gil      = 300,
    title    = xi.title.HOT_DOG,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == xi.questStatus.QUEST_AVAILABLE
        end,

        [xi.zone.METALWORKS] =
        {
            ['Hungry_Wolf'] = quest:progressEvent(428),

            onEventFinish =
            {
                [428] = function(player, csid, option, npc)
                    quest:begin(player)
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status >= xi.questStatus.QUEST_ACCEPTED
        end,

        [xi.zone.METALWORKS] =
        {
            ['Hungry_Wolf'] =
            {
                onTrade = function(player, npc, trade)
                    if npcUtil.tradeHasExactly(trade, xi.item.GALKAN_SAUSAGE) then
                        return quest:progressEvent(429)
                    end
                end,
            },

            onEventFinish =
            {
                [429] = function(player, csid, option, npc)
                    player:confirmTrade()

                    if player:getQuestStatus(quest.areaId, quest.questId) == xi.questStatus.QUEST_ACCEPTED then
                        player:addFame(xi.fameArea.BASTOK, 25)
                    end

                    quest:complete(player)
                end,
            },
        },

        [xi.zone.BASTOK_MARKETS] =
        {
            ['Offa'] = quest:event(222),
        },

        [xi.zone.SOUTH_GUSTABERG] =
        {
            ['qm2'] =
            {
                onTrade = function(player, npc, trade)
                    if npcUtil.tradeHasExactly(trade, xi.item.SLICE_OF_GIANT_SHEEP_MEAT) then
                        if quest:getLocalVar(player, 'Timer') == 0 then
                            player:confirmTrade()
                            quest:setLocalVar(player, 'Timer', os.time() + 60)

                            return quest:messageSpecial(southGustabergID.text.FIRE_PUT, xi.item.SLICE_OF_GIANT_SHEEP_MEAT)
                        else
                            return quest:messageSpecial(southGustabergID.text.MEAT_ALREADY_PUT, xi.item.SLICE_OF_GIANT_SHEEP_MEAT)
                        end
                    end
                end,

                onTrigger = function(player, npc)
                    local cookTimer = quest:getLocalVar(player, 'Timer')

                    if cookTimer == 0 then
                        return quest:messageSpecial(southGustabergID.text.FIRE_GOOD)
                    elseif os.time() < cookTimer then
                        return quest:messageSpecial(southGustabergID.text.FIRE_LONGER, xi.item.SLICE_OF_GIANT_SHEEP_MEAT)
                    else
                        quest:setLocalVar(player, 'Timer', 0)

                        if player:getFreeSlotsCount() == 0 then
                            return quest:messageSpecial(southGustabergID.text.ITEM_CANNOT_BE_OBTAINED, xi.item.GALKAN_SAUSAGE)
                        else
                            player:messageSpecial(southGustabergID.text.FIRE_TAKE, xi.item.GALKAN_SAUSAGE)
                            npcUtil.giveItem(player, xi.item.GALKAN_SAUSAGE)

                            return quest:noAction()
                        end
                    end
                end,
            },
        },
    },
}

return quest
