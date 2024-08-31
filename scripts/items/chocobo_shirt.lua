-----------------------------------
-- ID: 10293
-- Chocobo Shirt
-- Dispense: Crystals
-----------------------------------
---@type TItem
local itemObject = {}

itemObject.onItemCheck = function(target, item, param, caster)
    return xi.itemUtils.itemBoxOnItemCheck(target)
end

itemObject.onItemUse = function(target)
    -- Crystal Item IDs:
    -- 4096 Fire
    -- 4097 Ice
    -- 4098 Wind
    -- 4099 Earth
    -- 4100 Thunder
    -- 4101 Water
    -- 4102 Light
    -- 4103 Dark
    local itemID = 4095 + VanadielDayElement()
    npcUtil.giveItem(target, { { itemID, math.random(2, 12) } })
end

return itemObject
