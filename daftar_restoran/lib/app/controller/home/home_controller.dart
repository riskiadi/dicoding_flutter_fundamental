import 'package:daftar_restoran/app/data/model/detail_restaurant_model.dart';
import 'package:daftar_restoran/app/data/model/restaurant_list_model.dart';
import 'package:daftar_restoran/app/data/repository/api_repository.dart';
import 'package:daftar_restoran/app/routes/app_routes.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {

  final _restaurantListModel = RestaurantListModel().obs;
  final _detailRestaurantModel = DetailRestaurantModel().obs;
  final _selectedRestaurantIndex = 0.obs;

  RestaurantListModel get restaurantListModel => _restaurantListModel.value;

  set restaurantListModel(value) {
    _restaurantListModel.value = value;
  }

  int get selectedRestaurantIndex => _selectedRestaurantIndex.value;

  DetailRestaurantModel? get detailRestaurantModel => _detailRestaurantModel.value;

  set detailRestaurantModel(value) {
    _detailRestaurantModel.value = value;
  }

  set selectedRestaurantIndex(value) {
    _selectedRestaurantIndex.value = value;
  }

  @override
  void onInit() {
    _initializationValue();
    super.onInit();
  }

  _initializationValue() async{
    restaurantListModel = await apiRepository.getRestaurantList();
  }

  goToDetail(int index) async{
    selectedRestaurantIndex = index;
    print(restaurantListModel.restaurants![index].id);
    detailRestaurantModel = await apiRepository.detailRestaurant(restaurantListModel.restaurants![index].id??"0");
    Get.toNamed(Routes.DETAIL);
  }

}
