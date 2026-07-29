import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CompositeMixturePropertiesCanonicalLaneLean

structure MixtureComponent where
  componentName : String
  volumeFraction : ℝ
  density : ℝ
  youngsModulus : ℝ

structure CompositeMaterial where
  components : List MixtureComponent
  topology : String

structure MixtureComponentsPackage where
  componentsList : List MixtureComponent
  totalVolumeFractionSum : ℝ
  phaseIdentified : Prop
  componentPropertiesDefined : Prop

structure MixtureComponentsEvidence (M : MixtureComponentsPackage) where
  totalVolumeFractionSumClosed : M.totalVolumeFractionSum = 1.0
  phaseIdentifiedClosed : M.phaseIdentified
  componentPropertiesDefinedClosed : M.componentPropertiesDefined

def MixtureComponentsClosed (M : MixtureComponentsPackage) : Prop :=
  M.totalVolumeFractionSum = 1.0 ∧ M.phaseIdentified ∧ M.componentPropertiesDefined

theorem mixture_components_closed_from_evidence (M : MixtureComponentsPackage) (E : MixtureComponentsEvidence M) : MixtureComponentsClosed M := by
  exact And.intro E.totalVolumeFractionSumClosed (And.intro E.phaseIdentifiedClosed E.componentPropertiesDefinedClosed)

end CompositeMixturePropertiesCanonicalLaneLean
end HautevilleHouse