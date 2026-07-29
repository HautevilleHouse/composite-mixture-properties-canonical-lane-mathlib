import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CompositeMixturePropertiesCanonicalLaneLean

structure RuleOfMixturesPackage where
  fiberVolumeFraction : ℝ
  matrixModulus : ℝ
  fiberModulus : ℝ
  longitudinalModulus : ℝ
  transverseModulus : ℝ
  ruleOfMixturesValid : Prop
  inverseRuleOfMixturesValid : Prop

structure RuleOfMixturesEvidence (R : RuleOfMixturesPackage) where
  longitudinalModulusClosed : R.longitudinalModulus = R.fiberVolumeFraction * R.fiberModulus + (1 - R.fiberVolumeFraction) * R.matrixModulus
  transverseModulusClosed : 1 / R.transverseModulus = R.fiberVolumeFraction / R.fiberModulus + (1 - R.fiberVolumeFraction) / R.matrixModulus
  ruleOfMixturesValidClosed : R.ruleOfMixturesValid
  inverseRuleOfMixturesValidClosed : R.inverseRuleOfMixturesValid

def RuleOfMixturesClosed (R : RuleOfMixturesPackage) : Prop :=
  R.longitudinalModulus = R.fiberVolumeFraction * R.fiberModulus + (1 - R.fiberVolumeFraction) * R.matrixModulus ∧
  1 / R.transverseModulus = R.fiberVolumeFraction / R.fiberModulus + (1 - R.fiberVolumeFraction) / R.matrixModulus ∧
  R.ruleOfMixturesValid ∧
  R.inverseRuleOfMixturesValid

theorem rule_of_mixtures_closed_from_evidence (R : RuleOfMixturesPackage) (E : RuleOfMixturesEvidence R) : RuleOfMixturesClosed R := by
  exact And.intro E.longitudinalModulusClosed (And.intro E.transverseModulusClosed (And.intro E.ruleOfMixturesValidClosed E.inverseRuleOfMixturesValidClosed))

end CompositeMixturePropertiesCanonicalLaneLean
end HautevilleHouse