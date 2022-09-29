import 'dart:convert';

import 'package:daftar_restoran/app/data/model/database.dart';
import 'package:daftar_restoran/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {

  final _localRestaurant = LocalRestaurant().obs;
  final _selectedRestaurantIndex = 0.obs;

  LocalRestaurant get localRestaurant => _localRestaurant.value;

  set localRestaurant(value) {
    _localRestaurant.value = value;
  }

  int get selectedRestaurantIndex => _selectedRestaurantIndex.value;

  set selectedRestaurantIndex(value) {
    _selectedRestaurantIndex.value = value;
  }

  @override
  void onInit() {
    _loadDataRestaurant();
    super.onInit();
  }

  _loadDataRestaurant() async{
    if (Get.context != null){
      var json  =  await DefaultAssetBundle.of(Get.context!).loadString("assets/json/local_restaurant.json");
      localRestaurant = LocalRestaurant.fromJson(jsonDecode(json));
    }
  }

  goToDetail(int index){
    selectedRestaurantIndex = index;
    Get.toNamed(Routes.DETAIL);
  }

}
