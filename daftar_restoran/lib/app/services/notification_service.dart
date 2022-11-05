import 'dart:convert';
import 'package:daftar_restoran/app/controller/home/home_controller.dart';
import 'package:daftar_restoran/app/data/model/detail_restaurant_model.dart';
import 'package:daftar_restoran/app/data/model/restaurant_list_model.dart';
import 'package:daftar_restoran/app/routes/app_routes.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:rxdart/rxdart.dart';

final selectNotificationSubject = BehaviorSubject<String>();

class NotificationService{
  static NotificationService? _instance;

  NotificationService._internal(){
    _instance = this;
  }

  factory NotificationService() => _instance ?? NotificationService._internal();

  Future<void> initNotifications(FlutterLocalNotificationsPlugin plugin) async{
    var initializationSettingAndroid = const AndroidInitializationSettings(
      'app_icon'
    );

    var initializationSettingIos = const IOSInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false
    );

    var initializationSettings = InitializationSettings(
      android: initializationSettingAndroid,
      iOS: initializationSettingIos,
    );

    await plugin.initialize(
      initializationSettings,
      onSelectNotification: (String? payload) async{
        selectNotificationSubject.add(payload ?? 'empty payload');
      }
    );
  }

  Future<void> showNotification(
    FlutterLocalNotificationsPlugin plugin,
      Restaurants? restaurant
  ) async{

    var _channelId = "1";
    var _channelName = "channel_$_channelId";
    var _channelDescription = 'daily restaurant channel';

    var iosPlatformChannelSpecifics = const IOSNotificationDetails();
    var androidPlatformChannelSpecifics = AndroidNotificationDetails(
      _channelId,
      _channelName,
      channelDescription: _channelDescription,
      importance: Importance.max,
      priority: Priority.high,
      ticker: 'ticker',
      styleInformation: const DefaultStyleInformation(true, true)
    );

    var platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iosPlatformChannelSpecifics,
    );

    await plugin.show(
      0,
      restaurant?.name??"-",
      "rekomendasi restoran untukmu!",
      platformChannelSpecifics,
      payload: jsonEncode(restaurant?.toJson())
    );
  }

  void configureSelectNotificationSubject(String route){
    selectNotificationSubject.stream.listen((String payload) async {

      var restaurant = Restaurant.fromJson(jsonDecode(payload));
      var homeController = Get.put(HomeController());
      homeController.goToDetailBySearch(restaurant.id??"0");
      // Get.toNamed(Routes.DETAIL,arguments: {"id": restaurant.id});
    });
  }

}