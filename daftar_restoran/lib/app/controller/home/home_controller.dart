import 'package:bot_toast/bot_toast.dart';
import 'package:daftar_restoran/app/data/model/detail_restaurant_model.dart';
import 'package:daftar_restoran/app/data/model/restaurant_list_model.dart';
import 'package:daftar_restoran/app/data/repository/api_repository.dart';
import 'package:daftar_restoran/app/routes/app_routes.dart';
import 'package:daftar_restoran/app/services/favorite_service.dart';
import 'package:daftar_restoran/app/services/notification_service.dart';
import 'package:daftar_restoran/main.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {

  final NotificationService notificationService = NotificationService();
  final favoriteService = FavoriteService();

  final _restaurantListModel = RestaurantListModel().obs;
  final _detailRestaurantModel = DetailRestaurantModel().obs;
  final _selectedRestaurantIndex = 0.obs;
  final _errorMessage = RxnString();
  final _loadingStatus = RxStatus.empty().obs;
  final _isFavorite = false.obs;

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

  RxStatus get loadingStatus => _loadingStatus.value;

  set loadingStatus(value) {
    _loadingStatus.value = value;
  }

  bool get isFavorite => _isFavorite.value;

  set isFavorite(value) {
    _isFavorite.value = value;
  }

  @override
  void onInit() {
    _initializationValue();
    super.onInit();
  }

  _initializationValue() async{
    notificationService.configureSelectNotificationSubject(Routes.DETAIL);
    EasyLoading.show(status: "Loading");
    var either = await apiRepository.getRestaurantList();
    EasyLoading.dismiss();
    loadingStatus = RxStatus.success();
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

  Future<void> checkIsFavorite(String id) async{
    isFavorite = await favoriteService.checkIsFavorite(id);
  }

  addFavorite(Restaurant? restaurant) async{
    if(restaurant!=null) await favoriteService.addToFavorite(restaurant);
    isFavorite = await favoriteService.checkIsFavorite(restaurant?.id??"0");
    BotToast.showSimpleNotification(title: "Favorite", subTitle: "Berhasil menambahkan ke favorite.", duration: Duration(seconds: 4));
  }

  deleteFavorite(Restaurant? restaurant) async{
    callbackX();
    if(restaurant!=null) await favoriteService.deleteFavoriteRestaurant(restaurant);
    isFavorite = await favoriteService.checkIsFavorite(restaurant?.id??"0");
  }

  Future<void> callbackX() async{
    final NotificationService notificationService = NotificationService();
    late Restaurants? res;
    var result = await apiRepository.getRandomRestaurant();
    result.fold((left) => print(left), (right) => res = right);
    await notificationService.showNotification(notificationsPlugin, res);
  }

}
