import 'package:hive_ce/hive.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/domain/news_feed.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/domain/user_perference.dart';

extension HiveRegistrar on HiveInterface {
  void registerAdapters() {
    registerAdapter(NewsFeedAdapter());
    registerAdapter(UserPerferenceAdapter());
  }
}
