import 'package:daftar_restoran/app/bindings/home_binding.dart';
import 'package:daftar_restoran/app/bindings/search_binding.dart';
import 'package:daftar_restoran/app/routes/app_routes.dart';
import 'package:daftar_restoran/app/ui/android/detail/detail_page.dart';
import 'package:daftar_restoran/app/ui/android/home/home_page.dart';
import 'package:daftar_restoran/app/ui/android/search/search_page.dart';
import 'package:get/get.dart';

class AppPages{

  static final pages = [
    GetPage(
      name: Routes.INITIAL,
      page: () => HomePage(),
      binding: HomeBinding(),
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: Routes.HOME,
      page: () => HomePage(),
      binding: HomeBinding(),
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: Routes.DETAIL,
      page: () => DetailPage(),
      binding: HomeBinding(),
      transition: Transition.circularReveal,
    ),
    GetPage(
      name: Routes.SEARCH,
      page: () => SearchPage(),
      binding: SearchBinding(),
      transition: Transition.circularReveal,
    ),
  ];

}