import 'package:daftar_restoran/app/routes/app_pages.dart';
import 'package:daftar_restoran/app/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
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
        title: 'Restaurant Discovery',
        defaultTransition: Transition.fade,
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.INITIAL,
        getPages: AppPages.pages,
        navigatorObservers: [
          HeroController(),
        ],
        theme: ThemeData(
            textTheme: GoogleFonts.poppinsTextTheme()
        ),
      ),
    );
  }
}