import 'dart:convert';
import 'dart:io';

import 'package:daftar_restoran/app/data/model/detail_restaurant_model.dart';
import 'package:daftar_restoran/app/data/model/restaurant_list_model.dart';
import 'package:daftar_restoran/app/data/model/search_restaurant_model.dart';
import 'package:daftar_restoran/app/utils/const.dart';
import 'package:either_dart/either.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

final apiRepository = ApiRepository(client: http.Client());

class ApiRepository{

  final http.Client client;

  ApiRepository({required this.client});

  Future<Either<String, RestaurantListModel?>> getRestaurantList() async{
    try{
      var uri = Uri.https(BASEURL, URL_RESTAURANT_LIST);
      var response = await client.get(uri);
      if(response.statusCode==200){
        return Right(RestaurantListModel.fromJson(jsonDecode(response.body)));
      }else{
        return Left("Data tidak dapat diambil, [${response.statusCode}].");
      }
    }catch(error){
      if(error == "isEmpty"){
        throw "Data Restoran Tidak Tersedia!";
      }
      return const Left(TEXT_NO_CONNECTION);
    }
  }

  Future<Either<String, Restaurants?>> getRandomRestaurant() async{
    try{
      var uri = Uri.https(BASEURL, URL_RESTAURANT_LIST);
      var response = await client.get(uri);
      if(response.statusCode==200){
        var listModel = RestaurantListModel.fromJson(jsonDecode(response.body));
        listModel.restaurants?.shuffle();
        return Right(listModel.restaurants?.first);
      }else{
        return Left("Data tidak dapat diambil, [${response.statusCode}].");
      }
    }on SocketException catch(e){
      if (kDebugMode) {
        print(e);
      }
      return const Left(TEXT_NO_CONNECTION);
    }
  }

  Future<Either<String, DetailRestaurantModel?>> detailRestaurant(String id) async{
    try{
      var uri = Uri.https(BASEURL, "$URL_RESTAURANT_DETAIL/$id");
      var response = await client.get(uri);
      if(response.statusCode==200){
        return Right(DetailRestaurantModel.fromJson(jsonDecode(response.body)));
      }else{
        return Left("Data tidak dapat diambil, [${response.statusCode}].");
      }
    }on SocketException catch(e){
      if (kDebugMode) {
        print(e);
      }
      return const Left(TEXT_NO_CONNECTION);
    }
  }

  Future<Either<String, SearchRestaurantModel?>> searchRestaurant(String text) async{
    try{
      var uri = Uri.https(BASEURL, URL_RESTAURANT_SEARCH, {"q": text});
      var response = await client.get(uri);
      if(response.statusCode==200){
        return Right(SearchRestaurantModel.fromJson(jsonDecode(response.body)));
      }else{
        return Left("Data tidak dapat diambil, [${response.statusCode}].");
      }
    }on SocketException catch(e){
      if (kDebugMode) {
        print(e);
      }
      return const Left(TEXT_NO_CONNECTION);
    }
  }

}