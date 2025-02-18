// ignore_for_file: avoid_print

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart' as tester;

import 'package:geiger_toolbox/src/features/authentication/data/user_profile_repository.dart';
import 'package:geiger_toolbox/src/features/authentication/domain/user.dart';
import 'package:geiger_toolbox/src/utils/drift_storage/database_table.dart';
import 'package:geiger_toolbox/src/utils/uuid.dart';

void main() {
  late ProviderContainer container;

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
  });

  tester.tearDownAll(() {
    // container.read(appDatabaseProvider).
    container.dispose();
  });

  tester.group('test userProfileRepository', () {
    tester.test('when user has not be created, throw Null', () async {
      final userRepo = container.read(userProfileRepositoryProvider);

      //fetch user
      final result = await userRepo.fetchUser();

      tester.expect(result, tester.isNull);
    });

    tester.test('Stream emits null initially and then the user objct after insertion', () async {
      final uuid = container.read(getUuidProvider);
      final User user = User(userId: uuid, owner: true, name: "tester", email: "tester@gmail.com");
      final userRepo = container.read(userProfileRepositoryProvider);

      //stream user
      final Stream<User?> stream = userRepo.watchUser();

      // lister to the stream
      final expectation = tester.expectLater(stream, tester.emitsInOrder([tester.isNull, tester.isA<User>()]));

      //store
      final status = await userRepo.createUserProfile(user: user);

      tester.expect(status, 1);

      // wait for the stream to emit expected values
      await expectation;
    });

    tester.test('when user has been created throw not error', () async {
      final userRepo = container.read(userProfileRepositoryProvider);

      //fetch user
      final result = await userRepo.fetchUser();

      tester.expect(result, tester.isNotNull);
      tester.expect(result!.name, 'tester');
    });
  });
}
