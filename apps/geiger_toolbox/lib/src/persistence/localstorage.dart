import 'package:conversational_agent_client/conversational_agent_client.dart';

abstract class Localstorage {
  Future<void> synFromRemote(List<News> news);

  Future<void> deleteNews();

  Stream<List<News>> watchNewsList();

  Stream<News?> watchNewsByTitle(String title);

  Future<List<Recommendation>> fetchAllTaskRecommendation();
}
