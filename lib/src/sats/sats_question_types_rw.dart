enum ESatsQuestionSubcategories {
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

class SatsQuestionSubcategories {
  final ESatsQuestionSubcategories type;

  SatsQuestionSubcategories(
    this.type,
  );

  /// Creates a SatsQuestionTypesRW from a string
  /// Throws an exception if the string is not a valid question type
  /// Example: SatsQuestionTypesRW.fromString("Cross-Text-Connections")
  /// Returns: SatsQuestionTypesRW(ESatsQuestionTypesRW.CrossTextConnections)
  SatsQuestionSubcategories.fromString(String typeString) : type = getFromString(typeString);

  @override
  String toString() {
    return string;
  }

  /// Returns the enum value of the question subcategory from a string
  /// Throws an exception if the string is not valid
  static ESatsQuestionSubcategories getFromString(String typeString) {
    switch (typeString) {
    // Existing
      case _CentralIdeasAndDetails:
        return ESatsQuestionSubcategories.CentralIdeasAndDetails;
      case _CommandOfEvidence:
        return ESatsQuestionSubcategories.CommandOfEvidence;
      case _CrossTextConnections:
        return ESatsQuestionSubcategories.CrossTextConnections;
      case _FormStructureAndSense:
        return ESatsQuestionSubcategories.FormStructureAndSense;
      case _Inferences:
        return ESatsQuestionSubcategories.Inferences;
      case _RhetoricalSynthesis:
        return ESatsQuestionSubcategories.RhetoricalSynthesis;
      case _TextStructureAndPurpose:
        return ESatsQuestionSubcategories.TextStructureAndPurpose;
      case _Transitions:
        return ESatsQuestionSubcategories.Transitions;
      case _WordsInContext:
        return ESatsQuestionSubcategories.WordsInContext;
      case _Boundaries:
        return ESatsQuestionSubcategories.Boundaries;

      case _LinearEquationsInOneVariable:
        return ESatsQuestionSubcategories.LinearEquationsInOneVariable;
      case _LinearFunctions:
        return ESatsQuestionSubcategories.LinearFunctions;
      case _LinearEquationsInTwoVariables:
        return ESatsQuestionSubcategories.LinearEquationsInTwoVariables;
      case _SystemsOfTwoLinearEquationsInTwoVariables:
        return ESatsQuestionSubcategories
            .SystemsOfTwoLinearEquationsInTwoVariables;
      case _LinearInequalitiesInOneOrTwoVariables:
        return ESatsQuestionSubcategories
            .LinearInequalitiesInOneOrTwoVariables;
      case _NonlinearFunctions:
        return ESatsQuestionSubcategories.NonlinearFunctions;
      case _NonlinearEquationsInOneVariableAndSystemsOfEquationsInTwoVariables:
        return ESatsQuestionSubcategories
            .NonlinearEquationsInOneVariableAndSystemsOfEquationsInTwoVariables;
      case _EquivalentExpressions:
        return ESatsQuestionSubcategories.EquivalentExpressions;
      case _RatiosRatesProportionalRelationshipsAndUnits:
        return ESatsQuestionSubcategories
            .RatiosRatesProportionalRelationshipsAndUnits;
      case _Percentages:
        return ESatsQuestionSubcategories.Percentages;
      case _OneVariableDataDistributionsAndMeasuresOfCenterAndSpread:
        return ESatsQuestionSubcategories
            .OneVariableDataDistributionsAndMeasuresOfCenterAndSpread;
      case _TwoVariableDataModelsAndScatterplots:
        return ESatsQuestionSubcategories
            .TwoVariableDataModelsAndScatterplots;
      case _ProbabilityAndConditionalProbability:
        return ESatsQuestionSubcategories.ProbabilityAndConditionalProbability;
      case _InferenceFromSampleStatisticsAndMarginOfError:
        return ESatsQuestionSubcategories
            .InferenceFromSampleStatisticsAndMarginOfError;
      case _EvaluatingStatisticalClaimsObservationalStudiesAndExperiments:
        return ESatsQuestionSubcategories
            .EvaluatingStatisticalClaimsObservationalStudiesAndExperiments;
      case _AreaAndVolume:
        return ESatsQuestionSubcategories.AreaAndVolume;
      case _LinesAnglesAndTriangles:
        return ESatsQuestionSubcategories.LinesAnglesAndTriangles;
      case _RightTrianglesAndTrigonometry:
        return ESatsQuestionSubcategories.RightTrianglesAndTrigonometry;
      case _Circles:
        return ESatsQuestionSubcategories.Circles;
      default:
        throw Exception("Invalid SatsQuestionTypes string: $typeString");
    }
  }

  String get string {
    switch (type) {
      case ESatsQuestionSubcategories.CentralIdeasAndDetails:
        return _CentralIdeasAndDetails;
      case ESatsQuestionSubcategories.CommandOfEvidence:
        return _CommandOfEvidence;
      case ESatsQuestionSubcategories.CrossTextConnections:
        return _CrossTextConnections;
      case ESatsQuestionSubcategories.FormStructureAndSense:
        return _FormStructureAndSense;
      case ESatsQuestionSubcategories.Inferences:
        return _Inferences;
      case ESatsQuestionSubcategories.RhetoricalSynthesis:
        return _RhetoricalSynthesis;
      case ESatsQuestionSubcategories.TextStructureAndPurpose:
        return _TextStructureAndPurpose;
      case ESatsQuestionSubcategories.Transitions:
        return _Transitions;
      case ESatsQuestionSubcategories.WordsInContext:
        return _WordsInContext;
      case ESatsQuestionSubcategories.Boundaries:
        return _Boundaries;

      case ESatsQuestionSubcategories.LinearEquationsInOneVariable:
        return _LinearEquationsInOneVariable;
      case ESatsQuestionSubcategories.LinearFunctions:
        return _LinearFunctions;
      case ESatsQuestionSubcategories.LinearEquationsInTwoVariables:
        return _LinearEquationsInTwoVariables;
      case ESatsQuestionSubcategories.SystemsOfTwoLinearEquationsInTwoVariables:
        return _SystemsOfTwoLinearEquationsInTwoVariables;
      case ESatsQuestionSubcategories.LinearInequalitiesInOneOrTwoVariables:
        return _LinearInequalitiesInOneOrTwoVariables;
      case ESatsQuestionSubcategories.NonlinearFunctions:
        return _NonlinearFunctions;
      case ESatsQuestionSubcategories
          .NonlinearEquationsInOneVariableAndSystemsOfEquationsInTwoVariables:
        return _NonlinearEquationsInOneVariableAndSystemsOfEquationsInTwoVariables;
      case ESatsQuestionSubcategories.EquivalentExpressions:
        return _EquivalentExpressions;
      case ESatsQuestionSubcategories
          .RatiosRatesProportionalRelationshipsAndUnits:
        return _RatiosRatesProportionalRelationshipsAndUnits;
      case ESatsQuestionSubcategories.Percentages:
        return _Percentages;
      case ESatsQuestionSubcategories
          .OneVariableDataDistributionsAndMeasuresOfCenterAndSpread:
        return _OneVariableDataDistributionsAndMeasuresOfCenterAndSpread;
      case ESatsQuestionSubcategories.TwoVariableDataModelsAndScatterplots:
        return _TwoVariableDataModelsAndScatterplots;
      case ESatsQuestionSubcategories.ProbabilityAndConditionalProbability:
        return _ProbabilityAndConditionalProbability;
      case ESatsQuestionSubcategories
          .InferenceFromSampleStatisticsAndMarginOfError:
        return _InferenceFromSampleStatisticsAndMarginOfError;
      case ESatsQuestionSubcategories
          .EvaluatingStatisticalClaimsObservationalStudiesAndExperiments:
        return _EvaluatingStatisticalClaimsObservationalStudiesAndExperiments;
      case ESatsQuestionSubcategories.AreaAndVolume:
        return _AreaAndVolume;
      case ESatsQuestionSubcategories.LinesAnglesAndTriangles:
        return _LinesAnglesAndTriangles;
      case ESatsQuestionSubcategories.RightTrianglesAndTrigonometry:
        return _RightTrianglesAndTrigonometry;
      case ESatsQuestionSubcategories.Circles:
        return _Circles;

      default:
        return 'ERROR';
    }
  }

  /// Returns nicely formatted subcategory question name
  String getName() {
    switch (type) {
      case ESatsQuestionSubcategories.CentralIdeasAndDetails:
        return "Central Ideas and Details";
      case ESatsQuestionSubcategories.CommandOfEvidence:
        return "Command of Evidence";
      case ESatsQuestionSubcategories.CrossTextConnections:
        return "Cross-Text Connections";
      case ESatsQuestionSubcategories.FormStructureAndSense:
        return "Form, Structure, and Sense";
      case ESatsQuestionSubcategories.Inferences:
        return "Inferences";
      case ESatsQuestionSubcategories.RhetoricalSynthesis:
        return "Rhetorical Synthesis";
      case ESatsQuestionSubcategories.TextStructureAndPurpose:
        return "Text Structure and Purpose";
      case ESatsQuestionSubcategories.Transitions:
        return "Transitions";
      case ESatsQuestionSubcategories.WordsInContext:
        return "Words in Context";
      case ESatsQuestionSubcategories.Boundaries:
        return "Boundaries";

      case ESatsQuestionSubcategories.LinearEquationsInOneVariable:
        return "Linear equations in one variable";
      case ESatsQuestionSubcategories.LinearFunctions:
        return "Linear functions";
      case ESatsQuestionSubcategories.LinearEquationsInTwoVariables:
        return "Linear equations in two variables";
      case ESatsQuestionSubcategories.SystemsOfTwoLinearEquationsInTwoVariables:
        return "Systems of two linear equations in two variables";
      case ESatsQuestionSubcategories.LinearInequalitiesInOneOrTwoVariables:
        return "Linear inequalities in one or two variables";
      case ESatsQuestionSubcategories.NonlinearFunctions:
        return "Nonlinear functions";
      case ESatsQuestionSubcategories
          .NonlinearEquationsInOneVariableAndSystemsOfEquationsInTwoVariables:
        return "Nonlinear equations in one variable and systems of equations in two variables";
      case ESatsQuestionSubcategories.EquivalentExpressions:
        return "Equivalent expressions";
      case ESatsQuestionSubcategories
          .RatiosRatesProportionalRelationshipsAndUnits:
        return "Ratios, rates, proportional relationships, and units";
      case ESatsQuestionSubcategories.Percentages:
        return "Percentages";
      case ESatsQuestionSubcategories
          .OneVariableDataDistributionsAndMeasuresOfCenterAndSpread:
        return "One-variable data: Distributions and measures of center and spread";
      case ESatsQuestionSubcategories.TwoVariableDataModelsAndScatterplots:
        return "Two-variable data: Models and scatterplots";
      case ESatsQuestionSubcategories.ProbabilityAndConditionalProbability:
        return "Probability and conditional probability";
      case ESatsQuestionSubcategories
          .InferenceFromSampleStatisticsAndMarginOfError:
        return "Inference from sample statistics and margin of error";
      case ESatsQuestionSubcategories
          .EvaluatingStatisticalClaimsObservationalStudiesAndExperiments:
        return "Evaluating statistical claims: Observational studies and experiments";
      case ESatsQuestionSubcategories.AreaAndVolume:
        return "Area and volume";
      case ESatsQuestionSubcategories.LinesAnglesAndTriangles:
        return "Lines, angles, and triangles";
      case ESatsQuestionSubcategories.RightTrianglesAndTrigonometry:
        return "Right triangles and trigonometry";
      case ESatsQuestionSubcategories.Circles:
        return "Circles";

      default:
        return 'ERROR';
    }
  }

  embedQuestionName() {
    switch (type) {
      case ESatsQuestionSubcategories.CentralIdeasAndDetails:
        return "embed_(Central Ideas and Details)";
      case ESatsQuestionSubcategories.CommandOfEvidence:
        return "embed_(Command of Evidence)";
      case ESatsQuestionSubcategories.CrossTextConnections:
        return "embed_(Cross-Text Connections)";
      case ESatsQuestionSubcategories.FormStructureAndSense:
        return "embed_(Form, Structure, and Sense)";
      case ESatsQuestionSubcategories.Inferences:
        return "embed_(Inferences)";
      case ESatsQuestionSubcategories.RhetoricalSynthesis:
        return "embed_(Rhetorical Synthesis)";
      case ESatsQuestionSubcategories.TextStructureAndPurpose:
        return "embed_(Text Structure and Purpose)";
      case ESatsQuestionSubcategories.Transitions:
        return "embed_(Transitions)";
      case ESatsQuestionSubcategories.WordsInContext:
        return "embed_(Words in Context)";
      case ESatsQuestionSubcategories.Boundaries:
        return "embed_(Boundaries)";

      case ESatsQuestionSubcategories.LinearEquationsInOneVariable:
        return "embed_(Linear equations in one variable)";
      case ESatsQuestionSubcategories.LinearFunctions:
        return "embed_(Linear functions)";
      case ESatsQuestionSubcategories.LinearEquationsInTwoVariables:
        return "embed_(Linear equations in two variables)";
      case ESatsQuestionSubcategories.SystemsOfTwoLinearEquationsInTwoVariables:
        return "embed_(Systems of two linear equations in two variables)";
      case ESatsQuestionSubcategories.LinearInequalitiesInOneOrTwoVariables:
        return "embed_(Linear inequalities in one or two variables)";
      case ESatsQuestionSubcategories.NonlinearFunctions:
        return "embed_(Nonlinear functions)";
      case ESatsQuestionSubcategories
          .NonlinearEquationsInOneVariableAndSystemsOfEquationsInTwoVariables:
        return "embed_(Nonlinear equations in one variable and systems of equations in two variables)";
      case ESatsQuestionSubcategories.EquivalentExpressions:
        return "embed_(Equivalent expressions)";
      case ESatsQuestionSubcategories
          .RatiosRatesProportionalRelationshipsAndUnits:
        return "embed_(Ratios, rates, proportional relationships, and units)";
      case ESatsQuestionSubcategories.Percentages:
        return "embed_(Percentages)";
      case ESatsQuestionSubcategories
          .OneVariableDataDistributionsAndMeasuresOfCenterAndSpread:
        return "embed_(One-variable data: Distributions and measures of center and spread)";
      case ESatsQuestionSubcategories.TwoVariableDataModelsAndScatterplots:
        return "embed_(Two-variable data: Models and scatterplots)";
      case ESatsQuestionSubcategories.ProbabilityAndConditionalProbability:
        return "embed_(Probability and conditional probability)";
      case ESatsQuestionSubcategories
          .InferenceFromSampleStatisticsAndMarginOfError:
        return "embed_(Inference from sample statistics and margin of error)";
      case ESatsQuestionSubcategories
          .EvaluatingStatisticalClaimsObservationalStudiesAndExperiments:
        return "embed_(Evaluating statistical claims: Observational studies and experiments)";
      case ESatsQuestionSubcategories.AreaAndVolume:
        return "embed_(Area and volume)";
      case ESatsQuestionSubcategories.LinesAnglesAndTriangles:
        return "embed_(Lines, angles, and triangles)";
      case ESatsQuestionSubcategories.RightTrianglesAndTrigonometry:
        return "embed_(Right triangles and trigonometry)";
      case ESatsQuestionSubcategories.Circles:
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
