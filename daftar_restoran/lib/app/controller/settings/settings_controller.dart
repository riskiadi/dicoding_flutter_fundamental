import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:daftar_restoran/app/services/schedule_service.dart';
import 'package:daftar_restoran/app/utils/datetime_helper.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SettingsController extends GetxController {

  final box = GetStorage();

  final _isScheduled = false.obs;
  final _isEnableNotification = false.obs;

  bool get isEnableNotification => _isEnableNotification.value;

  set isEnableNotification(value) {
    _isEnableNotification.value = value;
  }

  bool get isScheduled => _isScheduled.value;

  set isScheduled(value) {
    _isScheduled.value = value;
  }

  @override
  void onInit() {
    isEnableNotification = box.read("notification") ?? false;
    _checkSettings();
    super.onInit();
  }

  toogleSwitch() async{
    isEnableNotification = !isEnableNotification;
    box.write("notification", isEnableNotification);
    _checkSettings();
  }

  _checkSettings() async{
    if(isEnableNotification){
      return await AndroidAlarmManager.periodic(
        const Duration(hours: 24),
        1,
        ScheduleService.callback,
        startAt: DateTimeHelper.format(),
        exact: true,
        wakeup: true,
      );
    }else{
      return await AndroidAlarmManager.cancel(1);
    }
  }

}