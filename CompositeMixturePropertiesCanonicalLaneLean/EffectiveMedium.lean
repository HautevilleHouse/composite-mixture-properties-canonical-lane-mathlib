import CompositeMixturePropertiesCanonicalLaneLean.ClosureProperties

namespace HautevilleHouse
namespace CompositeMixturePropertiesCanonicalLaneLean

structure EffectiveMediumProperties where
  effectiveModulus : ℝ
  inclusionShape : String
  percolationThreshold : ℝ

def effectiveMediumClosed (E : EffectiveMediumProperties) : Prop :=
  E.effectiveModulus > 0 ∧ E.percolationThreshold ∈ Set.Ioo (0:ℝ) 1

theorem effective_medium_bridge (E : EffectiveMediumProperties) : effectiveMediumClosed E :=
  by
    constructor
    · positivity
    · exact Set.mem_Ioo.mpr ⟨by positivity, by linarith [E.percolationThreshold]⟩

end CompositeMixturePropertiesCanonicalLaneLean
end HautevilleHouse