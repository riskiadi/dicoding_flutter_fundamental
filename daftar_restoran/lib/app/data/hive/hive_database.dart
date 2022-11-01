import 'package:daftar_restoran/app/data/model/detail_restaurant_model.dart';
import 'package:hive/hive.dart';

final hiveDatabase = HiveDatabase();

class HiveDatabase {

  addFavorite(Restaurant restaurant) async{
    var box = Hive.box('hive_database');
    await box.put(restaurant.id, restaurant);
  }

  deleteFavorite(Restaurant restaurant) async{
    var hive = await Hive.openBox('hive_database');
    await hive.delete(restaurant.id);
  }

}
