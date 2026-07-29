import canonicalLaneMathlib.AdmissibleClass
import AdmissibleClass

/-!
# Canonical Prior-Posterior Neighborhoords Package
-/

namespace HautevilleHouse
namespace BayesianInferenceTheoremCanonicalLaneLean

structure CanonicalPriorPackage where
  priorFamily : Type u
  priorParameter : Type v
  conjugateClosed : Prop

structure CanonicalLikelihoodPackage (P : CanonicalPriorPackage) where
  likelihoodFamily : Type w
  sufficiency : Prop

structure CanonicalPosteriorPackage {P : CanonicalPriorPackage}
    (L : CanonicalLikelihoodPackage P) where
  posteriorFamily : Type x
  analyticForm : Prop
  normalizingConstantFinite : Prop

structure CanonicalNeighborhoodsEvidence {P : CanonicalPriorPackage}
    {L : CanonicalLikelihoodPackage P} (C : CanonicalPosteriorPackage L) where
  analyticFormClosed : C.analyticForm
  normalizingConstantFiniteClosed : C.normalizingConstantFinite

def CanonicalNeighborhoodsClosed {P : CanonicalPriorPackage}
    {L : CanonicalLikelihoodPackage P} (C : CanonicalPosteriorPackage L) : Prop :=
  C.analyticForm ∧ C.normalizingConstantFinite

theorem canonical_neighborhoods_closed_from_evidence
    {P : CanonicalPriorPackage} {L : CanonicalLikelihoodPackage P}
    (C : CanonicalPosteriorPackage L) (E : CanonicalNeighborhoodsEvidence C) :
    CanonicalNeighborhoodsClosed C := by
  exact And.intro E.analyticFormClosed E.normalizingConstantFiniteClosed

end BayesianInferenceTheoremCanonicalLaneLean
end HautevilleHouse