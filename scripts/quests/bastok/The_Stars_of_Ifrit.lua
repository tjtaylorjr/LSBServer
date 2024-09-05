-----------------------------------
-- The Stars of Ifrit
-----------------------------------
-- Log ID: 1, Quest ID: 42
-- Agapito : !pos -72.093 -3.097 9.309 236
-- qm1     : !pos -9 -5 -13 223
-----------------------------------

---@type TQuest
local quest = Quest:new(xi.questLog.BASTOK, xi.quest.id.bastok.THE_STARS_OF_IFRIT)

quest.reward =
{
    fame     = 100,
    fameArea = xi.fameArea.BASTOK,
    gil      = 2100,
    title    = xi.title.STAR_OF_IFRIT,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == xi.questStatus.QUEST_AVAILABLE and
                player:hasKeyItem(xi.ki.AIRSHIP_PASS) and
                player:getFameLevel(xi.fameArea.BASTOK) >= 3
        end,

        [xi.zone.PORT_BASTOK] =
        {
            ['Agapito'] = quest:progressEvent(180),

            onEventFinish =
            {
                [180] = function(player, csid, option, npc)
                    quest:begin(player)
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status == xi.questStatus.QUEST_ACCEPTED
        end,

        [xi.zone.PORT_BASTOK] =
        {
            ['Agapito'] =
            {
                onTrigger = function(player, npc)
                    if player:hasKeyItem(xi.ki.CARRIER_PIGEON_LETTER) then
                        return quest:progressEvent(181)
                    end
                end,
            },

            onEventFinish =
            {
                [181] = function(player, csid, option, npc)
                    quest:complete(player)
                end,
            },
        },

        [xi.zone.SAN_DORIA_JEUNO_AIRSHIP] =
        {
            ['qm1'] =
            {
                onTrigger = function(player, npc)
                    -- NOTE: Visibility of this NPC is limited to Full Moon and Night Time,
                    -- and is handled in onGameHour in Zone.lua for San d'Oria-Jeuno Airship.
                    -- This is a permanent Key Item.

                    if not player:hasKeyItem(xi.ki.CARRIER_PIGEON_LETTER) then
                        return quest:keyItem(xi.ki.CARRIER_PIGEON_LETTER)
                    end
                end,
            },
        },
    },
}

return quest
