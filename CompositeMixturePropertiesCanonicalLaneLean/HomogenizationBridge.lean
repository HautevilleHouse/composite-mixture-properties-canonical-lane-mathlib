import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CompositeMixturePropertiesCanonicalLaneLean

structure HomogenizationPackage {M : MixtureComponentPackage} where
  effectiveModuli : Type u
  strainConcentrationTensor : Type v
  eshelbyTensorAvailable : Prop
  diluteLimitValid : Prop
  selfConsistentScheme : Prop

structure HomogenizationEvidence {M : MixtureComponentPackage}
    (H : HomogenizationPackage M) where
  effectiveModuliClosed : Nonempty H.effectiveModuli
  strainConcentrationTensorClosed : Nonempty H.strainConcentrationTensor
  eshelbyTensorAvailableClosed : H.eshelbyTensorAvailable
  diluteLimitValidClosed : H.diluteLimitValid
  selfConsistentSchemeClosed : H.selfConsistentScheme

def HomogenizationClosed {M : MixtureComponentPackage}
    (H : HomogenizationPackage M) : Prop :=
  Nonempty H.effectiveModuli ∧ Nonempty H.strainConcentrationTensor ∧
  H.eshelbyTensorAvailable ∧ H.diluteLimitValid ∧ H.selfConsistentScheme

theorem homogenization_closed_from_evidence {M : MixtureComponentPackage}
    (H : HomogenizationPackage M) (E : HomogenizationEvidence H) :
    HomogenizationClosed H := by
  exact And.intro E.effectiveModuliClosed
    (And.intro E.strainConcentrationTensorClosed
      (And.intro E.eshelbyTensorAvailableClosed
        (And.intro E.diluteLimitValidClosed E.selfConsistentSchemeClosed)))

end CompositeMixturePropertiesCanonicalLaneLean
end HautevilleHouse