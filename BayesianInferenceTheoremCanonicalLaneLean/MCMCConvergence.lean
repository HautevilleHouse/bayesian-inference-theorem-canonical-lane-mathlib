import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BayesianInferenceTheoremCanonicalLaneLean.BayesianModel

namespace HautevilleHouse
namespace BayesianInferenceTheoremCanonicalLaneLean

structure MCMCChain where
  stateSpace : Type
  transitionKernel : Type
  stationaryDistribution : PriorDistribution
  convergenceRate : Prop

structure MCMCConvergencePackage (M : BayesianModel) where
  chain : MCMCChain
  ergodicity : Prop
  lawOfLargeNumbers : Prop
  burnInRequirement : Prop

structure MCMCConvergenceEvidence {M : BayesianModel} (C : MCMCConvergencePackage M) where
  ergodicityClosed : C.ergodicity
  lawOfLargeNumbersClosed : C.lawOfLargeNumbers
  burnInRequirementClosed : C.burnInRequirement

def MCMCConvergenceClosed {M : BayesianModel} (C : MCMCConvergencePackage M) : Prop :=
  C.ergodicity ∧ C.lawOfLargeNumbers ∧ C.burnInRequirement

theorem mcmc_convergence_closed_from_evidence {M : BayesianModel} (C : MCMCConvergencePackage M) (E : MCMCConvergenceEvidence C) :
    MCMCConvergenceClosed C := by
  exact And.intro E.ergodicityClosed (And.intro E.lawOfLargeNumbersClosed E.burnInRequirementClosed)

end BayesianInferenceTheoremCanonicalLaneLean
end HautevilleHouse