import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CompositeMixturePropertiesCanonicalLaneLean

def ConstrainedCompositeMixtureClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_composite_mixture_endgame (A : AdmissibleClass) : ConstrainedCompositeMixtureClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end CompositeMixturePropertiesCanonicalLaneLean
end HautevilleHouse