import BayesianInferenceTheoremCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace BayesianInferenceTheoremCanonicalLaneLean

structure AdmissibleClass where
  object : BayesianAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  BayesianWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

end BayesianInferenceTheoremCanonicalLaneLean
end HautevilleHouse