extension StringExtension on String {
  String replaceSpacesWithHyphen() {
    return trim().toLowerCase().replaceAll(' ', '-');
  }
}
