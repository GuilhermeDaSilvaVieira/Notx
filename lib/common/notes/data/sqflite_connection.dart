import 'dart:io';

import 'package:notx/common/notes/data/tables.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class SqfliteConnection {
  final databaseName = 'notx.db';

  Future<Database> initDatabase() async {
    if (Platform.isAndroid || Platform.isIOS || Platform.isMacOS) {
      final databasePath = await getApplicationDocumentsDirectory();
      final path = join(databasePath.path, databaseName);
      return openDatabase(path, version: 1, onCreate: (db, version) async {
        await db.execute(Tables.noteTable);
      });
    } else if (Platform.isLinux || Platform.isWindows) {
      sqfliteFfiInit();
      final databaseFactory = databaseFactoryFfi;
      final databasePath = await getApplicationDocumentsDirectory();
      // final databasePath =
      //     Directory('${Platform.environment['HOME']}/Documents/');
      print(databasePath);
      final path = join(databasePath.path, 'databases', databaseName);
      return databaseFactory.openDatabase(
        path,
        options: OpenDatabaseOptions(
          version: 1,
          onCreate: (db, version) async {
            await db.execute(Tables.noteTable);
          },
        ),
      );
    } else {
      throw Exception('Unsupported platform');
    }
  }
}
