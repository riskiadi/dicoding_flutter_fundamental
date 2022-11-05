import 'package:cached_network_image/cached_network_image.dart';
import 'package:daftar_restoran/app/controller/home/home_controller.dart';
import 'package:daftar_restoran/app/controller/search/search_controller.dart';
import 'package:daftar_restoran/app/utils/const.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SearchPage extends GetView<SearchController> {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<SearchController>();
    final homeController = Get.find<HomeController>();

    return SafeArea(
      child: Scaffold(
        body: Obx(
          () => SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 17),
                  child: Row(
                    children: [
                      Transform.scale(
                        scale: 0.8,
                        child: IconButton(
                          onPressed: () => Get.back(),
                          icon: Icon(FluentIcons.arrow_left_24_regular,
                              size: 28.sp),
                        ),
                      ),
                      Text(
                        "Search",
                        style: TextStyle(fontSize: 30.sp),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: TextField(
                    controller: controller.searchTextField,
                    onChanged: (value) => controller.searchQuery(),
                    style: TextStyle(fontSize: 14.sp),
                    decoration: InputDecoration(
                      filled: true,
                      border: InputBorder.none,
                      hintText: "Write your favorite restaurant...",
                      suffixIcon: Transform.scale(
                        scale: 0.9,
                        child: IconButton(
                          icon: const Icon(Icons.search),
                          onPressed: () => controller.searchQuery(),
                        ),
                      ),
                    ),
                  ),
                ),
                controller.errorMessage != null
                        ? Padding(
                          padding: EdgeInsets.symmetric(vertical: 20.h),
                          child: Center(child: Text(controller.errorMessage)),
                        )
                        : Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            child: controller
                                        .searchModel.restaurantsSearch?.isEmpty ==
                                    true
                                ? Container(
                                    width: 1.sw,
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Icon(FluentIcons.search_info_20_regular,
                                            size: 30.sp),
                                        Text(
                                          "Restaurant name not found.",
                                          style: TextStyle(fontSize: 15.sp),
                                        ),
                                      ],
                                    ),
                                  )
                                : Column(
                                    children: List.generate(
                                        controller.searchModel.restaurantsSearch
                                                ?.length ??
                                            0, (index) {
                                      final restaurant = controller
                                          .searchModel.restaurantsSearch?[index];
                                      return Container(
                                          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10,),
                                          child: InkWell(
                                            onTap: () => homeController.goToDetailBySearch(restaurant?.id ?? "",),
                                            child: ListTile(
                                              contentPadding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 7),
                                              title: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  CachedNetworkImage(
                                                    imageUrl:
                                                        "$URL_RESTAURANT_BANNER${restaurant?.pictureId}",
                                                    width: double.infinity,
                                                    height: 100.h,
                                                    fit: BoxFit.cover,
                                                  ),
                                                  SizedBox(height: 8.h),
                                                  Text(
                                                    restaurant?.name ?? "",
                                                    style: TextStyle(
                                                        fontSize: 16.sp,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                ],
                                              ),
                                              subtitle:
                                                  Text(restaurant?.city ?? ""),
                                              tileColor:
                                                  Colors.black.withAlpha(15),
                                            ),
                                          ));
                                    }),
                                  ),
                          ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
