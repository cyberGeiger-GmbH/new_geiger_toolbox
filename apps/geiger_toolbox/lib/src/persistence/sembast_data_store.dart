import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sembast/sembast_io.dart';
import 'package:sembast_web/sembast_web.dart';

part 'sembast_data_store.g.dart';

class SembastDataStore {
  SembastDataStore._(this.db);

  final Database db;
  final store = StoreRef.main();

  static Future<Database> _createDatabase(String filename) async {
    if (!kIsWeb) {
      final appDocDir = await getApplicationDocumentsDirectory();
      return databaseFactoryIo.openDatabase('${appDocDir.path}/$filename');
    } else {
      return databaseFactoryWeb.openDatabase(filename);
    }
  }

  static Future<SembastDataStore> makeDefault() async {
    return SembastDataStore._(await _createDatabase('default.db'));
  }

  void dispose() {
    db.close();
  }
}

@Riverpod(keepAlive: true)
Future<SembastDataStore> sembastDataStore(Ref ref) async {
  final store = await SembastDataStore.makeDefault();
  //ondispose close the dipose the db
  ref.onDispose(store.dispose);
  return store;
}
