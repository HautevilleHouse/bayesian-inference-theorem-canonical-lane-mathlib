import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BayesianInferenceTheoremCanonicalLaneLean

structure LikelihoodKernel where
  dataSpace : Type u
  parameterSpace : Type v
  kernel : Type w
  measurable : Prop
  dominated : Prop

structure LikelihoodEvidence (L : LikelihoodKernel) where
  measurableClosed : L.measurable
  dominatedClosed : L.dominated

def LikelihoodClosed (L : LikelihoodKernel) : Prop :=
  L.measurable ∧ L.dominated

theorem likelihood_closed_from_evidence (L : LikelihoodKernel) (E : LikelihoodEvidence L) : LikelihoodClosed L := by
  exact And.intro E.measurableClosed E.dominatedClosed

end BayesianInferenceTheoremCanonicalLaneLean
end HautevilleHouse
