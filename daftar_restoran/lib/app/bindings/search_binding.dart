import 'package:daftar_restoran/app/controller/search/search_controller.dart';
import 'package:get/get.dart';

class SearchBinding extends Bindings {

  @override
  void dependencies() {
    Get.lazyPut<SearchController>(() => SearchController());
  }

}