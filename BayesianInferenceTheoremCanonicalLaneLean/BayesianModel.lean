import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace BayesianInferenceTheoremCanonicalLaneLean

structure PriorDistribution where
  density : Type
  parameters : Type
  priorMeasure : Prop
  support : Set Type

structure LikelihoodFunction where
  data : Type
  parameterSpace : Type
  densityGivenParameter : Prop
  independenceAssumption : Prop

structure PosteriorDistribution where
  prior : PriorDistribution
  likelihood : LikelihoodFunction
  posteriorDensity : Type
  bayesUpdateRule : Prop
  normalizationConstant : Prop

structure BayesianModel where
  prior : PriorDistribution
  likelihood : LikelihoodFunction
  posterior : PosteriorDistribution
  modelConsistency : Prop

structure BayesianModelEvidence (M : BayesianModel) where
  priorConsistent : M.prior.priorMeasure
  likelihoodConsistent : M.likelihood.densityGivenParameter
  posteriorConsistent : M.posterior.bayesUpdateRule
  modelConsistentClosed : M.modelConsistency

def BayesianModelClosed (M : BayesianModel) : Prop :=
  M.prior.priorMeasure ∧ M.likelihood.densityGivenParameter ∧
  M.posterior.bayesUpdateRule ∧ M.modelConsistency

theorem bayesian_model_closed_from_evidence (M : BayesianModel) (E : BayesianModelEvidence M) :
    BayesianModelClosed M := by
  exact And.intro E.priorConsistent (And.intro E.likelihoodConsistent (And.intro E.posteriorConsistent E.modelConsistentClosed))

end BayesianInferenceTheoremCanonicalLaneLean
end HautevilleHouse