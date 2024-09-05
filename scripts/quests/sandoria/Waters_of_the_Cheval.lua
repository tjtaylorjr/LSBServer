-----------------------------------
-- Waters of the Cheval
-- Miageau !pos 115 0 108 231
-- Nouveil !pos 123 0 106 231
-- Cheval_River !pos 223 -58 426 101
-----------------------------------
local eastRonfaureID     = zones[xi.zone.EAST_RONFAURE]
local northernSandoriaID = zones[xi.zone.NORTHERN_SAN_DORIA]
-----------------------------------

---@type TQuest
local quest = Quest:new(xi.questLog.SANDORIA, xi.quest.id.sandoria.WATERS_OF_THE_CHEVAL)

quest.reward =
{
    fame       = 30,
    fameArea   = xi.fameArea.SANDORIA,
    item       = xi.item.WING_PENDANT,
    itemParams = { fromTrade = true },
    title      = xi.title.THE_PURE_ONE,
}

quest.sections =
{
    -- Speak with Miageau (L-7) just past the entrance to the Cathedral.
    {
        check = function(player, status, vars)
            return status == xi.questStatus.QUEST_AVAILABLE
        end,

        [xi.zone.NORTHERN_SAN_DORIA] =
        {
            ['Miageau'] =
            {
                onTrigger = function(player, npc)
                    return quest:progressEvent(504)
                end,
            },

            onEventFinish =
            {
                [504] = function(player, csid, option, npc)
                    quest:begin(player)
                end,
            },
        },
    },

    -- Buy a Blessed Waterskin by trading 10g to Nouveil (to your right).
    -- Trade the waterskin to the Cheval River target East Ronfaure (H-5) (top of the river) to receive Cheval Water.
    -- Trade Cheval Water to Miageau.
    {
        check = function(player, status, vars)
            return status == xi.questStatus.QUEST_ACCEPTED
        end,

        [xi.zone.NORTHERN_SAN_DORIA] =
        {
            ['Miageau'] =
            {
                onTrade = function(player, npc, trade)
                    if npcUtil.tradeHas(trade, xi.item.SKIN_OF_CHEVAL_RIVER_WATER) then
                        return quest:progressEvent(515)
                    end
                end,

                onTrigger = function(player, npc)
                    if player:hasItem(xi.item.BLESSED_WATERSKIN) then
                        return quest:event(512)
                    else
                        return quest:event(519)
                    end
                end,
            },

            ['Nouveil'] =
            {
                onTrade = function(player, npc, trade)
                    if npcUtil.tradeHas(trade, { { 'gil', 10 } }) then
                        player:messageSpecial(northernSandoriaID.text.YOU_DONATE_GIL)
                        return quest:progressEvent(571)
                    end
                end,

                onTrigger = function(player, npc)
                    if player:hasItem(xi.item.SKIN_OF_CHEVAL_RIVER_WATER) then
                        return quest:event(573)
                    elseif player:hasItem(xi.item.BLESSED_WATERSKIN) then
                        return quest:event(572)
                    else
                        return quest:event(575)
                    end
                end,
            },

            onEventFinish =
            {
                [515] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:confirmTrade()
                    end
                end,

                [571] = function(player, csid, option, npc)
                    if npcUtil.giveItem(player, xi.item.BLESSED_WATERSKIN, { fromTrade = true }) then
                        player:confirmTrade()
                    end
                end,
            },
        },

        [xi.zone.EAST_RONFAURE] =
        {
            ['Cheval_River'] =
            {
                onTrade = function(player, npc, trade)
                    if
                        npcUtil.tradeHas(trade, xi.item.BLESSED_WATERSKIN) and
                        npcUtil.giveItem(player, xi.item.SKIN_OF_CHEVAL_RIVER_WATER, { silent = true, fromTrade = true })
                    then
                        player:confirmTrade()
                        return quest:messageSpecial(eastRonfaureID.text.CHEVAL_RIVER_WATER, xi.item.SKIN_OF_CHEVAL_RIVER_WATER)
                    end
                end,

                onTrigger = quest:messageSpecial(eastRonfaureID.text.BLESSED_WATERSKIN),
            },
        },
    },
}

return quest
