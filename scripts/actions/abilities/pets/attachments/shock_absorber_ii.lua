-----------------------------------
-- Attachment: Shock Absorber II
-----------------------------------
---@type TAttachment
local attachmentObject = {}

attachmentObject.onEquip = function(pet)
    pet:setLocalVar('shockabsorber', pet:getLocalVar('shockabsorber') + 2)
    pet:addListener('AUTOMATON_ATTACHMENT_CHECK', 'ATTACHMENT_SHOCK_ABSORBER_II', function(automaton, target)
        local master = automaton:getMaster()

        if
            not automaton:hasRecast(xi.recast.ABILITY, xi.automaton.abilities.SHOCK_ABSORBER) and
            master and
            master:countEffect(xi.effect.EARTH_MANEUVER) > 0
        then
            automaton:useMobAbility(xi.automaton.abilities.SHOCK_ABSORBER, automaton)
        end
    end)
end

attachmentObject.onUnequip = function(pet)
    pet:setLocalVar('shockabsorber', pet:getLocalVar('shockabsorber') - 2)
    pet:removeListener('ATTACHMENT_SHOCK_ABSORBER_II')
end

attachmentObject.onManeuverGain = function(pet, maneuvers)
end

attachmentObject.onManeuverLose = function(pet, maneuvers)
end

return attachmentObject
