import 'package:intl/intl.dart';

extension StringExtension on String {
  static const wordLength = 4;
  static const remainingWord = 3;
  String get replaceSpacesWithHyphen {
    return toLowerCase()
        .replaceAll(RegExp(r'[^\w\s]'), '') // Remove special characters
        .replaceAll(RegExp(r'\s+'), '-'); // Replace spaces with hyphens
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

    words
        .map((word) {
          // Format numbers greater than or equal to 1000 with commas
          if (RegExp(r'^\d+$').hasMatch(word)) {
            int number = int.parse(word);
            if (number >= 1000) {
              return NumberFormat.decimalPattern().format(number); // Format the number
            }
          }
          return word; // Leave other words as is
        })
        .join(' '); // Join words back into a sentence

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
      "near",
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
