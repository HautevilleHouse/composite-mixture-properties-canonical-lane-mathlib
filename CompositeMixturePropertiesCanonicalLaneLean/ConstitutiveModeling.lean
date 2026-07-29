import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CompositeMixturePropertiesCanonicalLaneLean

structure ConstitutiveModelPackage (P : CompositeMixturePackage)
    (E : EffectiveMediumPackage P) (I : InterfaceBondingPackage P E) where
  elasticConstitutiveLaw : Prop
  plasticYieldCriterion : Prop
  damagePropagationModel : Prop
  viscoelasticCreepModel : Prop
  multiscaleHomogenization : Prop

structure ConstitutiveModelEvidence (P : CompositeMixturePackage)
    (E : EffectiveMediumPackage P) (I : InterfaceBondingPackage P E)
    (C : ConstitutiveModelPackage P E I) where
  elasticConstitutiveLawClosed : C.elasticConstitutiveLaw
  plasticYieldCriterionClosed : C.plasticYieldCriterion
  damagePropagationModelClosed : C.damagePropagationModel
  viscoelasticCreepModelClosed : C.viscoelasticCreepModel
  multiscaleHomogenizationClosed : C.multiscaleHomogenization

def ConstitutiveModelClosed (P : CompositeMixturePackage)
    (E : EffectiveMediumPackage P) (I : InterfaceBondingPackage P E)
    (C : ConstitutiveModelPackage P E I) : Prop :=
  C.elasticConstitutiveLaw ∧ C.plasticYieldCriterion ∧
  C.damagePropagationModel ∧ C.viscoelasticCreepModel ∧
  C.multiscaleHomogenization

theorem constitutive_model_closed_from_evidence (P : CompositeMixturePackage)
    (E : EffectiveMediumPackage P) (I : InterfaceBondingPackage P E)
    (C : ConstitutiveModelPackage P E I) (Ev : ConstitutiveModelEvidence P E I C) :
    ConstitutiveModelClosed P E I C := by
  exact And.intro Ev.elasticConstitutiveLawClosed
    (And.intro Ev.plasticYieldCriterionClosed
      (And.intro Ev.damagePropagationModelClosed
        (And.intro Ev.viscoelasticCreepModelClosed Ev.multiscaleHomogenizationClosed)))

end CompositeMixturePropertiesCanonicalLaneLean
end HautevilleHouse