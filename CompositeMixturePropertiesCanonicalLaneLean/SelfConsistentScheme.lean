import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CompositeMixturePropertiesCanonicalLaneLean

structure SelfConsistentPackage where
  inclusionVolumeFraction : ℝ
  matrixModulus : ℝ
  inclusionModulus : ℝ
  effectiveModulus : ℝ
  selfConsistentEquation : Prop

structure SelfConsistentEvidence (S : SelfConsistentPackage) where
  selfConsistentEquationClosed : S.selfConsistentEquation
  effectiveModulusClosed : S.effectiveModulus = S.matrixModulus + (S.inclusionModulus - S.matrixModulus) * S.inclusionVolumeFraction

def SelfConsistentClosed (S : SelfConsistentPackage) : Prop :=
  S.selfConsistentEquation ∧ S.effectiveModulus = S.matrixModulus + (S.inclusionModulus - S.matrixModulus) * S.inclusionVolumeFraction

theorem self_consistent_closed_from_evidence (S : SelfConsistentPackage) (E : SelfConsistentEvidence S) : SelfConsistentClosed S := by
  exact And.intro E.selfConsistentEquationClosed E.effectiveModulusClosed

end CompositeMixturePropertiesCanonicalLaneLean
end HautevilleHouse