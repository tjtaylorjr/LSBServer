-----------------------------------
-- ID: 5837
-- Item: tube_of_clear_salve_i
-- Item Effect: Instantly removes 1-2 negative status effects at random from pet
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    if not target:hasPet() then
        return xi.msg.basic.REQUIRES_A_PET
    end

    return 0
end

itemObject.onItemUse = function(target)
    local pet = target:getPet()
    local effects =
    {
        xi.effect.PETRIFICATION,
        xi.effect.SILENCE,
        xi.effect.BANE,
        xi.effect.CURSE_II,
        xi.effect.CURSE_I,
        xi.effect.PARALYSIS,
        xi.effect.PLAGUE,
        xi.effect.POISON,
        xi.effect.DISEASE,
        xi.effect.BLINDNESS
    }

    local count = math.random(1, 2)
    local random = 1

    xi.itemUtils.removeMultipleEffects(pet, effects, count, random)
end

return itemObject
