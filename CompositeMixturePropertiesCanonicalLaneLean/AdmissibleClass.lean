import compositeMixturePropertiesCanonicalLaneLean.CompositeMixtureComponents

namespace HautevilleHouse
namespace CompositeMixturePropertiesCanonicalLaneLean

structure CompositeMixtureAdmissibleObject where
  mixturePackage : CompositeMixturePackage
  effectiveMediumPackage : EffectiveMediumPackage mixturePackage
  interfaceBondingPackage : InterfaceBondingPackage mixturePackage effectiveMediumPackage
  constitutiveModelPackage : ConstitutiveModelPackage mixturePackage effectiveMediumPackage interfaceBondingPackage
  experimentalValidationPackage : ExperimentalValidationPackage mixturePackage effectiveMediumPackage interfaceBondingPackage constitutiveModelPackage
  allClosed : CompositeMixtureClosed mixturePackage ∧
    EffectiveMediumClosed mixturePackage effectiveMediumPackage ∧
    InterfaceBondingClosed mixturePackage effectiveMediumPackage interfaceBondingPackage ∧
    ConstitutiveModelClosed mixturePackage effectiveMediumPackage interfaceBondingPackage constitutiveModelPackage ∧
    ExperimentalValidationClosed mixturePackage effectiveMediumPackage interfaceBondingPackage constitutiveModelPackage experimentalValidationPackage

structure AdmissibleClass where
  object : CompositeMixtureAdmissibleObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  A.object.allClosed ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end CompositeMixturePropertiesCanonicalLaneLean
end HautevilleHouse