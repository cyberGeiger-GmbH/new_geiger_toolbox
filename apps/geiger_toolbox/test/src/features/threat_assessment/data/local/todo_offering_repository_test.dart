import 'dart:convert';
import 'dart:io';

import 'package:conversational_agent_client/conversational_agent_client.dart';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart' as tester;
import 'package:geiger_toolbox/src/exceptions/app_exception.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/data/local/local_news_feed_repository.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/data/local/todo_offering_repository.dart';
import 'package:geiger_toolbox/src/features/threat_assessment/domain/todo_offering.dart';

import 'package:geiger_toolbox/src/utils/drift_storage/database_table.dart';

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

  tester.group('todo offering repository ...', () {
    tester.test(
      'Given  recommendation offering is available, when offering has been filtered, then add offerings to todos with status marked as planned and lastUpdated to current date',
      () async {
        final todoRepo = container.read(todoOfferingRepoProvider);
        final newsRepo = container.read(localNewsFeedRepositoryProvider);
        //store news
        await newsRepo.synFromRemote(data: sourceData);

        // get recommendation
        final selectedNews = await newsRepo.fetchNewsByTitle(title: "Defensible Security Architecture");

        final recommendations = selectedNews.recommendations;

        final firstRecommendation = recommendations.first;

        //fetch all recommendationOffer
        final offering = await todoRepo.fetchFilteredOfferingStatus(recommendationId: firstRecommendation.id);

        print("offering => $offering");

        //show all todos
        final Stream<List<TodoOffering>> stream = todoRepo.watchTodoOfferingStatus();

        // lister to the stream of todos
        final expectation = tester.expectLater(
          stream,
          tester.emitsInOrder([tester.isEmpty, tester.isA<List<TodoOffering>>()]),
        );

        //add all offering to todo
        await todoRepo.addListTodo(
          offerData:
              offering
                  .map((toElement) => toElement.copyWith(status: Status.planned, lastUpdated: DateTime.now()))
                  .toList(),
        );

        tester.expect(offering, tester.isNotEmpty);

        // wait for the stream to emit expected values
        await expectation;
      },
    );
    tester.test(
      "given todo offering is available, when status marked has done updated, then todo offering status is updated",
      () async {
        final todoRepo = container.read(todoOfferingRepoProvider);
        final newsRepo = container.read(localNewsFeedRepositoryProvider);

        final selectedNews = await newsRepo.fetchNewsByTitle(title: "Defensible Security Architecture");

        final recommendations = selectedNews.recommendations;

        final firstRecommendation = recommendations.first;

        //fetch all recommendationOffer
        final offerings = await todoRepo.fetchFilteredOfferingStatus(recommendationId: firstRecommendation.id);

        final offering = offerings.first;

        //update status of todos

        //show all todos
        final Stream<List<TodoOffering>> stream = todoRepo.watchTodoOfferingStatus();

        // lister to the stream of todos
        final expectation = tester.expectLater(
          stream,
          tester.emitsInOrder([tester.isNotEmpty, tester.isA<List<TodoOffering>>()]),
        );
        //marke as single todo has done
        final result = await todoRepo.updateTodoStatus(id: offering.id, status: Status.done);

        tester.expect(result, 1);

        await expectation;
      },
    );
    tester.test(" Given todo is updated, when todo is not found, then throw DataBaseException", () async {
      final todoRepo = container.read(todoOfferingRepoProvider);

      await tester.expectLater(
        () => todoRepo.updateTodoStatus(id: "123", status: Status.done),
        tester.throwsA(tester.isA<DataBaseException>()),
      );
    });
  });
}
