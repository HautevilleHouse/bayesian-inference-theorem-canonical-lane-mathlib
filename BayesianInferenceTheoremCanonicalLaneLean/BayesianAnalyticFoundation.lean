import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BayesianInferenceTheoremCanonicalLaneLean.BayesianModel
import HautevilleHouse.BayesianInferenceTheoremCanonicalLaneLean.BayesTheorem
import HautevilleHouse.BayesianInferenceTheoremCanonicalLaneLean.MCMCConvergence
import HautevilleHouse.BayesianInferenceTheoremCanonicalLaneLean.PosteriorComputation

namespace HautevilleHouse
namespace BayesianInferenceTheoremCanonicalLaneLean

structure BayesianAnalyticFoundation where
  model : BayesianModel
  modelEvidence : BayesianModelEvidence model
  bayesTheoremEvidence : BayesTheoremEvidence
  mcmcPackage : MCMCConvergencePackage model
  mcmcEvidence : MCMCConvergenceEvidence mcmcPackage
  posteriorPackage : PosteriorComputationPackage mcmcPackage
  posteriorEvidence : PosteriorComputationEvidence posteriorPackage

def BayesianAnalyticFoundationClosed (A : BayesianAnalyticFoundation) : Prop :=
  BayesianModelClosed A.model ∧
  BayesTheoremClosed A.bayesTheoremEvidence ∧
  MCMCConvergenceClosed A.mcmcPackage ∧
  PosteriorComputationClosed A.posteriorPackage

theorem bayesian_analytic_foundation_closed_from_evidence (A : BayesianAnalyticFoundation) :
    BayesianAnalyticFoundationClosed A := by
  refine And.intro (bayesian_model_closed_from_evidence A.model A.modelEvidence)
    (And.intro (bayesTheoremClosedFromEvidence A.bayesTheoremEvidence)
      (And.intro (mcmc_convergence_closed_from_evidence A.mcmcPackage A.mcmcEvidence)
        (posterior_computation_closed_from_evidence A.posteriorPackage A.posteriorEvidence)))

end BayesianInferenceTheoremCanonicalLaneLean
end HautevilleHouse