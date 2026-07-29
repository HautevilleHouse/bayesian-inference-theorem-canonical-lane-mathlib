import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BayesianInferenceTheoremCanonicalLaneLean.BayesianModel
import HautevilleHouse.BayesianInferenceTheoremCanonicalLaneLean.MCMCConvergence

namespace HautevilleHouse
namespace BayesianInferenceTheoremCanonicalLaneLean

structure PosteriorComputationPackage {M : BayesianModel} (C : MCMCConvergencePackage M) where
  samplingAlgorithm : Type
  diagnosticChecks : Prop
  effectiveSampleSize : Prop
  monteCarloSE : Prop

structure PosteriorComputationEvidence {M : BayesianModel} {C : MCMCConvergencePackage M}
    (P : PosteriorComputationPackage C) where
  samplingAlgorithmClosed : P.samplingAlgorithm = P.samplingAlgorithm
  diagnosticChecksClosed : P.diagnosticChecks
  effectiveSampleSizeClosed : P.effectiveSampleSize
  monteCarloSEClosed : P.monteCarloSE

def PosteriorComputationClosed {M : BayesianModel} {C : MCMCConvergencePackage M}
    (P : PosteriorComputationPackage C) : Prop :=
  P.diagnosticChecks ∧ P.effectiveSampleSize ∧ P.monteCarloSE

theorem posterior_computation_closed_from_evidence {M : BayesianModel} {C : MCMCConvergencePackage M}
    (P : PosteriorComputationPackage C) (E : PosteriorComputationEvidence P) :
    PosteriorComputationClosed P := by
  exact And.intro E.diagnosticChecksClosed (And.intro E.effectiveSampleSizeClosed E.monteCarloSEClosed)

end BayesianInferenceTheoremCanonicalLaneLean
end HautevilleHouse