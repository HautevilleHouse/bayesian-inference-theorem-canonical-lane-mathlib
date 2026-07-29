import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BayesianInferenceTheoremCanonicalLaneLean.FinalTheorem

namespace HautevilleHouse
namespace BayesianInferenceTheoremCanonicalLaneLean

structure BayesianAnalyticCertificate where
  priorSpecification : Prop
  likelihoodEvaluation : Prop
  bayesRuleApplied : Prop
  posteriorComputed : Prop
  priorSpecificationClosed : priorSpecification
  likelihoodEvaluationClosed : likelihoodEvaluation
  bayesRuleAppliedClosed : bayesRuleApplied
  posteriorComputedClosed : posteriorComputed
  bayesianEvidence : PriorLikelihoodEvidence (PriorLikelihoodPackage.mk True True True True)

def BayesianAnalyticCertificateClosed (C : BayesianAnalyticCertificate) : Prop :=
  C.priorSpecification ∧ C.likelihoodEvaluation ∧ C.bayesRuleApplied ∧ C.posteriorComputed ∧ PriorLikelihoodClosed (PriorLikelihoodPackage.mk True True True True)

theorem bayesian_analytic_certificate_closed
    (C : BayesianAnalyticCertificate) : BayesianAnalyticCertificateClosed C := by
  exact And.intro C.priorSpecificationClosed
    (And.intro C.likelihoodEvaluationClosed
      (And.intro C.bayesRuleAppliedClosed
        (And.intro C.posteriorComputedClosed
          (prior_likelihood_closed_from_evidence _ C.bayesianEvidence))))

end BayesianInferenceTheoremCanonicalLaneLean
end HautevilleHouse