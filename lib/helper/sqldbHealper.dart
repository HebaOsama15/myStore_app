import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DBManger {
  Database? _db;
  String dbName = "mystore.db";
  int dbVersion = 1;

  /** start table and columns for products table */
  static const String TBL_PRODUCTS = "favorates";
  static const String COL_ID = "id";
  static const String COL_TITLE = "title";
  static const String COL_DESCRIPTION = "description";
  static const String COL_PRICE = "price";
  static const String COL_CATEGORY = "category";
  static const String COL_IMAGE = "image";

  Future<Database> get dbObject async {
    print("db is null");
    if (_db == null) {
      _db = await initDatabase();
    }
    ;
    print("not nul");
    return _db!;
  }

  Future<Database> initDatabase() async {
    String dbFolder = await getDatabasesPath();
    String dbPath = join(dbFolder, dbName);

    return await openDatabase(dbPath, version: dbVersion, onCreate: (db, v) {
      db.execute("""
      create table if not exists $TBL_PRODUCTS (
      $COL_ID integer primary key autoincrement,
      $COL_TITLE varchar(255) not null,
      $COL_DESCRIPTION text not null,
      $COL_CATEGORY varchar(255) not null,
      $COL_IMAGE varchar(255) not null,
      $COL_PRICE double not null
      )
      """);
    });
  }

  //add to table 
  Future<int> insert(String tbl_name, Map<String, dynamic> row,
    {String? mainTable_id = null, List<Map<String, dynamic>>? sub_rows = null}) async {
  Database localDB = await dbObject;

  // Remove the 'id' key from the row map if it's present
  if (row.containsKey(DBManger.COL_ID)) {
    row.remove(DBManger.COL_ID);
  }

  int id = await localDB.insert(tbl_name, row);

  sub_rows?.forEach((element) {
    element[mainTable_id!] = id;
  });

  return id;
}
  // Future<int> insert(String tbl_name, Map<String, dynamic> row,
  //     {
  //       String? mainTable_id = null,
  //     List<Map<String, dynamic>>? sub_rows = null}) async {
  //   int id = -1;

  //   Database localDB = await dbObject;

  //   id = await localDB.insert(tbl_name, row);
  //   sub_rows!.forEach((element) {
  //     id = element[mainTable_id!];
  //   });
  //   return await id;
  // }

  /** delete from table */
  Future<int> delete(String sql) async {
    Database localDB = await dbObject;
    return localDB.rawDelete(sql);
  }

  /** get from table */
  Future<List<Map<String, dynamic>>> fetch(String sql) async {
    Database localDB = await dbObject;
    return localDB.rawQuery(sql);
  }
}
