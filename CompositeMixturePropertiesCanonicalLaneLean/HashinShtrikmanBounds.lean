import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CompositeMixturePropertiesCanonicalLaneLean

structure HashinShtrikmanBoundsPackage where
  upperBoundYoung : ℝ
  lowerBoundYoung : ℝ
  upperBoundShear : ℝ
  lowerBoundShear : ℝ
  boundsTight : Prop
  boundsVerified : Prop

structure HashinShtrikmanBoundsEvidence (H : HashinShtrikmanBoundsPackage) where
  upperBoundYoungClosed : H.upperBoundYoung ≥ H.lowerBoundYoung
  lowerBoundYoungClosed : H.lowerBoundYoung ≤ H.upperBoundYoung
  upperBoundShearClosed : H.upperBoundShear ≥ H.lowerBoundShear
  lowerBoundShearClosed : H.lowerBoundShear ≤ H.upperBoundShear
  boundsTightClosed : H.boundsTight
  boundsVerifiedClosed : H.boundsVerified

def HashinShtrikmanBoundsClosed (H : HashinShtrikmanBoundsPackage) : Prop :=
  H.upperBoundYoung ≥ H.lowerBoundYoung ∧ H.upperBoundShear ≥ H.lowerBoundShear ∧ H.boundsTight ∧ H.boundsVerified

theorem hashin_shtrikman_bounds_closed_from_evidence (H : HashinShtrikmanBoundsPackage) (E : HashinShtrikmanBoundsEvidence H) : HashinShtrikmanBoundsClosed H := by
  exact And.intro (And.intro E.upperBoundYoungClosed E.lowerBoundYoungClosed) (And.intro (And.intro E.upperBoundShearClosed E.lowerBoundShearClosed) (And.intro E.boundsTightClosed E.boundsVerifiedClosed))

end CompositeMixturePropertiesCanonicalLaneLean
end HautevilleHouse