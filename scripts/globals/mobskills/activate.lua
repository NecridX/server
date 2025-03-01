-----------------------------------
-- Activate
-- Call automaton.
-----------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/settings/main")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------
local mobskill_object = {}

mobskill_object.onMobSkillCheck = function(target, mob, skill)
    if (mob:hasPet() or mob:getPet() == nil) then
        return 1
    end
    return 0
end

mobskill_object.onMobWeaponSkill = function(target, mob, skill)

    mob:spawnPet()

    skill:setMsg(xi.msg.basic.NONE)

    return 0
end

return mobskill_object
