import 'dart:io';

import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:daftar_restoran/app/routes/app_pages.dart';
import 'package:daftar_restoran/app/routes/app_routes.dart';
import 'package:daftar_restoran/app/services/notification_service.dart';
import 'package:daftar_restoran/app/services/schedule_service.dart';
import 'package:daftar_restoran/app/utils/datetime_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

final FlutterLocalNotificationsPlugin notificationsPlugin = FlutterLocalNotificationsPlugin();

void main() async{
  await GetStorage.init();

  WidgetsFlutterBinding.ensureInitialized();

  final NotificationService _notificationService = NotificationService();
  final ScheduleService _reminderService = ScheduleService();

  _reminderService.initializeIsolate();

  if(Platform.isAndroid){
    await AndroidAlarmManager.initialize();
    final box = GetStorage();
    final isEnableNotification = box.read("notification") ?? false;
    if(isEnableNotification){
      print("enable");
      await AndroidAlarmManager.periodic(
        const Duration(hours: 24),
        1,
        ScheduleService.callback,
        startAt: DateTimeHelper.format(),
        exact: true,
        wakeup: true,
      );
    }else{
      print("disable");
      await AndroidAlarmManager.cancel(1);
    }
  }

  await _notificationService.initNotifications(notificationsPlugin);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) => GetMaterialApp(
        builder: EasyLoading.init(
          builder: BotToastInit()
        ),
        title: 'Restaurant Discovery',
        defaultTransition: Transition.fade,
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.INITIAL,
        getPages: AppPages.pages,
        navigatorObservers: [
          HeroController(),
          BotToastNavigatorObserver(),
        ],
        theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme()),
      ),
    );
  }
}
