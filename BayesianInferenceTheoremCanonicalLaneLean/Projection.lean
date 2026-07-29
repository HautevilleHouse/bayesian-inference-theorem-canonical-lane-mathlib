import BayesianInferenceTheoremCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BayesianInferenceTheoremCanonicalLaneLean

def bayesianProjection : Projection BayesianEndgameState := {
  toFun := fun x => x,
  idempotent := by intro x; rfl
}

theorem bayesian_projection_idempotent (x : BayesianEndgameState) :
    bayesianProjection.toFun (bayesianProjection.toFun x) = bayesianProjection.toFun x := by
  exact bayesianProjection.idempotent x

end BayesianInferenceTheoremCanonicalLaneLean
end HautevilleHouse