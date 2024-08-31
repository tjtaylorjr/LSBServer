-----------------------------------
-- Attachment: Flame Holder
-----------------------------------
---@type TAttachment
local attachmentObject = {}

local validskills = set{
    1940,
    1941,
    1942,
    1943,
    2065,
    2066,
    2067,
    2299,
    2300,
    2301,
    2743,
    2744,
}

attachmentObject.onEquip = function(automaton)
    automaton:addListener('WEAPONSKILL_STATE_ENTER', 'AUTO_FLAME_HOLDER_START', function(pet, skill)
        if not validskills[skill] then
            return
        end

        local master = pet:getMaster()
        local maneuvers = master:countEffect(xi.effect.FIRE_MANEUVER)

        if maneuvers < 1 or maneuvers > 3 then
            return
        end

        local amount = 25 * maneuvers
        pet:setLocalVar('flameholdermaneuvers', maneuvers)

        pet:addMod(xi.mod.WEAPONSKILL_DAMAGE_BASE, amount)
        pet:setLocalVar('flameholder', amount)
    end)

    automaton:addListener('WEAPONSKILL_STATE_EXIT', 'AUTO_FLAME_HOLDER_END', function(pet, skill)
        local master = pet:getMaster()
        local toremove = pet:getLocalVar('flameholdermaneuvers')
        if toremove == 0 then
            return
        end

        for i = 1, toremove do
            master:delStatusEffectSilent(xi.effect.FIRE_MANEUVER)
        end

        pet:delMod(xi.mod.WEAPONSKILL_DAMAGE_BASE, pet:getLocalVar('flameholder'))
        pet:setLocalVar('flameholder', 0)
        pet:setLocalVar('flameholdermaneuvers', 0)
    end)
end

attachmentObject.onUnequip = function(pet)
    pet:removeListener('AUTO_FLAME_HOLDER_START')
    pet:removeListener('AUTO_FLAME_HOLDER_END')
end

attachmentObject.onManeuverGain = function(pet, maneuvers)
end

attachmentObject.onManeuverLose = function(pet, maneuvers)
end

return attachmentObject
