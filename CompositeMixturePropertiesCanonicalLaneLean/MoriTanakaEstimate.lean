import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CompositeMixturePropertiesCanonicalLaneLean

structure MoriTanakaEstimatePackage where
  inclusionAspectRatio : ℝ
  inclusionVolumeFraction : ℝ
  estimatedYoungModulus : ℝ
  estimateValid : Prop
  diluteLimitConsistent : Prop

structure MoriTanakaEstimateEvidence (M : MoriTanakaEstimatePackage) where
  inclusionAspectRatioClosed : M.inclusionAspectRatio > 0
  inclusionVolumeFractionClosed : M.inclusionVolumeFraction ≥ 0 ∧ M.inclusionVolumeFraction ≤ 1
  estimatedYoungModulusClosed : M.estimatedYoungModulus > 0
  estimateValidClosed : M.estimateValid
  diluteLimitConsistentClosed : M.diluteLimitConsistent

def MoriTanakaEstimateClosed (M : MoriTanakaEstimatePackage) : Prop :=
  M.inclusionAspectRatio > 0 ∧ M.inclusionVolumeFraction ≥ 0 ∧ M.inclusionVolumeFraction ≤ 1 ∧ M.estimatedYoungModulus > 0 ∧ M.estimateValid ∧ M.diluteLimitConsistent

theorem mori_tanaka_estimate_closed_from_evidence (M : MoriTanakaEstimatePackage) (E : MoriTanakaEstimateEvidence M) : MoriTanakaEstimateClosed M := by
  exact And.intro E.inclusionAspectRatioClosed (And.intro (And.intro (E.inclusionVolumeFractionClosed.1) (E.inclusionVolumeFractionClosed.2)) (And.intro E.estimatedYoungModulusClosed (And.intro E.estimateValidClosed E.diluteLimitConsistentClosed)))

end CompositeMixturePropertiesCanonicalLaneLean
end HautevilleHouse