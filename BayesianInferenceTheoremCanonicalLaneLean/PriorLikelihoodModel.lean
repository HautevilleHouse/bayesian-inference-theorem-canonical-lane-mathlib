import canonicalLaneMathlib.AdmissibleClass
import HautevilleHouse.BayesianInferenceTheoremCanonicalLaneLean.MathlibObjects

namespace HautevilleHouse
namespace BayesianInferenceTheoremCanonicalLaneLean

structure PriorLikelihoodPackage where
  priorDistributable : Prop
  likelihoodIdentifiable : Prop
  priorProper : Prop
  likelihoodIntegrable : Prop

structure PriorLikelihoodEvidence (P : PriorLikelihoodPackage) where
  priorDistributableClosed : P.priorDistributable
  likelihoodIdentifiableClosed : P.likelihoodIdentifiable
  priorProperClosed : P.priorProper
  likelihoodIntegrableClosed : P.likelihoodIntegrable

def PriorLikelihoodClosed (P : PriorLikelihoodPackage) : Prop :=
  P.priorDistributable ∧ P.likelihoodIdentifiable ∧ P.priorProper ∧ P.likelihoodIntegrable

theorem prior_likelihood_closed_from_evidence
    (P : PriorLikelihoodPackage) (E : PriorLikelihoodEvidence P) :
    PriorLikelihoodClosed P := by
  exact And.intro E.priorDistributableClosed
    (And.intro E.likelihoodIdentifiableClosed
      (And.intro E.priorProperClosed E.likelihoodIntegrableClosed))

end BayesianInferenceTheoremCanonicalLaneLean
end HautevilleHouse