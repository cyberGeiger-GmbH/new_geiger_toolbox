import 'dart:convert';
import 'dart:io';

import 'package:conversational_agent_client/conversational_agent_client.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:geiger_toolbox/src/features/threat_assessment/data/local/local_news_feed_repository.dart';
import 'package:geiger_toolbox/src/utils/drift_storage/database_table.dart';
import 'package:flutter_test/flutter_test.dart' as tester;

void main() {
  late ProviderContainer container;
  late List<News> sourceData;

  DatabaseConnection testDatabaseConnection() {
    return DatabaseConnection(NativeDatabase.memory());
  }

  ProviderContainer getDataBaseContainer() {
    final container = ProviderContainer(
      overrides: [
        appDatabaseProvider.overrideWithValue(
          /// Replace the [QueryExecutor] parameter with a [DatabaseConnection]
          AppDatabase(testDatabaseConnection()),
        ),
      ],
    );

    return container;
  }

  tester.setUpAll(() async {
    container = getDataBaseContainer();
    final json = await File("test/src/features/news_data.json").readAsString();
    sourceData = News.getNews(jsonDecode(json));
  });

  tester.tearDownAll(() {
    container.dispose();
  });

  tester.group("test news feed repository", () {
    tester.test(
      "Given news data is fetched from file that is not empty and the length is 3, when news data is synchronised, then news data is stored in database and the length of the news data is 3",
      () async {
        final repoNewsFeed = container.read(localNewsFeedRepositoryProvider);

        //store data
        await repoNewsFeed.resolveNewsConflict(data: sourceData);
        //fetch data
        final result = await repoNewsFeed.fetchNewsList();

        tester.expect(result.length, 3);
      },
    );

    tester.test(
      "Given news data is  already stored in the database, when news the news data is stored again, then same news data length  is returned",
      () async {
        final repoNewsFeed = container.read(localNewsFeedRepositoryProvider);

        //store data again
        await repoNewsFeed.resolveNewsConflict(data: sourceData);

        //fetch data
        final result = await repoNewsFeed.fetchNewsList();

        tester.expect(result.length, 3);
      },
    );

    tester.test(
      "Given news data has been stored in the database, when news data is fetched by title  that does not exist, then no news data is returned",
      () async {
        final repoNewsFeed = container.read(localNewsFeedRepositoryProvider);

        //fetch data
        tester.expect(
          () => repoNewsFeed.fetchNewsById(newsId: "title1"),
          tester.throwsA(
            tester.isA<StateError>().having((e) => e.message, 'message', 'No news found with id: title1,'),
          ),
        );
      },
    );

    tester.test(
      "Given news data has been stored in the database, when news data is fetched by title  that does  exist, then news data is returned",
      () async {
        final repoNewsFeed = container.read(localNewsFeedRepositoryProvider);

        final result = await repoNewsFeed.fetchNewsById(newsId: "Defensible-Security-Architecture-and-Engineering");

        //fetch data
        tester.expect(result, tester.isNot(tester.throwsA(tester.isA<StateError>())));

        tester.expect(result, tester.isA<News>());
      },
    );
  });
}
