import 'package:daftar_restoran/app/data/model/search_restaurant_model.dart';
import 'package:daftar_restoran/app/data/repository/api_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SearchController extends GetxController{

  final _searchTextField = TextEditingController();
  final _loadStatus = RxStatus.empty().obs;
  final _searchModel = SearchRestaurantModel().obs;
  final _errorMessage = RxnString();

  TextEditingController get searchTextField => _searchTextField;

  set searchTextField(value) {
    _searchTextField.value = value;
  }

  RxStatus get loadStatus => _loadStatus.value;

  set loadStatus(value) {
    _loadStatus.value = value;
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
    loadStatus = RxStatus.loading();
    final result = await apiRepository.searchRestaurant(searchTextField.text);
    loadStatus = RxStatus.success();
    result.fold(
      (left) => errorMessage = left,
      (right){
        errorMessage = null;
        searchModel = right;
      }
    );
  }
}