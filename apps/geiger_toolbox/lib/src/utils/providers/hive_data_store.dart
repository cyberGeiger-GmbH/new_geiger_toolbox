import 'package:conversational_agent_client/conversational_agent_client.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geiger_toolbox/hive_registrar.g.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/domain/news_feed.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/domain/user_perference.dart';
import 'package:hive_ce_flutter/hive_flutter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'hive_data_store.g.dart';

class HiveDataStore {
  //box names
  static const String newsFeedBoxName = "newsFeedBox";
  static const String userPerferenceBoxName = "userPerferenceBox";
  Future<void> initHive() async {
    // await Future.delayed(const Duration(seconds: 10));
    await Hive.initFlutter();
    //register all adapters
    Hive.registerAdapters();
    //open boxes
    Hive.openBox<NewsFeed>(newsFeedBoxName);
  }

  //cached news articles
  Future<void> cachedNewsFeed(
      {required List<News> news, bool force = false}) async {
    final newsBox = Hive.box<News>(newsFeedBoxName);
    if (news.isEmpty || force == true) {
      await newsBox.clear();
      await newsBox.addAll(news);
    }
  }

  //load cached news articles
  ValueListenable<Box<List<NewsFeed>>> loadCachedNewsArticles() {
    return Hive.box<List<NewsFeed>>(newsFeedBoxName).listenable();
  }

  //set initialScan [UserPerference] attribute to true
  Future<void> setFirstScan() async {
    //box
    final userBox = Hive.box<UserPerference>(userPerferenceBoxName);
    final UserPerference? userperference = userBox.getAt(0);
    if (userperference == null) {
      const userP = UserPerference(initialScan: true);
      await userBox.add(userP);
    } else {
      final updateUser = userperference.copyWith(initialScan: true);
      await userBox.add(updateUser);
    }
  }

  //get [UserPerference]
  UserPerference? userPerference() {
    final userBox = Hive.box<UserPerference>(userPerferenceBoxName);
    return userBox.getAt(0);
  }
}

@Riverpod(keepAlive: true)
HiveDataStore hiveDataStore(Ref ref) => HiveDataStore();

@Riverpod(keepAlive: true)
Future<void> initHive(Ref ref) async {
  // ignore: avoid_manual_providers_as_generated_provider_dependency
  final HiveDataStore hiveDataStore = ref.watch(hiveDataStoreProvider);

  return hiveDataStore.initHive();
}
