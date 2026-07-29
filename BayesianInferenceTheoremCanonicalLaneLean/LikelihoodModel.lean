import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BayesianInferenceTheoremCanonicalLaneLean

structure LikelihoodModel where
  observationSpace : Type u
  parameterSpace : Type v
  likelihood : observationSpace → parameterSpace → ℝ
  normalized : ∀ θ : parameterSpace, ∫ x, likelihood x θ = 1
  evidenceClosed : Prop

structure LikelihoodEvidence (L : LikelihoodModel) where
  normalizedClosed : L.normalized
  evidenceClosedClosed : L.evidenceClosed

def LikelihoodModelClosed (L : LikelihoodModel) : Prop :=
  L.normalized ∧ L.evidenceClosed

theorem likelihood_model_closed_from_evidence (L : LikelihoodModel) (E : LikelihoodEvidence L) : LikelihoodModelClosed L :=
  And.intro E.normalizedClosed E.evidenceClosedClosed

end BayesianInferenceTheoremCanonicalLaneLean
end HautevilleHouse