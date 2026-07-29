import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BayesianInferenceTheoremCanonicalLaneLean

structure PosteriorModel where
  prior : PriorModel
  likelihood : LikelihoodModel
  posterior : prior.distribution → prior.parameters → ℝ
  bayesRule : ∀ (d : prior.distribution) (θ : prior.parameters),
    posterior d θ = likelihood.likelihood d θ * prior.density d θ / marginalEvidence
  marginalEvidence : ℝ
  evidenceClosed : Prop

structure PosteriorEvidence (P : PosteriorModel) where
  bayesRuleClosed : P.bayesRule
  marginalEvidenceWellDefined : P.marginalEvidence > 0
  evidenceClosedClosed : P.evidenceClosed

def PosteriorModelClosed (P : PosteriorModel) : Prop :=
  (∀ d θ, P.bayesRule d θ) ∧ (P.marginalEvidence > 0) ∧ P.evidenceClosed

theorem posterior_model_closed_from_evidence (P : PosteriorModel) (E : PosteriorEvidence P) : PosteriorModelClosed P :=
  And.intro E.bayesRuleClosed (And.intro E.marginalEvidenceWellDefined E.evidenceClosedClosed)

end BayesianInferenceTheoremCanonicalLaneLean
end HautevilleHouse