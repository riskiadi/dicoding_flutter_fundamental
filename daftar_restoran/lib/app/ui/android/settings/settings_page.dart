import 'package:daftar_restoran/app/controller/settings/settings_controller.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SettingsController>();
    return SafeArea(
      child: Scaffold(
        body: Obx(
          () => SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 17),
                  child: Row(
                    children: [
                      Transform.scale(
                        scale: 0.8,
                        child: IconButton(
                          onPressed: () => Get.back(),
                          icon: Icon(
                            FluentIcons.arrow_left_24_regular,
                            size: 28.sp,
                          ),
                        ),
                      ),
                      Text(
                        "Settings",
                        style: TextStyle(fontSize: 30.sp),
                      )
                    ],
                  ),
                ),

                ListTile(
                  title: Text("Restaurant Notification"),
                  subtitle: Text("enable reminder"),
                  trailing: Switch(value: controller.isEnableNotification, onChanged: (value) => controller.toogleSwitch(),),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
