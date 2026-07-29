import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CompositeMixturePropertiesCanonicalLaneLean

structure CompositeMixturePackage where
  matrixPhase : Prop
  fillerPhase : Prop
  interfaceRegion : Prop
  matrixElasticModulus : ℝ
  fillerElasticModulus : ℝ
  volumeFractionFiller : ℝ
  aspectRatio : ℝ
  interfaceThickness : ℝ
  strengtheningMechanism : Prop

structure CompositeMixtureEvidence (P : CompositeMixturePackage) where
  matrixPhaseClosed : P.matrixPhase
  fillerPhaseClosed : P.fillerPhase
  interfaceRegionClosed : P.interfaceRegion
  matrixElasticModulusClosed : P.matrixElasticModulus > 0
  fillerElasticModulusClosed : P.fillerElasticModulus > 0
  volumeFractionFillerInRange : 0 < P.volumeFractionFiller ∧ P.volumeFractionFiller < 1
  aspectRatioClosed : P.aspectRatio > 0
  interfaceThicknessClosed : P.interfaceThickness ≥ 0
  strengtheningMechanismClosed : P.strengtheningMechanism

def CompositeMixtureClosed (P : CompositeMixturePackage) : Prop :=
  P.matrixPhase ∧ P.fillerPhase ∧ P.interfaceRegion ∧
  P.matrixElasticModulus > 0 ∧ P.fillerElasticModulus > 0 ∧
  (0 < P.volumeFractionFiller ∧ P.volumeFractionFiller < 1) ∧
  P.aspectRatio > 0 ∧ P.interfaceThickness ≥ 0 ∧
  P.strengtheningMechanism

theorem composite_mixture_closed_from_evidence (P : CompositeMixturePackage)
    (E : CompositeMixtureEvidence P) : CompositeMixtureClosed P := by
  refine And.intro E.matrixPhaseClosed (And.intro E.fillerPhaseClosed
    (And.intro E.interfaceRegionClosed (And.intro E.matrixElasticModulusClosed
      (And.intro E.fillerElasticModulusClosed (And.intro E.volumeFractionFillerInRange
        (And.intro E.aspectRatioClosed (And.intro E.interfaceThicknessClosed
          E.strengtheningMechanismClosed)))))))

end CompositeMixturePropertiesCanonicalLaneLean
end HautevilleHouse