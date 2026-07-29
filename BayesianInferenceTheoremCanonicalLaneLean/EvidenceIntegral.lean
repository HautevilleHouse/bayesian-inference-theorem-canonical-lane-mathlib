import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BayesianInferenceTheoremCanonicalLaneLean

structure EvidenceIntegral where
  prior : Type u
  likelihood : Type v
  integralSpace : Type w
  integralDefined : Prop
  finite : Prop

structure EvidenceEvidence (E : EvidenceIntegral) where
  integralDefinedClosed : E.integralDefined
  finiteClosed : E.finite

def EvidenceClosed (E : EvidenceIntegral) : Prop :=
  E.integralDefined ∧ E.finite

theorem evidence_closed_from_evidence (E : EvidenceIntegral) (Ev : EvidenceEvidence E) : EvidenceClosed E := by
  exact And.intro Ev.integralDefinedClosed Ev.finiteClosed

end BayesianInferenceTheoremCanonicalLaneLean
end HautevilleHouse
