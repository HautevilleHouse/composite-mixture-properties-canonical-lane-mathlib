import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CompositeMixturePropertiesCanonicalLaneLean

structure MixtureComponentPackage where
  matrixType : Type u
  fiberType : Type v
  inclusionGeometry : Prop
  interfaceAdhesion : Prop
  volumeFraction : ℝ
  elasticModuli : Type w

structure MixtureComponentEvidence (M : MixtureComponentPackage) where
  inclusionGeometryClosed : M.inclusionGeometry
  interfaceAdhesionClosed : M.interfaceAdhesion
  elasticModuliDefined : M.elasticModuli

def MixtureComponentClosed (M : MixtureComponentPackage) : Prop :=
  M.inclusionGeometry ∧ M.interfaceAdhesion ∧ Nonempty M.elasticModuli

theorem mixture_component_closed_from_evidence (M : MixtureComponentPackage)
    (E : MixtureComponentEvidence M) : MixtureComponentClosed M := by
  exact And.intro E.inclusionGeometryClosed
    (And.intro E.interfaceAdhesionClosed (by
      exact Nonempty.intro E.elasticModuliDefined))

end CompositeMixturePropertiesCanonicalLaneLean
end HautevilleHouse