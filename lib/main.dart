import 'package:car_app/main_page/main_page_widgets.dart';
import 'package:car_app/product_list.dart';
import 'package:car_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Car App',
        theme: themeData,
        home: const HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 25.0, left: 35, right: 35),
              child: Text(
                "Featured",
                style: textStyle.copyWith(fontSize: 45, color: textColor),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 35, right: 35),
              child: Text(
                "6,046 Car for Sale in USA",
                style: textStyle.copyWith(fontSize: 25, color: textColor2),
              ),
            ),
            const SearchBarWidget(),
            SizedBox(
                height: 38.h,
                child: ListView.builder(
                    itemCount: cars.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) =>
                        CarCard(car: cars[index]))),
            const RecommendList()
          ],
        ),
      ),
    );
  }
}

class RecommendList extends StatelessWidget {
  const RecommendList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.only(left: 35, right: 35),
        width: double.infinity,
        margin: const EdgeInsets.only(top: 10),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
        ),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 25.0,
              ),
              child: Text(
                "Recommended",
                style: textStyle.copyWith(fontSize: 16.sp, color: textColor),
              ),
            ),
            CarCard(
              car: recommendedCar,
            ),
          ],
        ),
      ),
    );
  }
}
