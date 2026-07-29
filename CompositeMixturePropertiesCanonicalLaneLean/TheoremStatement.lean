import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CompositeMixturePropertiesCanonicalLaneLean

structure MixtureAdmittedObject where
  mixture : Type
  properties : Type
  mixtureValid : Prop
  conclusion : mixtureValid

def MixtureWitnessClosed (O : MixtureAdmittedObject) : Prop :=
  O.mixtureValid

end CompositeMixturePropertiesCanonicalLaneLean
end HautevilleHouse