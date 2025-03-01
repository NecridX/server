-----------------------------------
-- Feeble Bleat
-- Emits a unnerving bleat that paralyzes down players in range.
--
-----------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/settings/main")
require("scripts/globals/status")
-----------------------------------
local mobskill_object = {}

mobskill_object.onMobSkillCheck = function(target, mob, skill)
    return 0
end

mobskill_object.onMobWeaponSkill = function(target, mob, skill)
    local typeEffect = xi.effect.PARALYSIS

    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 25, 0, 120))

    return typeEffect
end

return mobskill_object
