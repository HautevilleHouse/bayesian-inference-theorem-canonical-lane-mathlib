import BayesianInferenceTheoremCanonicalLaneLean.AdmissibleClass

namespace HautevilleHouse
namespace BayesianInferenceTheoremCanonicalLaneLean

structure PriorLikelihoodPosteriorPackage where
  priorDistribution : Type u
  likelihoodFunction : Type v
  posteriorDistribution : Type w
  bayesRuleApplied : Prop
  normalizationConstant : Prop
  conjugationFamily : Prop

structure PriorLikelihoodPosteriorEvidence (P : PriorLikelihoodPosteriorPackage) where
  priorDistributionClosed : P.priorDistribution
  likelihoodFunctionClosed : P.likelihoodFunction
  posteriorDistributionClosed : P.posteriorDistribution
  bayesRuleAppliedClosed : P.bayesRuleApplied
  normalizationConstantClosed : P.normalizationConstant
  conjugationFamilyClosed : P.conjugationFamily

def PriorLikelihoodPosteriorClosed (P : PriorLikelihoodPosteriorPackage) : Prop :=
  P.priorDistribution ∧
  P.likelihoodFunction ∧
  P.posteriorDistribution ∧
  P.bayesRuleApplied ∧
  P.normalizationConstant ∧
  P.conjugationFamily

theorem prior_likelihood_posterior_closed_from_evidence
    (P : PriorLikelihoodPosteriorPackage) (E : PriorLikelihoodPosteriorEvidence P) :
    PriorLikelihoodPosteriorClosed P := by
  exact And.intro E.priorDistributionClosed
    (And.intro E.likelihoodFunctionClosed
      (And.intro E.posteriorDistributionClosed
        (And.intro E.bayesRuleAppliedClosed
          (And.intro E.normalizationConstantClosed E.conjugationFamilyClosed))))

end BayesianInferenceTheoremCanonicalLaneLean
end HautevilleHouse