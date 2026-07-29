import BayesianInferenceTheoremCanonicalLaneLean.PriorLikelihoodPosterior

namespace HautevilleHouse
namespace BayesianInferenceTheoremCanonicalLaneLean

structure BayesRulePackage {P : PriorLikelihoodPosteriorPackage} where
  posteriorProportional : Prop
  evidenceMarginal : Prop
  updateRuleExplicit : Prop

structure BayesRuleEvidence {P : PriorLikelihoodPosteriorPackage} (B : BayesRulePackage P) where
  posteriorProportionalClosed : B.posteriorProportional
  evidenceMarginalClosed : B.evidenceMarginal
  updateRuleExplicitClosed : B.updateRuleExplicit

def BayesRuleClosed {P : PriorLikelihoodPosteriorPackage} (B : BayesRulePackage P) : Prop :=
  B.posteriorProportional ∧ B.evidenceMarginal ∧ B.updateRuleExplicit

theorem bayes_rule_closed_from_evidence
    {P : PriorLikelihoodPosteriorPackage} (B : BayesRulePackage P) (E : BayesRuleEvidence B) :
    BayesRuleClosed B := by
  exact And.intro E.posteriorProportionalClosed
    (And.intro E.evidenceMarginalClosed E.updateRuleExplicitClosed)

end BayesianInferenceTheoremCanonicalLaneLean
end HautevilleHouse