import 'package:bytebank/database/dao/contact_dao.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

const dataBaseName = "bytebank.db";

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), dataBaseName);
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(ContactDao.createTableSql);
    },
    version: 1,
    onUpgrade: (db, oldVersion, newVersion) {},
    // onDowngrade: onDatabaseDowngradeDelete,
  );
}
