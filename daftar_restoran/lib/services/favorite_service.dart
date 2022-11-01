import 'package:daftar_restoran/app/data/model/detail_restaurant_model.dart';
import 'package:daftar_restoran/app/utils/const.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

final favoriteService = FavoriteService();

class FavoriteService{

  static late Database _database;
  static FavoriteService? _databaseHelper;

  FavoriteService._internal(){
    _databaseHelper = this;
  }

  factory FavoriteService() => _databaseHelper ?? FavoriteService._internal();

  Future<Database> _initializeDb() async{
    var path = await getDatabasesPath();
    var db = openDatabase(
        join(path, SQL_DB_NAME),
        onCreate: (db, version) async {
          await db.execute(
              '''
            CREATE TABLE $SQL_TABLE_NAME (
              id TEXT PRIMARY KEY,
              name TEXT,
              description TEXT,
              pictureId TEXT,
              city TEXt,
              rating DOUBLE
            )
          '''
          );
        },
        version: 1
    );

    return db;
  }

  Future<Database> get database async{
    _database = await _initializeDb();
    return _database;
  }

  Future<void> addToFavorite(Restaurant restaurant) async{
    final Database db = await database;
    await db.insert(SQL_TABLE_NAME, restaurant.toJson());
  }

  Future<List<Restaurant>> getRestaurants() async{
    final Database db = await database;
    List<Map<String, dynamic>> results = await db.query(SQL_TABLE_NAME);
    return results.map((restaurant) => Restaurant.fromJson(restaurant)).toList();
  }

  Future<Restaurant> getRestaurantById(String id) async{
    final Database db = await database;
    List<Map<String, dynamic>> results = await db.query(
        SQL_TABLE_NAME,
        where: 'id = ?',
        whereArgs: [id]
    );

    if(results.isEmpty){
      throw "NotFound";
    }else{
      return results.map((res) => Restaurant.fromJson(res)).first;
    }
  }

  Future<void> deleteFavorite(String id) async{
    final db = await database;
    await db.delete(
        SQL_TABLE_NAME,
        where: 'id = ?',
        whereArgs: [id]
    );
  }

  Future<bool> isFavorite(String id) async{
    try{
      await getRestaurantById(id);
      return true;
    }catch(error){
      return false;
    }
  }

}