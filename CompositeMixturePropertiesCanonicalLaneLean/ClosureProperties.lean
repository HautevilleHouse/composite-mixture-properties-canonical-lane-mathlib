import CompositeMixturePropertiesCanonicalLaneLean.ModelingFramework

namespace HautevilleHouse
namespace CompositeMixturePropertiesCanonicalLaneLean

structure MixingClosureModel where
  mixtureRule : String → ℝ → ℝ
  closureParameters : List ℝ

def closurePropertiesClosed (M : MixingClosureModel) : Prop :=
  M.mixtureRule "closure" 0 = 0 ∧ M.closureParameters.length > 0

theorem closure_from_mixture_components (M : MixingClosureModel) : closurePropertiesClosed M :=
  by
    exact And.intro rfl (by
      simp [M.closureParameters.length])

end CompositeMixturePropertiesCanonicalLaneLean
end HautevilleHouse