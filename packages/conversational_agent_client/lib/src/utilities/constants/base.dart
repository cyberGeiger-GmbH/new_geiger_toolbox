class Base {
  static const String url = "geigercaapi.rhiyeszeros.ch";

  /// news path
  static const String newsPath = "/news";

  // create user id path
  static const String createThreadPath = "/createThreadForID";

  // chat path
  static const String chatPath = "/";

  //retrive previous chat history
  static const String chatHistory = "/messages";

  static const origin = {"origin": "toolbox"};
  static const headers = {"Content-Type": "application/json"};

  const Base._();
}
