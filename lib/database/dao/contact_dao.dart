import 'package:sqflite/sqflite.dart';
import 'package:bytebank/database/app_database.dart';
import 'package:bytebank/models/contacts.dart';

class ContactDao {
  static const String _tableName = 'contacts';
  static const String _tableFiledId = 'id';
  static const String _tableFiledName = 'name';
  static const String _tableFiledAccoutNumber = 'account_number';

  static final String createTableSql = 'CREATE TABLE $_tableName('
      '$_tableFiledId INTEGER PRIMARY KEY, '
      '$_tableFiledName TEXT, '
      '$_tableFiledAccoutNumber INTEGER)';

  Future<int> save(Contact contact) async {
    final Database db = await getDatabase();
    Map<String, dynamic> contactMap = _toMap(contact);
    return db.insert(_tableName, contactMap);
  }

  Future<List<Contact>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tableName);
    List<Contact> contacts = _toList(result);
    return contacts;
  }

  Map<String, dynamic> _toMap(Contact contact) {
    final Map<String, dynamic> contactMap = Map();
    contactMap[_tableFiledName] = contact.name;
    contactMap[_tableFiledAccoutNumber] = contact.accountNumber;
    return contactMap;
  }

  List<Contact> _toList(List<Map<String, dynamic>> result) {
    final List<Contact> contacts = [];
    for (Map<String, dynamic> row in result) {
      final Contact contact = Contact(
        row[_tableFiledId],
        row[_tableFiledName],
        row[_tableFiledAccoutNumber],
      );
      contacts.add(contact);
    }
    return contacts;
  }
}
