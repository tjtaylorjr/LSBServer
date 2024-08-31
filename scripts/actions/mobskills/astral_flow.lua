-----------------------------------
-- Astral Flow
-----------------------------------
---@type TMobSkill
local mobskillObject = {}

local avatarOffsets =
{
    [17444883] = 3, -- Vermilion-eared Noberry
    [17444890] = 3, -- Vermilion-eared Noberry
    [17444897] = 3, -- Vermilion-eared Noberry
    [17453078] = 3, -- Duke Dantalian
    [17453085] = 3, -- Duke Dantalian
    [17453092] = 3, -- Duke Dantalian
    [17506670] = 5, -- Kirin
}

mobskillObject.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskillObject.onMobWeaponSkill = function(target, mob, skill)
    skill:setMsg(xi.msg.basic.USES)

    local mobID  = mob:getID()
    local avatar = mobID + 2 -- default offset

    if avatarOffsets[mobID] then
        avatar = mobID + avatarOffsets[mobID]
    end

    if not GetMobByID(avatar):isSpawned() then
        GetMobByID(avatar):setSpawn(mob:getXPos() + 1, mob:getYPos(), mob:getZPos() + 1, mob:getRotPos())
        local mobTarget = mob:getTarget()
        if mobTarget then
            SpawnMob(avatar):updateEnmity(mobTarget)
        end
    end

    return xi.effect.ASTRAL_FLOW
end

return mobskillObject
