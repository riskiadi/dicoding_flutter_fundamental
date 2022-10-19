import 'dart:convert';

import 'package:daftar_restoran/app/data/model/detail_restaurant_model.dart';
import 'package:daftar_restoran/app/data/model/restaurant_list_model.dart';
import 'package:daftar_restoran/app/data/model/search_restaurant_model.dart';
import 'package:daftar_restoran/app/utils/const.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

final apiRepository = ApiRepository();

class ApiRepository{

  Future<RestaurantListModel?> getRestaurantList() async{
    try{
      var uri = Uri.https(BASEURL, URL_RESTAURANT_LIST);
      print(uri);
      var response = await http.get(uri);
      return RestaurantListModel.fromJson(jsonDecode(response.body));
    }catch(e){
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
  }

  Future<DetailRestaurantModel?> detailRestaurant(String id) async{
    try{
      var uri = Uri.https(BASEURL, "$URL_RESTAURANT_DETAIL/$id");
      var response = await http.get(uri);
      return DetailRestaurantModel.fromJson(jsonDecode(response.body));
    }catch(e){
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
  }

  Future<SearchRestaurantModel?> searchRestaurant(String text) async{
    try{
      var uri = Uri.https(BASEURL, "$URL_RESTAURANT_SEARCH$text");
      var response = await http.get(uri);
      return SearchRestaurantModel.fromJson(jsonDecode(response.body));
    }catch(e){
      if (kDebugMode) {
        print(e);
      }
      return null;
    }
  }

}