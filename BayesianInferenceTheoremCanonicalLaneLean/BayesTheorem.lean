import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BayesianInferenceTheoremCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  match A.object with
  | BayesianObj P => PriorModelClosed P
  | _ => False

theorem bridge_from_admissible_class (A : AdmissibleClass) : bridgeClosed A :=
  by
    unfold bridgeClosed
    match A.object with
    | BayesianObj P =>
      exact A.priorModelClosedWitness
    | _ =>
      exact False.elim (A.objectIsBayesian)

def gateClosed (A : AdmissibleClass) : Prop :=
  A.endpointSatisfied ∨ A.remainderRecorded

theorem gate_from_admissible_class (A : AdmissibleClass) : gateClosed A :=
  by
    unfold gateClosed
    exact A.gateWitness

end BayesianInferenceTheoremCanonicalLaneLean
end HautevilleHouse