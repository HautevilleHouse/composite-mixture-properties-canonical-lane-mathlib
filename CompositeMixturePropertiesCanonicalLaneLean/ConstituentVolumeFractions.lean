import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CompositeMixturePropertiesCanonicalLaneLean

structure ConstituentVolumeFractionPackage where
  constituent : Type u
  volumeFraction : ℚ → Prop
  sumOfFractions : Prop
  conservationLaw : Prop
  spatialDistribution : Prop

structure ConstituentVolumeFractionEvidence (V : ConstituentVolumeFractionPackage) where
  sumOfFractionsClosed : V.sumOfFractions
  conservationLawClosed : V.conservationLaw
  spatialDistributionClosed : V.spatialDistribution

def ConstituentVolumeFractionClosed (V : ConstituentVolumeFractionPackage) : Prop :=
  V.sumOfFractions ∧ V.conservationLaw ∧ V.spatialDistribution

theorem constituent_volume_fraction_closed_from_evidence (V : ConstituentVolumeFractionPackage) (E : ConstituentVolumeFractionEvidence V) :
    ConstituentVolumeFractionClosed V := by
  exact And.intro E.sumOfFractionsClosed (And.intro E.conservationLawClosed E.spatialDistributionClosed)

end CompositeMixturePropertiesCanonicalLaneLean
end HautevilleHouse