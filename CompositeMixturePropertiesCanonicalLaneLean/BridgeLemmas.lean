import compositeMixturePropertiesCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace CompositeMixturePropertiesCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  A.object.allClosed

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A := by
  exact A.object.allClosed

end CompositeMixturePropertiesCanonicalLaneLean
end HautevilleHouse