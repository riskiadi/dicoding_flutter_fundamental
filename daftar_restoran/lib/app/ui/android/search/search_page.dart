import 'package:daftar_restoran/app/data/repository/api_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 17),
              child: Text("Search", style: TextStyle(fontSize: 30.sp),),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20,),
              child: TextField(
                onChanged: (value) {
                  apiRepository.searchRestaurant(value);
                },
                style: TextStyle(fontSize: 14.sp),
                decoration: InputDecoration(
                  filled: true,
                  border: InputBorder.none,
                  hintText: "Write your favorite restaurant..."
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
