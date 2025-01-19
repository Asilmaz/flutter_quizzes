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

  /// Returns the string representation of the question type (eg. for Shared Preferences or print)
  @override
  String toString() {
    return string;
  }

  /// Returns the enum value of the question type from a string
  /// Throws an exception if the string is not a valid question type
  static ESatsQuestionSubcategoriesRW getFromString(String typeString) {
    switch (typeString) {
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

  /// List of all subcategory types for R&W SATs questions
  /// Should be used instead of hardcoding elements
  /// WARNING: The order of the elements has meaning and should be changed with caution
  static const List<String> typesList = [
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
  ];
}
