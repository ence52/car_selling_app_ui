import 'package:car_app/main_page/main_page_widgets.dart';
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
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        key: scaffoldKey,
        floatingActionButton: SizedBox(
          height: 70,
          width: 70,
          child: FloatingActionButton(
            backgroundColor: textPinkColor,
            onPressed: () {},
            child: const Icon(
              Icons.add,
              size: 35,
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: _createNavigationBar(),
        body: _createMainColumn(),
      ),
    );
  }

  Column _createMainColumn() {
    return Column(
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
        const CarCardScroll(),
        const RecommendList()
      ],
    );
  }

  NavigationBar _createNavigationBar() {
    return NavigationBar(
      backgroundColor: Colors.white,
      shadowColor: Colors.black,
      elevation: 20,
      height: 8.h,
      destinations: [
        Icon(
          Icons.home,
          size: 18.sp,
          color: selectedButtomBarIconColor,
        ),
        Icon(
          Icons.chat_bubble_rounded,
          size: 18.sp,
          color: buttomBarIconColor,
        ),
        Icon(
          Icons.list_alt,
          size: 18.sp,
          color: buttomBarIconColor,
        ),
        Icon(
          Icons.person,
          size: 18.sp,
          color: buttomBarIconColor,
        ),
      ],
    );
  }
}
