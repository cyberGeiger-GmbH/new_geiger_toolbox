List<T> limitListLength<T>({required List<T> inputList, required int limit}) {
  if (limit < 0) {
    throw ArgumentError("Limit cannot be negative");
  }
  return inputList.length > limit ? inputList.sublist(0, limit) : inputList;
}
