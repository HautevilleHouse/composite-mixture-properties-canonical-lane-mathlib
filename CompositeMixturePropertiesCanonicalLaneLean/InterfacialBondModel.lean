import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CompositeMixturePropertiesCanonicalLaneLean

structure InterfacialBondPackage where
  bondType : Type u
  adhesionStrength : Prop
  debondingCriterion : Prop
  interphaseRegion : Prop
  stressTransferEfficiency : Prop

structure InterfacialBondEvidence (I : InterfacialBondPackage) where
  adhesionStrengthClosed : I.adhesionStrength
  debondingCriterionClosed : I.debondingCriterion
  interphaseRegionClosed : I.interphaseRegion
  stressTransferEfficiencyClosed : I.stressTransferEfficiency

def InterfacialBondClosed (I : InterfacialBondPackage) : Prop :=
  I.adhesionStrength ∧ I.debondingCriterion ∧
  I.interphaseRegion ∧ I.stressTransferEfficiency

theorem interfacial_bond_closed_from_evidence (I : InterfacialBondPackage) (Ev : InterfacialBondEvidence I) :
    InterfacialBondClosed I := by
  exact And.intro Ev.adhesionStrengthClosed
    (And.intro Ev.debondingCriterionClosed
      (And.intro Ev.interphaseRegionClosed Ev.stressTransferEfficiencyClosed))

end CompositeMixturePropertiesCanonicalLaneLean
end HautevilleHouse