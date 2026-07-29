import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CompositeMixturePropertiesCanonicalLaneLean

structure ExperimentalValidationPackage (P : CompositeMixturePackage)
    (E : EffectiveMediumPackage P) (I : InterfaceBondingPackage P E)
    (C : ConstitutiveModelPackage P E I) where
  tensileTestDataFits : Prop
  cyclicLoadingResponse : Prop
  fractureSurfaceAnalysis : Prop
  thermalExpansionMatch : Prop
  statisticalConfidence : ℝ

structure ExperimentalValidationEvidence (P : CompositeMixturePackage)
    (E : EffectiveMediumPackage P) (I : InterfaceBondingPackage P E)
    (C : ConstitutiveModelPackage P E I)
    (V : ExperimentalValidationPackage P E I C) where
  tensileTestDataFitsClosed : V.tensileTestDataFits
  cyclicLoadingResponseClosed : V.cyclicLoadingResponse
  fractureSurfaceAnalysisClosed : V.fractureSurfaceAnalysis
  thermalExpansionMatchClosed : V.thermalExpansionMatch
  statisticalConfidenceClosed : V.statisticalConfidence > 0.95

def ExperimentalValidationClosed (P : CompositeMixturePackage)
    (E : EffectiveMediumPackage P) (I : InterfaceBondingPackage P E)
    (C : ConstitutiveModelPackage P E I)
    (V : ExperimentalValidationPackage P E I C) : Prop :=
  V.tensileTestDataFits ∧ V.cyclicLoadingResponse ∧
  V.fractureSurfaceAnalysis ∧ V.thermalExpansionMatch ∧
  V.statisticalConfidence > 0.95

theorem experimental_validation_closed_from_evidence (P : CompositeMixturePackage)
    (E : EffectiveMediumPackage P) (I : InterfaceBondingPackage P E)
    (C : ConstitutiveModelPackage P E I)
    (V : ExperimentalValidationPackage P E I C)
    (Ev : ExperimentalValidationEvidence P E I C V) :
    ExperimentalValidationClosed P E I C V := by
  exact And.intro Ev.tensileTestDataFitsClosed
    (And.intro Ev.cyclicLoadingResponseClosed
      (And.intro Ev.fractureSurfaceAnalysisClosed
        (And.intro Ev.thermalExpansionMatchClosed Ev.statisticalConfidenceClosed)))

end CompositeMixturePropertiesCanonicalLaneLean
end HautevilleHouse