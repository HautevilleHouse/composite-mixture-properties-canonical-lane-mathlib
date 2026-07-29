import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CompositeMixturePropertiesCanonicalLaneLean

structure FailureCriteriaPackage where
  failureMode : Type u
  yieldCriterion : Prop
  fractureToughness : Prop
  fatigueLife : Prop
  environmentalDegradation : Prop

structure FailureCriteriaEvidence (F : FailureCriteriaPackage) where
  yieldCriterionClosed : F.yieldCriterion
  fractureToughnessClosed : F.fractureToughness
  fatigueLifeClosed : F.fatigueLife
  environmentalDegradationClosed : F.environmentalDegradation

def FailureCriteriaClosed (F : FailureCriteriaPackage) : Prop :=
  F.yieldCriterion ∧ F.fractureToughness ∧
  F.fatigueLife ∧ F.environmentalDegradation

theorem failure_criteria_closed_from_evidence (F : FailureCriteriaPackage) (E : FailureCriteriaEvidence F) :
    FailureCriteriaClosed F := by
  exact And.intro E.yieldCriterionClosed
    (And.intro E.fractureToughnessClosed
      (And.intro E.fatigueLifeClosed E.environmentalDegradationClosed))

end CompositeMixturePropertiesCanonicalLaneLean
end HautevilleHouse