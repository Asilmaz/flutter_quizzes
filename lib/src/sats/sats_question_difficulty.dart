enum ESatsQuestionDifficulty {
  Easy,
  Medium,
  Hard,
}

class SatsQuestionDifficulty {
  final ESatsQuestionDifficulty difficulty;

  SatsQuestionDifficulty(
    this.difficulty,
  );

  @override
  operator==(Object other) {
    return other is SatsQuestionDifficulty && difficulty == other.difficulty;
  }

  @override
  int get hashCode {
    return difficulty.hashCode;
  }

  SatsQuestionDifficulty.fromString(String difficultyString) : difficulty = getFromString(difficultyString);
  SatsQuestionDifficulty.fromContainingString(String containingString) : difficulty = getFromContainingString(containingString);

  @override
  String toString() {
    return string;
  }

  double getScore() {
    switch (difficulty) {
      case ESatsQuestionDifficulty.Easy:
        return 1;
      case ESatsQuestionDifficulty.Medium:
        return 2;
      case ESatsQuestionDifficulty.Hard:
        return 3;
    }
  }

  static ESatsQuestionDifficulty getFromString(String difficultyString) {
    switch (difficultyString) {
      case _Easy:
        return ESatsQuestionDifficulty.Easy;
      case _Medium:
        return ESatsQuestionDifficulty.Medium;
      case _Hard:
        return ESatsQuestionDifficulty.Hard;
      default:
        throw ArgumentError.value(
          difficultyString,
          "difficultyString",
          "Invalid difficulty string: $difficultyString.",
        );
    }
  }

  static ESatsQuestionDifficulty getFromContainingString(String containing) {
    if (containing.contains(_Easy)) {
      return ESatsQuestionDifficulty.Easy;
    }
    if (containing.contains(_Medium)) {
      return ESatsQuestionDifficulty.Medium;
    }
    if (containing.contains(_Hard)) {
      return ESatsQuestionDifficulty.Hard;
    }
    throw ArgumentError.value(
      containing,
      "containing",
      "Invalid difficulty string: $containing.",
    );
  }

  String get string {
    switch (difficulty) {
      case ESatsQuestionDifficulty.Easy:
        return _Easy;
      case ESatsQuestionDifficulty.Medium:
        return _Medium;
      case ESatsQuestionDifficulty.Hard:
        return _Hard;
    }
  }

// String values for each difficulty
  static const String _Easy = "Easy";
  static const String _Medium = "Medium";
  static const String _Hard = "Hard";

  static SatsQuestionDifficulty difficultyEasy = SatsQuestionDifficulty(ESatsQuestionDifficulty.Easy);
  static SatsQuestionDifficulty difficultyMedium = SatsQuestionDifficulty(ESatsQuestionDifficulty.Medium);
  static SatsQuestionDifficulty difficultyHard = SatsQuestionDifficulty(ESatsQuestionDifficulty.Hard);

  static List<SatsQuestionDifficulty> difficulties = [
    difficultyEasy,
    difficultyMedium,
    difficultyHard,
  ];
}
