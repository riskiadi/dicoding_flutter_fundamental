import 'package:cached_network_image/cached_network_image.dart';
import 'package:daftar_restoran/app/controller/home/home_controller.dart';
import 'package:daftar_restoran/app/utils/const.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DetailPage extends GetView<HomeController> {
  DetailPage({Key? key}) : super(key: key);

  final _controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    var restaurant = _controller.detailRestaurantModel?.restaurant;
    _controller.checkIsFavorite(restaurant?.id ?? "0");

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            Stack(
              children: [
                CachedNetworkImage(
                  imageUrl: "$URL_RESTAURANT_BANNER${restaurant?.pictureId}",
                  width: double.infinity,
                  height: 250.h,
                  fit: BoxFit.cover,
                ),
                Container(
                  margin: const EdgeInsets.only(left: 20, top: 40),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(6),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.14),
                        blurRadius: 5,
                        spreadRadius: 0.5,
                      )
                    ],
                  ),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 5,
                    vertical: 5,
                  ),
                  child: InkWell(
                    onTap: () => Get.back(),
                    child: const Icon(
                      FluentIcons.arrow_left_24_filled,
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: Container(
                    height: 120,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                        colors: [
                          Colors.black.withOpacity(0.8),
                          Colors.black.withOpacity(0),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  left: 0,
                  child: Container(
                    width: 1.sw,
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                restaurant?.name ?? "",
                                style: TextStyle(
                                  fontSize: 27.sp,
                                  color: Colors.white,
                                  shadows: [
                                    Shadow(
                                      color: Colors.black.withOpacity(0.6),
                                      blurRadius: 15,
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(width: 20),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 10),
                              child: Obx(() => IconButton(
                                icon: _controller.isFavorite ?
                                Icon(FluentIcons.heart_28_filled, color: Colors.pink, size: 30.sp,) :
                                Icon(FluentIcons.heart_28_regular, color: Colors.pink, size: 30.sp,),
                                onPressed: () {
                                  if (_controller.isFavorite){
                                    if (restaurant != null) _controller.deleteFavorite(restaurant);
                                  }else{
                                    if (restaurant != null) _controller.addFavorite(restaurant);
                                  }
                                },
                              ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  FluentIcons.location_12_filled,
                                  size: 14.sp,
                                  color: Colors.white,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  restaurant?.city ?? "",
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                            const SizedBox(width: 10),
                            Row(
                              children: [
                                Icon(
                                  FluentIcons.star_12_filled,
                                  size: 14.sp,
                                  color: Colors.white,
                                ),
                                const SizedBox(width: 5),
                                Text(
                                  restaurant?.rating?.toStringAsFixed(2) ?? "",
                                  style: const TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: Colors.white,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "About",
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Text(
                              restaurant?.description ?? "",
                              textAlign: TextAlign.justify,
                              style: TextStyle(fontSize: 13.sp),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Food Menu",
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 5),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: List.generate(
                                restaurant?.menus?.foods?.length ?? 0,
                                    (index) =>
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 1),
                                      child: Text(
                                        restaurant?.menus?.foods?[index].name ??
                                            "",
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(fontSize: 13.sp),
                                      ),
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Drink Menu",
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(height: 5),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: List.generate(
                                restaurant?.menus?.drinks?.length ?? 0,
                                    (index) =>
                                    Container(
                                      margin: const EdgeInsets.symmetric(
                                          vertical: 1),
                                      child: Text(
                                        restaurant?.menus?.drinks?[index]
                                            .name ?? "",
                                        textAlign: TextAlign.justify,
                                        style: TextStyle(fontSize: 13.sp),
                                      ),
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
