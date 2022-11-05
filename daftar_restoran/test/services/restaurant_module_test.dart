import 'package:daftar_restoran/app/data/model/detail_restaurant_model.dart';
import 'package:daftar_restoran/app/data/model/restaurant_list_model.dart';
import 'package:daftar_restoran/app/data/repository/api_repository.dart';
import 'package:daftar_restoran/app/utils/const.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/mockito.dart';

import 'restaurant_module_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {

  test('returns RestaurantListModel if the http call complete successfully', () async {
    final client = MockClient();
    when(client.get(Uri.parse('https://$BASEURL$URL_RESTAURANT_LIST'))).thenAnswer((realInvocation) async => http.Response(
        '''
        {
          "error": false,
          "message": "success",
          "restaurants": [
            {
              "id": "1", "name": "mock", "description": "mock", 
              "pictureId": "1", "city": "mock", "rating": 5.0
            },
            {
              "id": "2", "name": "mock", "description": "mock", 
              "pictureId": "2", "city": "mock", "rating": 5.0
            }
          ]
        }
      ''', 200));

    var restaurants = await ApiRepository(client: client).getRestaurantList();
    expect(restaurants.runtimeType, Right<String, RestaurantListModel?>);
  });

  test('return DetailRestaurantModel if the http call complete successfully', () async {
    final client = MockClient();
    when(client.get(Uri.parse('https://$BASEURL$URL_RESTAURANT_DETAIL/rqdv5juczeskfw1e867')))
        .thenAnswer((realInvocation) async => http.Response('''
        {
          "error": false,
          "message": "success",
          "restaurant": {
              "id": "1",
              "name": "mock",
              "description": "mock",
              "city": "mock",
              "address": "mock",
              "pictureId": "1",
              "categories": [ { "name": "mock 1" }, { "name": "mock 2" } ],
              "menus": {
                  "foods": [ { "name": "Mock 1" }, { "name": "Mock 2" } ],
                  "drinks": [ { "name": "Mock 2" }, { "name": "Mock 2" } ]
              },
              "rating": 5.0,
              "customerReviews": [
                { "name": "Mock", "review": "Mock", "date": "Mock" }
              ]
          }
      }
      ''', 200));

    var restaurant = await ApiRepository(client: client).detailRestaurant("rqdv5juczeskfw1e867");
    expect(restaurant.runtimeType, Right<String, DetailRestaurantModel?>);
  });

}
