import 'package:daftar_restoran/app/data/model/detail_restaurant_model.dart';
import 'package:daftar_restoran/app/data/model/restaurant_list_model.dart';
import 'package:daftar_restoran/app/data/repository/api_repository.dart';
import 'package:daftar_restoran/app/routes/app_routes.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {

  final _restaurantListModel = RestaurantListModel().obs;
  final _detailRestaurantModel = DetailRestaurantModel().obs;
  final _selectedRestaurantIndex = 0.obs;
  final _errorMessage = RxnString();

  RestaurantListModel get restaurantListModel => _restaurantListModel.value;

  set restaurantListModel(value) {
    _restaurantListModel.value = value;
  }

  get errorMessage => _errorMessage.value;

  set errorMessage(value) {
    _errorMessage.value = value;
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
    var either = await apiRepository.getRestaurantList();
    either.fold(
      (left) => errorMessage = left,
      (right) => restaurantListModel = right,
    );
  }

  goToDetailByIndex(int index) async{
    selectedRestaurantIndex = index;
    var result = await apiRepository.detailRestaurant(restaurantListModel.restaurants![index].id??"0");
    result.fold((left) => print(left), (right) => detailRestaurantModel = right);
    Get.toNamed(Routes.DETAIL);
  }

  goToDetailBySearch(String id) async{
    var result = await apiRepository.detailRestaurant(id);
    result.fold((left) => print(left), (right) => detailRestaurantModel = right);
    Get.toNamed(Routes.DETAIL);
  }

}
