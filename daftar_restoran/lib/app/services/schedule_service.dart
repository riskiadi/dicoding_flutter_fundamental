import 'dart:isolate';
import 'dart:ui';
import 'package:daftar_restoran/app/data/model/restaurant_list_model.dart';
import 'package:daftar_restoran/app/data/repository/api_repository.dart';
import 'package:daftar_restoran/app/services/notification_service.dart';
import 'package:daftar_restoran/main.dart';

final ReceivePort port = ReceivePort();

class ScheduleService{
  static ScheduleService? _instance;
  static const String _isolateName = 'isolate';
  static SendPort? _uiSendPort;

  ScheduleService._internal(){
    _instance = this;
  }

  factory ScheduleService() => _instance ?? ScheduleService._internal();

  void initializeIsolate(){
    IsolateNameServer.registerPortWithName(port.sendPort, _isolateName);
  }

  static Future<void> callback() async{
    final NotificationService notificationService = NotificationService();
    late Restaurants? res;
    var result = await apiRepository.getRandomRestaurant();
    result.fold((left) => print(left), (right) => res = right);
    await notificationService.showNotification(notificationsPlugin, res);
    _uiSendPort ??= IsolateNameServer.lookupPortByName(_isolateName);
    _uiSendPort?.send(null);
  }
}