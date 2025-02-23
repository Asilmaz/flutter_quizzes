enum ESatsQuestionSubcategoriesRW {
  CentralIdeasAndDetails,
  CommandOfEvidence,
  CrossTextConnections,
  FormStructureAndSense,
  Inferences,
  RhetoricalSynthesis,
  TextStructureAndPurpose,
  Transitions,
  WordsInContext,
  Boundaries,

  LinearEquationsInOneVariable,
  LinearFunctions,
  LinearEquationsInTwoVariables,
  SystemsOfTwoLinearEquationsInTwoVariables,
  LinearInequalitiesInOneOrTwoVariables,
  NonlinearFunctions,
  NonlinearEquationsInOneVariableAndSystemsOfEquationsInTwoVariables,
  EquivalentExpressions,
  RatiosRatesProportionalRelationshipsAndUnits,
  Percentages,
  OneVariableDataDistributionsAndMeasuresOfCenterAndSpread,
  TwoVariableDataModelsAndScatterplots,
  ProbabilityAndConditionalProbability,
  InferenceFromSampleStatisticsAndMarginOfError,
  EvaluatingStatisticalClaimsObservationalStudiesAndExperiments,
  AreaAndVolume,
  LinesAnglesAndTriangles,
  RightTrianglesAndTrigonometry,
  Circles,
}

class SatsQuestionSubcategoriesRW {
  final ESatsQuestionSubcategoriesRW type;

  SatsQuestionSubcategoriesRW(
    this.type,
  );

  /// Creates a SatsQuestionTypesRW from a string
  /// Throws an exception if the string is not a valid question type
  /// Example: SatsQuestionTypesRW.fromString("Cross-Text-Connections")
  /// Returns: SatsQuestionTypesRW(ESatsQuestionTypesRW.CrossTextConnections)
  SatsQuestionSubcategoriesRW.fromString(String typeString) : type = getFromString(typeString);

  @override
  String toString() {
    return string;
  }

  /// Returns the enum value of the question subcategory from a string
  /// Throws an exception if the string is not valid
  static ESatsQuestionSubcategoriesRW getFromString(String typeString) {
    switch (typeString) {
    // Existing
      case _CentralIdeasAndDetails:
        return ESatsQuestionSubcategoriesRW.CentralIdeasAndDetails;
      case _CommandOfEvidence:
        return ESatsQuestionSubcategoriesRW.CommandOfEvidence;
      case _CrossTextConnections:
        return ESatsQuestionSubcategoriesRW.CrossTextConnections;
      case _FormStructureAndSense:
        return ESatsQuestionSubcategoriesRW.FormStructureAndSense;
      case _Inferences:
        return ESatsQuestionSubcategoriesRW.Inferences;
      case _RhetoricalSynthesis:
        return ESatsQuestionSubcategoriesRW.RhetoricalSynthesis;
      case _TextStructureAndPurpose:
        return ESatsQuestionSubcategoriesRW.TextStructureAndPurpose;
      case _Transitions:
        return ESatsQuestionSubcategoriesRW.Transitions;
      case _WordsInContext:
        return ESatsQuestionSubcategoriesRW.WordsInContext;
      case _Boundaries:
        return ESatsQuestionSubcategoriesRW.Boundaries;

      case _LinearEquationsInOneVariable:
        return ESatsQuestionSubcategoriesRW.LinearEquationsInOneVariable;
      case _LinearFunctions:
        return ESatsQuestionSubcategoriesRW.LinearFunctions;
      case _LinearEquationsInTwoVariables:
        return ESatsQuestionSubcategoriesRW.LinearEquationsInTwoVariables;
      case _SystemsOfTwoLinearEquationsInTwoVariables:
        return ESatsQuestionSubcategoriesRW
            .SystemsOfTwoLinearEquationsInTwoVariables;
      case _LinearInequalitiesInOneOrTwoVariables:
        return ESatsQuestionSubcategoriesRW
            .LinearInequalitiesInOneOrTwoVariables;
      case _NonlinearFunctions:
        return ESatsQuestionSubcategoriesRW.NonlinearFunctions;
      case _NonlinearEquationsInOneVariableAndSystemsOfEquationsInTwoVariables:
        return ESatsQuestionSubcategoriesRW
            .NonlinearEquationsInOneVariableAndSystemsOfEquationsInTwoVariables;
      case _EquivalentExpressions:
        return ESatsQuestionSubcategoriesRW.EquivalentExpressions;
      case _RatiosRatesProportionalRelationshipsAndUnits:
        return ESatsQuestionSubcategoriesRW
            .RatiosRatesProportionalRelationshipsAndUnits;
      case _Percentages:
        return ESatsQuestionSubcategoriesRW.Percentages;
      case _OneVariableDataDistributionsAndMeasuresOfCenterAndSpread:
        return ESatsQuestionSubcategoriesRW
            .OneVariableDataDistributionsAndMeasuresOfCenterAndSpread;
      case _TwoVariableDataModelsAndScatterplots:
        return ESatsQuestionSubcategoriesRW
            .TwoVariableDataModelsAndScatterplots;
      case _ProbabilityAndConditionalProbability:
        return ESatsQuestionSubcategoriesRW.ProbabilityAndConditionalProbability;
      case _InferenceFromSampleStatisticsAndMarginOfError:
        return ESatsQuestionSubcategoriesRW
            .InferenceFromSampleStatisticsAndMarginOfError;
      case _EvaluatingStatisticalClaimsObservationalStudiesAndExperiments:
        return ESatsQuestionSubcategoriesRW
            .EvaluatingStatisticalClaimsObservationalStudiesAndExperiments;
      case _AreaAndVolume:
        return ESatsQuestionSubcategoriesRW.AreaAndVolume;
      case _LinesAnglesAndTriangles:
        return ESatsQuestionSubcategoriesRW.LinesAnglesAndTriangles;
      case _RightTrianglesAndTrigonometry:
        return ESatsQuestionSubcategoriesRW.RightTrianglesAndTrigonometry;
      case _Circles:
        return ESatsQuestionSubcategoriesRW.Circles;
      default:
        throw Exception("Invalid SatsQuestionTypesRW string: $typeString");
    }
  }

  String get string {
    switch (type) {
      case ESatsQuestionSubcategoriesRW.CentralIdeasAndDetails:
        return _CentralIdeasAndDetails;
      case ESatsQuestionSubcategoriesRW.CommandOfEvidence:
        return _CommandOfEvidence;
      case ESatsQuestionSubcategoriesRW.CrossTextConnections:
        return _CrossTextConnections;
      case ESatsQuestionSubcategoriesRW.FormStructureAndSense:
        return _FormStructureAndSense;
      case ESatsQuestionSubcategoriesRW.Inferences:
        return _Inferences;
      case ESatsQuestionSubcategoriesRW.RhetoricalSynthesis:
        return _RhetoricalSynthesis;
      case ESatsQuestionSubcategoriesRW.TextStructureAndPurpose:
        return _TextStructureAndPurpose;
      case ESatsQuestionSubcategoriesRW.Transitions:
        return _Transitions;
      case ESatsQuestionSubcategoriesRW.WordsInContext:
        return _WordsInContext;
      case ESatsQuestionSubcategoriesRW.Boundaries:
        return _Boundaries;

      case ESatsQuestionSubcategoriesRW.LinearEquationsInOneVariable:
        return _LinearEquationsInOneVariable;
      case ESatsQuestionSubcategoriesRW.LinearFunctions:
        return _LinearFunctions;
      case ESatsQuestionSubcategoriesRW.LinearEquationsInTwoVariables:
        return _LinearEquationsInTwoVariables;
      case ESatsQuestionSubcategoriesRW.SystemsOfTwoLinearEquationsInTwoVariables:
        return _SystemsOfTwoLinearEquationsInTwoVariables;
      case ESatsQuestionSubcategoriesRW.LinearInequalitiesInOneOrTwoVariables:
        return _LinearInequalitiesInOneOrTwoVariables;
      case ESatsQuestionSubcategoriesRW.NonlinearFunctions:
        return _NonlinearFunctions;
      case ESatsQuestionSubcategoriesRW
          .NonlinearEquationsInOneVariableAndSystemsOfEquationsInTwoVariables:
        return _NonlinearEquationsInOneVariableAndSystemsOfEquationsInTwoVariables;
      case ESatsQuestionSubcategoriesRW.EquivalentExpressions:
        return _EquivalentExpressions;
      case ESatsQuestionSubcategoriesRW
          .RatiosRatesProportionalRelationshipsAndUnits:
        return _RatiosRatesProportionalRelationshipsAndUnits;
      case ESatsQuestionSubcategoriesRW.Percentages:
        return _Percentages;
      case ESatsQuestionSubcategoriesRW
          .OneVariableDataDistributionsAndMeasuresOfCenterAndSpread:
        return _OneVariableDataDistributionsAndMeasuresOfCenterAndSpread;
      case ESatsQuestionSubcategoriesRW.TwoVariableDataModelsAndScatterplots:
        return _TwoVariableDataModelsAndScatterplots;
      case ESatsQuestionSubcategoriesRW.ProbabilityAndConditionalProbability:
        return _ProbabilityAndConditionalProbability;
      case ESatsQuestionSubcategoriesRW
          .InferenceFromSampleStatisticsAndMarginOfError:
        return _InferenceFromSampleStatisticsAndMarginOfError;
      case ESatsQuestionSubcategoriesRW
          .EvaluatingStatisticalClaimsObservationalStudiesAndExperiments:
        return _EvaluatingStatisticalClaimsObservationalStudiesAndExperiments;
      case ESatsQuestionSubcategoriesRW.AreaAndVolume:
        return _AreaAndVolume;
      case ESatsQuestionSubcategoriesRW.LinesAnglesAndTriangles:
        return _LinesAnglesAndTriangles;
      case ESatsQuestionSubcategoriesRW.RightTrianglesAndTrigonometry:
        return _RightTrianglesAndTrigonometry;
      case ESatsQuestionSubcategoriesRW.Circles:
        return _Circles;

      default:
        return 'ERROR';
    }
  }

  /// Returns nicely formatted subcategory question name
  String getName() {
    switch (type) {
      case ESatsQuestionSubcategoriesRW.CentralIdeasAndDetails:
        return "Central Ideas and Details";
      case ESatsQuestionSubcategoriesRW.CommandOfEvidence:
        return "Command of Evidence";
      case ESatsQuestionSubcategoriesRW.CrossTextConnections:
        return "Cross-Text Connections";
      case ESatsQuestionSubcategoriesRW.FormStructureAndSense:
        return "Form, Structure, and Sense";
      case ESatsQuestionSubcategoriesRW.Inferences:
        return "Inferences";
      case ESatsQuestionSubcategoriesRW.RhetoricalSynthesis:
        return "Rhetorical Synthesis";
      case ESatsQuestionSubcategoriesRW.TextStructureAndPurpose:
        return "Text Structure and Purpose";
      case ESatsQuestionSubcategoriesRW.Transitions:
        return "Transitions";
      case ESatsQuestionSubcategoriesRW.WordsInContext:
        return "Words in Context";
      case ESatsQuestionSubcategoriesRW.Boundaries:
        return "Boundaries";

      case ESatsQuestionSubcategoriesRW.LinearEquationsInOneVariable:
        return "Linear equations in one variable";
      case ESatsQuestionSubcategoriesRW.LinearFunctions:
        return "Linear functions";
      case ESatsQuestionSubcategoriesRW.LinearEquationsInTwoVariables:
        return "Linear equations in two variables";
      case ESatsQuestionSubcategoriesRW.SystemsOfTwoLinearEquationsInTwoVariables:
        return "Systems of two linear equations in two variables";
      case ESatsQuestionSubcategoriesRW.LinearInequalitiesInOneOrTwoVariables:
        return "Linear inequalities in one or two variables";
      case ESatsQuestionSubcategoriesRW.NonlinearFunctions:
        return "Nonlinear functions";
      case ESatsQuestionSubcategoriesRW
          .NonlinearEquationsInOneVariableAndSystemsOfEquationsInTwoVariables:
        return "Nonlinear equations in one variable and systems of equations in two variables";
      case ESatsQuestionSubcategoriesRW.EquivalentExpressions:
        return "Equivalent expressions";
      case ESatsQuestionSubcategoriesRW
          .RatiosRatesProportionalRelationshipsAndUnits:
        return "Ratios, rates, proportional relationships, and units";
      case ESatsQuestionSubcategoriesRW.Percentages:
        return "Percentages";
      case ESatsQuestionSubcategoriesRW
          .OneVariableDataDistributionsAndMeasuresOfCenterAndSpread:
        return "One-variable data: Distributions and measures of center and spread";
      case ESatsQuestionSubcategoriesRW.TwoVariableDataModelsAndScatterplots:
        return "Two-variable data: Models and scatterplots";
      case ESatsQuestionSubcategoriesRW.ProbabilityAndConditionalProbability:
        return "Probability and conditional probability";
      case ESatsQuestionSubcategoriesRW
          .InferenceFromSampleStatisticsAndMarginOfError:
        return "Inference from sample statistics and margin of error";
      case ESatsQuestionSubcategoriesRW
          .EvaluatingStatisticalClaimsObservationalStudiesAndExperiments:
        return "Evaluating statistical claims: Observational studies and experiments";
      case ESatsQuestionSubcategoriesRW.AreaAndVolume:
        return "Area and volume";
      case ESatsQuestionSubcategoriesRW.LinesAnglesAndTriangles:
        return "Lines, angles, and triangles";
      case ESatsQuestionSubcategoriesRW.RightTrianglesAndTrigonometry:
        return "Right triangles and trigonometry";
      case ESatsQuestionSubcategoriesRW.Circles:
        return "Circles";

      default:
        return 'ERROR';
    }
  }

  embedQuestionName() {
    switch (type) {
      case ESatsQuestionSubcategoriesRW.CentralIdeasAndDetails:
        return "embed_(Central Ideas and Details)";
      case ESatsQuestionSubcategoriesRW.CommandOfEvidence:
        return "embed_(Command of Evidence)";
      case ESatsQuestionSubcategoriesRW.CrossTextConnections:
        return "embed_(Cross-Text Connections)";
      case ESatsQuestionSubcategoriesRW.FormStructureAndSense:
        return "embed_(Form, Structure, and Sense)";
      case ESatsQuestionSubcategoriesRW.Inferences:
        return "embed_(Inferences)";
      case ESatsQuestionSubcategoriesRW.RhetoricalSynthesis:
        return "embed_(Rhetorical Synthesis)";
      case ESatsQuestionSubcategoriesRW.TextStructureAndPurpose:
        return "embed_(Text Structure and Purpose)";
      case ESatsQuestionSubcategoriesRW.Transitions:
        return "embed_(Transitions)";
      case ESatsQuestionSubcategoriesRW.WordsInContext:
        return "embed_(Words in Context)";
      case ESatsQuestionSubcategoriesRW.Boundaries:
        return "embed_(Boundaries)";

      case ESatsQuestionSubcategoriesRW.LinearEquationsInOneVariable:
        return "embed_(Linear equations in one variable)";
      case ESatsQuestionSubcategoriesRW.LinearFunctions:
        return "embed_(Linear functions)";
      case ESatsQuestionSubcategoriesRW.LinearEquationsInTwoVariables:
        return "embed_(Linear equations in two variables)";
      case ESatsQuestionSubcategoriesRW.SystemsOfTwoLinearEquationsInTwoVariables:
        return "embed_(Systems of two linear equations in two variables)";
      case ESatsQuestionSubcategoriesRW.LinearInequalitiesInOneOrTwoVariables:
        return "embed_(Linear inequalities in one or two variables)";
      case ESatsQuestionSubcategoriesRW.NonlinearFunctions:
        return "embed_(Nonlinear functions)";
      case ESatsQuestionSubcategoriesRW
          .NonlinearEquationsInOneVariableAndSystemsOfEquationsInTwoVariables:
        return "embed_(Nonlinear equations in one variable and systems of equations in two variables)";
      case ESatsQuestionSubcategoriesRW.EquivalentExpressions:
        return "embed_(Equivalent expressions)";
      case ESatsQuestionSubcategoriesRW
          .RatiosRatesProportionalRelationshipsAndUnits:
        return "embed_(Ratios, rates, proportional relationships, and units)";
      case ESatsQuestionSubcategoriesRW.Percentages:
        return "embed_(Percentages)";
      case ESatsQuestionSubcategoriesRW
          .OneVariableDataDistributionsAndMeasuresOfCenterAndSpread:
        return "embed_(One-variable data: Distributions and measures of center and spread)";
      case ESatsQuestionSubcategoriesRW.TwoVariableDataModelsAndScatterplots:
        return "embed_(Two-variable data: Models and scatterplots)";
      case ESatsQuestionSubcategoriesRW.ProbabilityAndConditionalProbability:
        return "embed_(Probability and conditional probability)";
      case ESatsQuestionSubcategoriesRW
          .InferenceFromSampleStatisticsAndMarginOfError:
        return "embed_(Inference from sample statistics and margin of error)";
      case ESatsQuestionSubcategoriesRW
          .EvaluatingStatisticalClaimsObservationalStudiesAndExperiments:
        return "embed_(Evaluating statistical claims: Observational studies and experiments)";
      case ESatsQuestionSubcategoriesRW.AreaAndVolume:
        return "embed_(Area and volume)";
      case ESatsQuestionSubcategoriesRW.LinesAnglesAndTriangles:
        return "embed_(Lines, angles, and triangles)";
      case ESatsQuestionSubcategoriesRW.RightTrianglesAndTrigonometry:
        return "embed_(Right triangles and trigonometry)";
      case ESatsQuestionSubcategoriesRW.Circles:
        return "embed_(Circles)";

      default:
        return 'ERROR';
    }
  }

  // String values for each subcategory
  static const _CentralIdeasAndDetails = "Central-Ideas-and-Details";
  static const _CommandOfEvidence = "Command-of-Evidence";
  static const _CrossTextConnections = "Cross-Text-Connections";
  static const _FormStructureAndSense = "Form-Structure-and-Sense";
  static const _Inferences = "Inferences";
  static const _RhetoricalSynthesis = "Rhetorical-Synthesis";
  static const _TextStructureAndPurpose = "Text-Structure-and-Purpose";
  static const _Transitions = "Transitions";
  static const _WordsInContext = "Words-in-Context";
  static const _Boundaries = "Boundaries";

  static const _LinearEquationsInOneVariable =
      "Linear_equations_in_one_variable";
  static const _LinearFunctions = "Linear_functions";
  static const _LinearEquationsInTwoVariables =
      "Linear_equations_in_two_variables";
  static const _SystemsOfTwoLinearEquationsInTwoVariables =
      "Systems_of_two_linear_equations_in_two_variables";
  static const _LinearInequalitiesInOneOrTwoVariables =
      "Linear_inequalities_in_one_or_two_variables";
  static const _NonlinearFunctions = "Nonlinear_functions";
  static const _NonlinearEquationsInOneVariableAndSystemsOfEquationsInTwoVariables =
      "Nonlinear_equations_in_one_variable_and_systems_of_equations_in_two_variables";
  static const _EquivalentExpressions = "Equivalent_expressions";
  static const _RatiosRatesProportionalRelationshipsAndUnits =
      "Ratios_rates_proportional_relationships_and_units";
  static const _Percentages = "Percentages";
  static const _OneVariableDataDistributionsAndMeasuresOfCenterAndSpread =
      "One-variable_data_Distributions_and_measures_of_center_and_spread";
  static const _TwoVariableDataModelsAndScatterplots =
      "Two-variable_data_Models_and_scatterplots";
  static const _ProbabilityAndConditionalProbability =
      "Probability_and_conditional_probability";
  static const _InferenceFromSampleStatisticsAndMarginOfError =
      "Inference_from_sample_statistics_and_margin_of_error";
  static const _EvaluatingStatisticalClaimsObservationalStudiesAndExperiments =
      "Evaluating_statistical_claims_Observational_studies_and_experiments";
  static const _AreaAndVolume = "Area_and_volume";
  static const _LinesAnglesAndTriangles = "Lines_angles_and_triangles";
  static const _RightTrianglesAndTrigonometry =
      "Right_triangles_and_trigonometry";
  static const _Circles = "Circles";

  static const List<String> typesList = [
    // Existing
    _CentralIdeasAndDetails,
    _CommandOfEvidence,
    _CrossTextConnections,
    _FormStructureAndSense,
    _Inferences,
    _RhetoricalSynthesis,
    _TextStructureAndPurpose,
    _Transitions,
    _WordsInContext,
    _Boundaries,

    _LinearEquationsInOneVariable,
    _LinearFunctions,
    _LinearEquationsInTwoVariables,
    _SystemsOfTwoLinearEquationsInTwoVariables,
    _LinearInequalitiesInOneOrTwoVariables,
    _NonlinearFunctions,
    _NonlinearEquationsInOneVariableAndSystemsOfEquationsInTwoVariables,
    _EquivalentExpressions,
    _RatiosRatesProportionalRelationshipsAndUnits,
    _Percentages,
    _OneVariableDataDistributionsAndMeasuresOfCenterAndSpread,
    _TwoVariableDataModelsAndScatterplots,
    _ProbabilityAndConditionalProbability,
    _InferenceFromSampleStatisticsAndMarginOfError,
    _EvaluatingStatisticalClaimsObservationalStudiesAndExperiments,
    _AreaAndVolume,
    _LinesAnglesAndTriangles,
    _RightTrianglesAndTrigonometry,
    _Circles,
  ];
}
