-----------------------------------
-- Area: The Shrouded Maw
--  Mob: Diabolos
-----------------------------------
local ID = zones[xi.zone.THE_SHROUDED_MAW]
-----------------------------------
---@type TMobEntity
local entity = {}

-- TODO: CoP Diabolos
-- 1) Make the diremites in the pit all aggro said player that falls into region. Should have a respawn time of 10 seconds.
-- 2) Diremites also shouldnt follow you back to the fight area if you make it there. Should despawn and respawn instantly if all players
--    make it back to the Diabolos floor area.
-- 3) ANIMATION Packet ids for instance 2 and 3 are wrong (needs guesswork). Sounds working.
--    Update 2018-01-02 these no longer seem to work for any instance. neither animation nor sound.

-- TODO: Diabolos Prime
-- Note: Diabolos Prime fight drops all tiles at once.

entity.onMobFight = function(mob, target)
    local mobOffset = mob:getID() - ID.mob.DIABOLOS
    if mobOffset >= 0 and mobOffset <= 14 then
        local inst = math.floor(mobOffset / 7)

        local tileDrops =
        {
            { 10, { 'byc1', 'bya1', 'byY1' } },
            { 20, { 'byc2', 'bya2', 'byY2' } },
            { 30, { 'byc3', 'bya3', 'byY3' } },
            { 40, { 'byc4', 'bya4', 'byY4' } },
            { 50, { 'byc5', 'bya5', 'byY5' } },
            { 65, { 'byc6', 'bya6', 'byY6' } },
            { 75, { 'byc7', 'bya7', 'byY7' } },
            { 90, { 'byc8', 'bya8', 'byY8' } },
        }

        local hpp = (mob:getHP() / mob:getMaxHP()) * 100
        for index, percentTable in ipairs(tileDrops) do
            if hpp < percentTable[1] then
                local tileId = ID.npc.DARKNESS_NAMED_TILE_OFFSET + (inst * 8) + (index - 1)
                local tile = GetNPCByID(tileId)
                if tile and tile:getAnimation() == xi.anim.CLOSE_DOOR then
                    SendEntityVisualPacket(tileId, percentTable[2][inst + 1])  -- Animation for floor dropping
                    SendEntityVisualPacket(tileId, 's123')     -- Tile dropping sound
                    tile:timer(5000, function(tileArg)
                        tileArg:setAnimation(xi.anim.OPEN_DOOR)     -- Floor opens
                    end)
                end

                break
            end
        end
    end
end

entity.onMobDeath = function(mob, player, optParams)
end

return entity
