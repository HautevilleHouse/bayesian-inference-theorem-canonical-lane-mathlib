import BayesianInferenceTheoremCanonicalLaneLean.Projection

namespace HautevilleHouse
namespace BayesianInferenceTheoremCanonicalLaneLean

def bridgeClosed (A : AdmissibleClass) : Prop :=
  BayesianWitnessClosed A.object

theorem bridge_from_admissible_class (A : AdmissibleClass) :
    bridgeClosed A := by
  exact A.object.conclusion

end BayesianInferenceTheoremCanonicalLaneLean
end HautevilleHouse