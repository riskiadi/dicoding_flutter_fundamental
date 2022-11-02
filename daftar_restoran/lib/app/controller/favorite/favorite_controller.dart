import 'package:daftar_restoran/app/data/model/detail_restaurant_model.dart';
import 'package:daftar_restoran/app/services/favorite_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoriteController extends GetxController {

  final favoriteService = FavoriteService();

  final _searchTextField = TextEditingController();
  final _restaurantList = <Restaurant>[].obs;
  final _errorMessage = RxnString();

  TextEditingController get searchTextField => _searchTextField;

  set searchTextField(value) {
    _searchTextField.value = value;
  }

  get errorMessage => _errorMessage.value;

  set errorMessage(value) {
    _errorMessage.value = value;
  }

  List<Restaurant> get restaurantList => _restaurantList;

  set restaurantList(value) {
    _restaurantList.value = value;
  }

  @override
  void onInit() {
    getFavoriteList();
    super.onInit();
  }

  Future<void> getFavoriteList() async{
    restaurantList = await favoriteService.getRestaurants();
  }

}