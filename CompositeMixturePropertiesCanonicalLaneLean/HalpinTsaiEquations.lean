import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace CompositeMixturePropertiesCanonicalLaneLean

structure HalpinTsaiPackage where
  fiberAspectRatio : ℝ
  matrixPoissonRatio : ℝ
  fiberPoissonRatio : ℝ
  shearModulus : ℝ
  transverseShearModulus : ℝ
  halpinTsaiLongitudinalClosed : Prop
  halpinTsaiTransverseClosed : Prop

structure HalpinTsaiEvidence (H : HalpinTsaiPackage) where
  shearModulusClosed : H.shearModulus = H.fiberAspectRatio * H.transverseShearModulus
  halpinTsaiLongitudinalClosedClosed : H.halpinTsaiLongitudinalClosed
  halpinTsaiTransverseClosedClosed : H.halpinTsaiTransverseClosed

def HalpinTsaiClosed (H : HalpinTsaiPackage) : Prop :=
  H.shearModulus = H.fiberAspectRatio * H.transverseShearModulus ∧
  H.halpinTsaiLongitudinalClosed ∧
  H.halpinTsaiTransverseClosed

theorem halpin_tsai_closed_from_evidence (H : HalpinTsaiPackage) (E : HalpinTsaiEvidence H) : HalpinTsaiClosed H := by
  exact And.intro E.shearModulusClosed (And.intro E.halpinTsaiLongitudinalClosedClosed E.halpinTsaiTransverseClosedClosed)

end CompositeMixturePropertiesCanonicalLaneLean
end HautevilleHouse