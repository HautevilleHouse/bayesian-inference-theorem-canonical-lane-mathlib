import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BayesianInferenceTheoremCanonicalLaneLean

structure PriorModel where
  distribution : Type u
  parameters : Type v
  support : Set (distribution × parameters)
  density : distribution → parameters → ℝ
  proper : ∀ p : parameters, ∫ d, density d p = 1
  evidenceClosed : Prop

structure PriorEvidence (P : PriorModel) where
  properClosed : P.proper
  evidenceClosedClosed : P.evidenceClosed

def PriorModelClosed (P : PriorModel) : Prop :=
  P.proper ∧ P.evidenceClosed

theorem prior_model_closed_from_evidence (P : PriorModel) (E : PriorEvidence P) : PriorModelClosed P :=
  And.intro E.properClosed E.evidenceClosedClosed

end BayesianInferenceTheoremCanonicalLaneLean
end HautevilleHouse