-----------------------------------
--  Mind Wall
--
--  Description: Activates a shield to absorb all incoming magical damage.
--  Type: Magical
-----------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/settings/main")
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------
local mobskill_object = {}

mobskill_object.onMobSkillCheck = function(target, mob, skill)
    if (mob:getAnimationSub() == 3) then
        return 0
    end
    return 1
end

mobskill_object.onMobWeaponSkill = function(target, mob, skill)

    MobBuffMove(mob, xi.effect.PHYSICAL_SHIELD, 2, 0, 30)
    skill:setMsg(xi.msg.basic.NONE)

    return 0
end

return mobskill_object
