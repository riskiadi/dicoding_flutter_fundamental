import 'package:daftar_restoran/app/controller/favorite/favorite_controller.dart';
import 'package:daftar_restoran/app/controller/home/home_controller.dart';
import 'package:get/get.dart';

class FavoriteBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FavoriteController());
    Get.lazyPut(() => HomeController());
  }
}