-----------------------------------
-- ID: 15838
-- Item: Protect Ring
-- Item Effect: Protect II
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return 0
end

itemObject.onItemUse = function(target)
    local power = 50
    local tier = 2
    local bonus = 0
    if target:getMod(xi.mod.ENHANCES_PROT_SHELL_RCVD) > 0 then
        bonus = 2 -- 2x Tier from MOD
    end

    power = power + (bonus * tier)

    if target:addStatusEffect(xi.effect.PROTECT, power, 0, 1800, 0, 0, tier) then
        target:messageBasic(xi.msg.basic.GAINS_EFFECT_OF_STATUS, xi.effect.PROTECT)
    else
        target:messageBasic(xi.msg.basic.NO_EFFECT)
    end
end

return itemObject
