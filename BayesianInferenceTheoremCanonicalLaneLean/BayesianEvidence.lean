import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BayesianInferenceTheoremCanonicalLaneLean

structure BayesianEvidence where
  prior : PriorModel
  likelihood : LikelihoodModel
  evidence : ℝ
  evidenceFormula : evidence = ∫ (d : prior.distribution) (θ : prior.parameters),
    likelihood.likelihood d θ * prior.density d θ
  evidencePositive : evidence > 0
  evidenceClosed : Prop

structure BayesianEvidenceConclusion (E : BayesianEvidence) where
  evidenceFormulaClosed : E.evidenceFormula
  evidencePositiveClosed : E.evidencePositive
  evidenceClosedClosed : E.evidenceClosed

def BayesianEvidenceClosed (E : BayesianEvidence) : Prop :=
  E.evidenceFormula ∧ E.evidencePositive ∧ E.evidenceClosed

theorem bayesian_evidence_closed_from_evidence (E : BayesianEvidence) (C : BayesianEvidenceConclusion E) : BayesianEvidenceClosed E :=
  And.intro C.evidenceFormulaClosed (And.intro C.evidencePositiveClosed C.evidenceClosedClosed)

end BayesianInferenceTheoremCanonicalLaneLean
end HautevilleHouse