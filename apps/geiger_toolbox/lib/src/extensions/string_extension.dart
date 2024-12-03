extension StringExtension on String {
  static const wordLength = 4;
  static const remainingWord = 3;
  String get replaceSpacesWithHyphen {
    return trim().toLowerCase().replaceAll(' ', '-');
  }

  String get replaceHyphenWithSpace {
    // Replace all hyphens with spaces
    String result = replaceAll('-', ' ');

    // Split the result into a list of words
    List<String> words = result.split(' ');

    // If there are more than 4 words, return only the first 3 joined by a space
    if (words.length > wordLength) {
      return words.take(remainingWord).join(' ');
    }

    // Otherwise, return the entire result
    return result;
  }

  String get toTitleCase {
    // List of auxiliary verbs and prepositions that should remain lowercase
    final lowerCaseWords = {
      "is",
      "am",
      "are",
      "was",
      "were",
      "be",
      "been",
      "being",
      "do",
      "does",
      "did",
      "have",
      "has",
      "had",
      "will",
      "would",
      "shall",
      "should",
      "can",
      "could",
      "may",
      "might",
      "must",
      "in",
      "on",
      "at",
      "to",
      "for",
      "with",
      "by",
      "of",
      "about",
      "as",
      "into",
      "like",
      "through",
      "over",
      "before",
      "between",
      "after",
      "since",
      "without",
      "under",
      "within",
      "along",
      "following",
      "across",
      "behind",
      "beyond",
      "plus",
      "except",
      "but",
      "up",
      "out",
      "around",
      "down",
      "off",
      "above",
      "near"
    };

    // Split the string into words
    List<String> words = trim().split(RegExp(r'\s+'));

    // Process each word
    for (int i = 0; i < words.length; i++) {
      String word = words[i];
      // Capitalize the word if it's the first word or not in the lowerCaseWords set
      if (i == 0 || !lowerCaseWords.contains(word.toLowerCase())) {
        // ignore: avoid-substring
        words[i] = word[0].toUpperCase() + word.substring(1).toLowerCase();
      } else {
        // Otherwise, keep the word in lowercase
        words[i] = word.toLowerCase();
      }
    }

    // Join the words back into a single string
    return words.join(' ');
  }
}
