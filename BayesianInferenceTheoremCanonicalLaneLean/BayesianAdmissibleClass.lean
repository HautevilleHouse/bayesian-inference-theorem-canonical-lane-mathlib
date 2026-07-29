import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BayesianInferenceTheoremCanonicalLaneLean

structure BayesianData where
  prior : Type
  likelihood : Type
  evidence : Type
  posterior : Type

structure BayesianAdmittedObject where
  data : BayesianData
  priorDefined : Prop
  likelihoodDefined : Prop
  evidenceComputed : Prop
  posteriorComputed : Prop
  bayesTheoremHolds : posteriorComputed

structure AdmissibleClass where
  object : BayesianAdmittedObject
  endpointSatisfied : Prop
  remainderRecorded : Prop
  gateWitness : endpointSatisfied ∨ remainderRecorded

def admittedClosure (A : AdmissibleClass) : Prop :=
  BayesianWitnessClosed A.object ∧ (A.endpointSatisfied ∨ A.remainderRecorded)

def BayesianWitnessClosed (O : BayesianAdmittedObject) : Prop :=
  O.bayesTheoremHolds

end BayesianInferenceTheoremCanonicalLaneLean
end HautevilleHouse
