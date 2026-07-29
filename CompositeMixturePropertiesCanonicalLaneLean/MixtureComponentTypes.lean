import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CompositeMixturePropertiesCanonicalLaneLean

structure MixtureComponentPackage where
  componentType : Type u
  interfaceCompatibility : Prop
  mechanicalResponseFunction : Prop
  thermalConductivityModel : Prop
  densityProfile : Prop

structure MixtureComponentEvidence (M : MixtureComponentPackage) where
  interfaceCompatibilityClosed : M.interfaceCompatibility
  mechanicalResponseFunctionClosed : M.mechanicalResponseFunction
  thermalConductivityModelClosed : M.thermalConductivityModel
  densityProfileClosed : M.densityProfile

def MixtureComponentClosed (M : MixtureComponentPackage) : Prop :=
  M.interfaceCompatibility ∧ M.mechanicalResponseFunction ∧
  M.thermalConductivityModel ∧ M.densityProfile

theorem mixture_component_closed_from_evidence (M : MixtureComponentPackage) (E : MixtureComponentEvidence M) :
    MixtureComponentClosed M := by
  exact And.intro E.interfaceCompatibilityClosed
    (And.intro E.mechanicalResponseFunctionClosed
      (And.intro E.thermalConductivityModelClosed E.densityProfileClosed))

end CompositeMixturePropertiesCanonicalLaneLean
end HautevilleHouse