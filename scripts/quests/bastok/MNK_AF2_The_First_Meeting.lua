-----------------------------------
-- The First Meeting
-----------------------------------
-- Log ID: 1, Quest ID: 52
-- Oggbi         : !pos -159 -7 5 236
-- Hide Flap (2) : !pos -124 3 -43 149
-----------------------------------
local davoiID = zones[xi.zone.DAVOI]
-----------------------------------

---@type TQuest
local quest = Quest:new(xi.questLog.BASTOK, xi.quest.id.bastok.THE_FIRST_MEETING)

quest.reward =
{
    fame     = 40,
    fameArea = xi.fameArea.BASTOK,
    item     = xi.item.TEMPLE_GAITERS,
}

quest.sections =
{
    {
        check = function(player, status, vars)
            return status == xi.questStatus.QUEST_AVAILABLE and
                not quest:getMustZone(player) and
                player:hasCompletedQuest(xi.questLog.BASTOK, xi.quest.id.bastok.GHOSTS_OF_THE_PAST) and
                player:getMainJob() == xi.job.MNK and
                player:getMainLvl() >= xi.settings.main.AF2_QUEST_LEVEL
        end,

        [xi.zone.PORT_BASTOK] =
        {
            ['Oggbi'] = quest:progressEvent(233),

            onEventFinish =
            {
                [233] = function(player, csid, option, npc)
                    quest:begin(player)
                end,
            },
        },
    },

    {
        check = function(player, status, vars)
            return status == xi.questStatus.QUEST_ACCEPTED
        end,

        [xi.zone.DAVOI] =
        {
            ['Hide_Flap_2'] =
            {
                onTrigger = function(player, npc)
                    if not player:hasKeyItem(xi.ki.SAN_DORIAN_MARTIAL_ARTS_SCROLL) then
                        if quest:getLocalVar(player, 'nmKilled') == 3 then
                            npcUtil.giveKeyItem(player, xi.ki.SAN_DORIAN_MARTIAL_ARTS_SCROLL)
                        elseif
                            not GetMobByID(davoiID.mob.BILOPDOP):isSpawned() and
                            not GetMobByID(davoiID.mob.DELOKNOK):isSpawned()
                        then
                            SpawnMob(davoiID.mob.BILOPDOP):updateClaim(player)
                            SpawnMob(davoiID.mob.DELOKNOK):updateClaim(player)
                        end
                    end
                end,
            },

            ['Bilopdop'] =
            {
                onMobDeath = function(mob, player, optParams)
                    if not player:hasKeyItem(xi.ki.SAN_DORIAN_MARTIAL_ARTS_SCROLL) then
                        local nmStatus = quest:getLocalVar(player, 'nmKilled')

                        quest:setLocalVar(player, 'nmKilled', utils.mask.setBit(nmStatus, 0, true))
                    end
                end,
            },

            ['Deloknok'] =
            {
                onMobDeath = function(mob, player, optParams)
                    if not player:hasKeyItem(xi.ki.SAN_DORIAN_MARTIAL_ARTS_SCROLL) then
                        local nmStatus = quest:getLocalVar(player, 'nmKilled')

                        quest:setLocalVar(player, 'nmKilled', utils.mask.setBit(nmStatus, 1, true))
                    end
                end,
            },
        },

        [xi.zone.FEIYIN] =
        {
            onZoneIn =
            {
                function(player, prevZone)
                    if
                        prevZone == xi.zone.QUBIA_ARENA and
                        not player:hasKeyItem(xi.ki.LETTER_FROM_DALZAKK)
                    then
                        return 16
                    end
                end,
            },

            onEventFinish =
            {
                [16] = function(player, csid, option, npc)
                    npcUtil.giveKeyItem(player, xi.ki.LETTER_FROM_DALZAKK)
                end,
            },
        },

        [xi.zone.PORT_BASTOK] =
        {
            ['Oggbi'] =
            {
                onTrigger = function(player, npc)
                    if
                        player:hasKeyItem(xi.ki.LETTER_FROM_DALZAKK) and
                        player:hasKeyItem(xi.ki.SAN_DORIAN_MARTIAL_ARTS_SCROLL)
                    then
                        return quest:progressEvent(234)
                    end
                end,
            },

            onEventFinish =
            {
                [234] = function(player, csid, option, npc)
                    if quest:complete(player) then
                        player:delKeyItem(xi.ki.LETTER_FROM_DALZAKK)
                        player:delKeyItem(xi.ki.SAN_DORIAN_MARTIAL_ARTS_SCROLL)
                    end
                end,
            },
        },
    },
}

return quest
