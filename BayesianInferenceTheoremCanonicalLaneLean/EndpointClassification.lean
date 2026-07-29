import canonicalLaneMathlib.AdmissibleClass
import AdmissibleClass
import CanonicalNeighborhoods

/-!
# Posterior Consistency Endpoint Classification
-/

namespace HautevilleHouse
namespace BayesianInferenceTheoremCanonicalLaneLean

structure EndpointClassificationPackage {P : CanonicalPriorPackage}
    {L : CanonicalLikelihoodPackage P} {C : CanonicalPosteriorPackage L}
    where
  targetParameter : Type u
  posteriorLimit : Type v
  consistencyAssumption : Prop
  bernsteinVonMisesCondition : Prop
  endpointStatement : Prop

structure EndpointClassificationEvidence
    {P : CanonicalPriorPackage} {L : CanonicalLikelihoodPackage P}
    {C : CanonicalPosteriorPackage L}
    (E : EndpointClassificationPackage) where
  consistencyAssumptionClosed : E.consistencyAssumption
  bernsteinVonMisesConditionClosed : E.bernsteinVonMisesCondition
  endpointStatementClosed : E.endpointStatement

def EndpointClassificationClosed
    {P : CanonicalPriorPackage} {L : CanonicalLikelihoodPackage P}
    {C : CanonicalPosteriorPackage L}
    (E : EndpointClassificationPackage) : Prop :=
  E.consistencyAssumption ∧ E.bernsteinVonMisesCondition ∧ E.endpointStatement

theorem endpoint_classification_closed_from_evidence
    {P : CanonicalPriorPackage} {L : CanonicalLikelihoodPackage P}
    {C : CanonicalPosteriorPackage L}
    (Epkg : EndpointClassificationPackage) (E : EndpointClassificationEvidence Epkg) :
    EndpointClassificationClosed Epkg := by
  exact And.intro E.consistencyAssumptionClosed
    (And.intro E.bernsteinVonMisesConditionClosed E.endpointStatementClosed)

end BayesianInferenceTheoremCanonicalLaneLean
end HautevilleHouse