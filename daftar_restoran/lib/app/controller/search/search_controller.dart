import 'package:daftar_restoran/app/data/model/search_restaurant_model.dart';
import 'package:daftar_restoran/app/data/repository/api_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class SearchController extends GetxController{

  final _searchTextField = TextEditingController();
  final _searchModel = SearchRestaurantModel().obs;
  final _errorMessage = RxnString();

  TextEditingController get searchTextField => _searchTextField;

  set searchTextField(value) {
    _searchTextField.value = value;
  }

  SearchRestaurantModel get searchModel => _searchModel.value;

  set searchModel(value) {
    _searchModel.value = value;
  }

  get errorMessage => _errorMessage.value;

  set errorMessage(value) {
    _errorMessage.value = value;
  }

  void searchQuery() async {
    if(searchTextField.text.isEmpty) return;
    EasyLoading.show(status: "Loading");
    final result = await apiRepository.searchRestaurant(searchTextField.text);
    EasyLoading.dismiss();
    result.fold(
      (left) => errorMessage = left,
      (right){
        errorMessage = null;
        searchModel = right;
      }
    );
  }
}