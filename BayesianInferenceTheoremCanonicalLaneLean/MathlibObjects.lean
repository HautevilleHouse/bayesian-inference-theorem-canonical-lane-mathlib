import BayesianInferenceTheoremCanonicalLaneLean.TheoremStatement

namespace HautevilleHouse
namespace BayesianInferenceTheoremCanonicalLaneLean

structure BayesianSpace where
  carrier : Type
  sigmaAlgebra : measurable space

structure BayesianAdmittedObject where
  space : BayesianSpace
  priorDefined : Prop
  likelihoodDefined : Prop
  posteriorDefined : Prop
  conclusion : posteriorDefined

structure BayesianEndgameState where
  object : BayesianAdmittedObject

def BayesianWitnessClosed (O : BayesianAdmittedObject) : Prop :=
  O.posteriorDefined

end BayesianInferenceTheoremCanonicalLaneLean
end HautevilleHouse