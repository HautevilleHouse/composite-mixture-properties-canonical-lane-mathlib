import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CompositeMixturePropertiesCanonicalLaneLean

structure MoriTanakaPackage where
  inclusionShapeFactor : ℝ
  matrixBulkModulus : ℝ
  inclusionBulkModulus : ℝ
  matrixShearModulus : ℝ
  inclusionShearModulus : ℝ
  effectiveBulkModulus : ℝ
  effectiveShearModulus : ℝ
  moriTanakaBulkClosed : Prop
  moriTanakaShearClosed : Prop

structure MoriTanakaEvidence (M : MoriTanakaPackage) where
  effectiveBulkModulusClosed : M.effectiveBulkModulus = M.matrixBulkModulus + (M.inclusionBulkModulus - M.matrixBulkModulus) * M.inclusionShapeFactor
  effectiveShearModulusClosed : M.effectiveShearModulus = M.matrixShearModulus + (M.inclusionShearModulus - M.matrixShearModulus) * M.inclusionShapeFactor
  moriTanakaBulkClosedClosed : M.moriTanakaBulkClosed
  moriTanakaShearClosedClosed : M.moriTanakaShearClosed

def MoriTanakaClosed (M : MoriTanakaPackage) : Prop :=
  M.effectiveBulkModulus = M.matrixBulkModulus + (M.inclusionBulkModulus - M.matrixBulkModulus) * M.inclusionShapeFactor ∧
  M.effectiveShearModulus = M.matrixShearModulus + (M.inclusionShearModulus - M.matrixShearModulus) * M.inclusionShapeFactor ∧
  M.moriTanakaBulkClosed ∧
  M.moriTanakaShearClosed

theorem mori_tanaka_closed_from_evidence (M : MoriTanakaPackage) (E : MoriTanakaEvidence M) : MoriTanakaClosed M := by
  exact And.intro E.effectiveBulkModulusClosed (And.intro E.effectiveShearModulusClosed (And.intro E.moriTanakaBulkClosedClosed E.moriTanakaShearClosedClosed))

end CompositeMixturePropertiesCanonicalLaneLean
end HautevilleHouse