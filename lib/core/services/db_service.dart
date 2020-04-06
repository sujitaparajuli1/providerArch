import 'dart:io';
import 'package:archprovider/core/constants/app_contstants.dart';
import 'package:archprovider/core/models/user.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbService{
  Database db;
  DbService(){
    _init();
  }
  void _init() async{
    Directory directory= await getApplicationDocumentsDirectory();
String path= join(directory.path,AppConstants.DB_NAME);
db= await openDatabase(
  path,
  version:1,
  onCreate:(Database newDb, int newVersion){
    Batch batch=newDb.batch();
     batch.execute("""
            CREATE TABLE ${AppConstants.USER_TABLE}
            (
              id INTEGER PRIMARY KEY,
              name TEXT,
              username TEXT
            )
          """);
    batch.commit();
  }
);
  }
  Future <User> fetchUser()async 
  {
  final data = await db.query(AppConstants.USER_TABLE);
  if(data.length<1){
    return null;
  }
  return User.fromJson(data.first);
}
Future<int> insertUser(User user)
{
 return db.insert(AppConstants.USER_TABLE, user.toJson(),
 conflictAlgorithm: ConflictAlgorithm.replace
 );
}
}
