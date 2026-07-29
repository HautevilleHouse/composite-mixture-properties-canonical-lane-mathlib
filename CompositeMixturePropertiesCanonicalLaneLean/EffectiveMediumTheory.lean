import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CompositeMixturePropertiesCanonicalLaneLean

structure EffectiveMediumPackage where
  homogenizationScheme : Type u
  effectiveStiffness : Prop
  effectiveConductivity : Prop
  inclusionShapeEffect : Prop
  percolationThreshold : Prop

structure EffectiveMediumEvidence (E : EffectiveMediumPackage) where
  effectiveStiffnessClosed : E.effectiveStiffness
  effectiveConductivityClosed : E.effectiveConductivity
  inclusionShapeEffectClosed : E.inclusionShapeEffect
  percolationThresholdClosed : E.percolationThreshold

def EffectiveMediumClosed (E : EffectiveMediumPackage) : Prop :=
  E.effectiveStiffness ∧ E.effectiveConductivity ∧
  E.inclusionShapeEffect ∧ E.percolationThreshold

theorem effective_medium_closed_from_evidence (E : EffectiveMediumPackage) (Ev : EffectiveMediumEvidence E) :
    EffectiveMediumClosed E := by
  exact And.intro Ev.effectiveStiffnessClosed
    (And.intro Ev.effectiveConductivityClosed
      (And.intro Ev.inclusionShapeEffectClosed Ev.percolationThresholdClosed))

end CompositeMixturePropertiesCanonicalLaneLean
end HautevilleHouse