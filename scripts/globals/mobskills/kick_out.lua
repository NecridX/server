-----------------------------------
-- Kick Out
--
-- Description: Deals heavy damage and inflicts blind to any target behind user.
-- Type: Physical
-- Utsusemi/Blink absorb: 2-3 shadows
-- Range: Unknown cone, backwards
-- Notes:  Only used when the Behemoth is attacking with its tail.
-----------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/settings/main")
require("scripts/globals/status")
-----------------------------------
local mobskill_object = {}

mobskill_object.onMobSkillCheck = function(target, mob, skill)
    if (target:isBehind(mob, 48) == false) then
        return 1
    end
    return 0
end

mobskill_object.onMobWeaponSkill = function(target, mob, skill)
    local numhits = math.random(2, 3)
    local accmod = 1
    local dmgmod = 3
    local info = MobPhysicalMove(mob, target, skill, numhits, accmod, dmgmod, TP_NO_EFFECT)
    local dmg = MobFinalAdjustments(info.dmg, mob, skill, target, xi.attackType.PHYSICAL, xi.damageType.H2H, info.hitslanded)

    local typeEffect = xi.effect.BLINDNESS

    MobPhysicalStatusEffectMove(mob, target, skill, typeEffect, 20, 0, 120)

    target:takeDamage(dmg, mob, xi.attackType.PHYSICAL, xi.damageType.H2H)
    return dmg
end

return mobskill_object
