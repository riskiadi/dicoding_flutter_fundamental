import 'package:cached_network_image/cached_network_image.dart';
import 'package:daftar_restoran/app/controller/home/home_controller.dart';
import 'package:daftar_restoran/app/utils/const.dart';
import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';

class HomePage extends GetView<HomeController> {
  HomePage({Key? key}) : super(key: key);

  final _controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: HexColor("#F9F9F9"),
        body: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Discover",
                    style: TextStyle(
                        fontSize: 25.sp, fontWeight: FontWeight.bold,),
                  ),
                  Text(
                    "Recomendation viral restaurant",
                    style: TextStyle(
                      fontSize: 13.sp,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 20,),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Obx(
                    () => Padding(
                      padding: const EdgeInsets.symmetric(vertical: 15,),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: List.generate(
                          _controller.localRestaurant.restaurants?.length ?? 0,
                          (index) {
                            var restaurant = _controller.localRestaurant.restaurants?[index];
                            return Container(
                              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 5,),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(19),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black.withOpacity(0.1),
                                        blurRadius: 4,
                                        spreadRadius: 1,)
                                  ]),
                              child: Material(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(19),
                                child: InkWell(
                                  onTap: () => _controller.goToDetail(index),
                                  borderRadius: BorderRadius.circular(19),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(19),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        CachedNetworkImage(
                                            imageUrl: restaurant?.pictureId ?? "",
                                            width: double.infinity,
                                            height: 160.h,
                                            fit: BoxFit.cover,
                                        ),
                                        Container(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 10, horizontal: 15,
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                restaurant?.name ?? "",
                                                style: TextStyle(
                                                    fontSize: 18.sp,
                                                    fontWeight: FontWeight.bold),
                                              ),
                                              const SizedBox(height: 3),
                                              Row(
                                                children: [
                                                  Icon(
                                                      FluentIcons.location_12_filled,
                                                      size: 14.sp,
                                                  ),
                                                  const SizedBox(width: 5),
                                                  Text(restaurant?.city ?? "",),
                                                ],
                                              ),
                                              const SizedBox(height: 10),
                                              Row(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Icon(
                                                              FluentIcons.food_20_regular,
                                                              size: 19.sp,
                                                          ),
                                                          const SizedBox(width: 3),
                                                          Text(
                                                              restaurant?.menus?.foods?.length.toString() ?? "",
                                                              style: TextStyle(fontSize: 17.sp,),
                                                          ),
                                                        ],
                                                      ),
                                                      const SizedBox(width: 15),
                                                      Row(
                                                        children: [
                                                          Icon(
                                                              FluentIcons.drink_wine_20_regular,
                                                              size: 19.sp,
                                                          ),
                                                          const SizedBox(width: 3),
                                                          Text(
                                                              restaurant?.menus?.drinks?.length.toString() ?? "",
                                                              style: TextStyle(
                                                                  fontSize: 17.sp,
                                                              ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                    children: [
                                                      Container(
                                                        padding: const EdgeInsets.symmetric(
                                                                horizontal: 5,
                                                                vertical: 5,
                                                        ),
                                                        child: Baseline(
                                                            baseline: 15,
                                                            baselineType:
                                                                TextBaseline.alphabetic,
                                                            child: Text(restaurant?.rating?.toStringAsFixed(1) ?? "",
                                                              style: TextStyle(
                                                                fontSize: 13.sp,
                                                                color: hexStarColor,
                                                                height: 1.1,
                                                              ),
                                                              softWrap: true,
                                                            ),
                                                        ),
                                                      ),
                                                      RatingBar(
                                                        initialRating: restaurant?.rating?.toDouble() ?? 0,
                                                        minRating: 0,
                                                        maxRating: 5,
                                                        itemSize: 17.sp,
                                                        itemCount: 5,
                                                        ignoreGestures: true,
                                                        allowHalfRating: true,
                                                        ratingWidget: RatingWidget(
                                                          half: Icon(
                                                              FluentIcons.star_half_12_regular,
                                                              color: hexStarColor,
                                                          ),
                                                          full: Icon(
                                                              FluentIcons.star_12_filled,
                                                              color: hexStarColor,
                                                          ),
                                                          empty: Icon(FluentIcons.star_12_regular,
                                                              color: hexStarColor,
                                                          ),
                                                        ),
                                                        onRatingUpdate: (_) {},
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
