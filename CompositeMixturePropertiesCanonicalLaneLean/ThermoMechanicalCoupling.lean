import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CompositeMixturePropertiesCanonicalLaneLean

structure ThermoMechanicalCouplingPackage where
  temperatureField : Type u
  thermalExpansion : Prop
  heatGeneration : Prop
  stressTemperatureRelation : Prop
  damageAccumulation : Prop

structure ThermoMechanicalCouplingEvidence (T : ThermoMechanicalCouplingPackage) where
  thermalExpansionClosed : T.thermalExpansion
  heatGenerationClosed : T.heatGeneration
  stressTemperatureRelationClosed : T.stressTemperatureRelation
  damageAccumulationClosed : T.damageAccumulation

def ThermoMechanicalCouplingClosed (T : ThermoMechanicalCouplingPackage) : Prop :=
  T.thermalExpansion ∧ T.heatGeneration ∧
  T.stressTemperatureRelation ∧ T.damageAccumulation

theorem thermo_mechanical_coupling_closed_from_evidence (T : ThermoMechanicalCouplingPackage) (E : ThermoMechanicalCouplingEvidence T) :
    ThermoMechanicalCouplingClosed T := by
  exact And.intro E.thermalExpansionClosed
    (And.intro E.heatGenerationClosed
      (And.intro E.stressTemperatureRelationClosed E.damageAccumulationClosed))

end CompositeMixturePropertiesCanonicalLaneLean
end HautevilleHouse