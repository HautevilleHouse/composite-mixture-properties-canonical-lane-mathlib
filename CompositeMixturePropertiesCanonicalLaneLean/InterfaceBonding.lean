import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CompositeMixturePropertiesCanonicalLaneLean

structure InterfaceBondingPackage (P : CompositeMixturePackage) (E : EffectiveMediumPackage P) where
  stressTransferAcrossInterface : Prop
  interfacialShearStrength : ℝ
  debondingCondition : Prop
  coatingLayerModel : Prop

structure InterfaceBondingEvidence (P : CompositeMixturePackage)
    (E : EffectiveMediumPackage P) (I : InterfaceBondingPackage P E) where
  stressTransferAcrossInterfaceClosed : I.stressTransferAcrossInterface
  interfacialShearStrengthClosed : I.interfacialShearStrength ≥ 0
  debondingConditionClosed : I.debondingCondition
  coatingLayerModelClosed : I.coatingLayerModel

def InterfaceBondingClosed (P : CompositeMixturePackage)
    (E : EffectiveMediumPackage P) (I : InterfaceBondingPackage P E) : Prop :=
  I.stressTransferAcrossInterface ∧ I.interfacialShearStrength ≥ 0 ∧
  I.debondingCondition ∧ I.coatingLayerModel

theorem interface_bonding_closed_from_evidence (P : CompositeMixturePackage)
    (E : EffectiveMediumPackage P) (I : InterfaceBondingPackage P E)
    (Ev : InterfaceBondingEvidence P E I) : InterfaceBondingClosed P E I := by
  exact And.intro Ev.stressTransferAcrossInterfaceClosed
    (And.intro Ev.interfacialShearStrengthClosed
      (And.intro Ev.debondingConditionClosed Ev.coatingLayerModelClosed))

end CompositeMixturePropertiesCanonicalLaneLean
end HautevilleHouse