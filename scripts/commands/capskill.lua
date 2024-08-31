-----------------------------------
-- func: capskill
-- desc: Caps a specific skill.
-----------------------------------
---@type TCommand
local commandObj = {}

commandObj.cmdprops =
{
    permission = 1,
    parameters = 's'
}

local function error(player, msg)
    player:printToPlayer(msg)
    player:printToPlayer('!capskill <skillID>')
end

commandObj.onTrigger = function(player, skillId)
    -- validate skillId
    if skillId == nil then
        error(player, 'You must provide a skillID.')
        return
    end

    skillId = tonumber(skillId) or xi.skill[string.upper(skillId)]
    if skillId == nil or skillId == 0 then
        error(player, 'Invalid skillID.')
        return
    end

    -- cap skill
    player:capSkill(skillId)
    player:printToPlayer(string.format('Capped skillID %i.', skillId))
end

return commandObj
