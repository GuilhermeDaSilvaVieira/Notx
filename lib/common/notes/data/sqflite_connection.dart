import 'dart:io';

import 'package:notx/common/notes/data/tables.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class SqfliteConnection {
  final databaseName = 'Notx.db';

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

      var databasePath;
      try {
        databasePath = await getApplicationDocumentsDirectory();
      } catch (e) {
        // Linux without xdg-user-dirs support, e.g. NixOS with WM
        databasePath = Directory(Platform.environment['HOME'].toString());
      }

      final path = join(databasePath.path, 'Notx', 'data', databaseName);
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
