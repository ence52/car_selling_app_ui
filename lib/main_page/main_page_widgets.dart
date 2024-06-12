import 'package:car_app/detail_page/detail_view.dart';
import 'package:car_app/product_list.dart';
import 'package:car_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class CarCard extends StatelessWidget {
  const CarCard({
    super.key,
    required this.car,
  });
  final Car car;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailView(car: car),
          )),
      child: AspectRatio(
        aspectRatio: 7 / 6,
        child: Container(
          margin: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                  color: Color.fromARGB(65, 158, 158, 158),
                  offset: Offset(0, 10),
                  blurRadius: 15)
            ],
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 5,
                child: Container(
                    decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(car.image),
                  ),
                )),
              ),
              Expanded(
                flex: 3,
                child: Padding(
                  padding:
                      const EdgeInsets.only(top: 10.0, left: 15, right: 15),
                  child: Wrap(
                    runSpacing: 12,
                    children: [
                      Text(
                        car.title,
                        style: textStyle.copyWith(
                            fontSize: 10.sp,
                            color: textColor,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            car.condition,
                            style: textStyle.copyWith(
                                color: textColor,
                                fontSize: 9.sp,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            "|",
                            style: textStyle.copyWith(
                                color: textColor,
                                fontSize: 9.sp,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            "${car.km} KM",
                            style: textStyle.copyWith(
                                color: textColor,
                                fontSize: 9.sp,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            "|",
                            style: textStyle.copyWith(
                                color: textColor,
                                fontSize: 9.sp,
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            car.transmission,
                            style: textStyle.copyWith(
                                color: textColor,
                                fontSize: 9.sp,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(
                                  colorFilter: ColorFilter.mode(
                                      textPinkColor, BlendMode.srcIn),
                                  fit: BoxFit.cover,
                                  height: 22,
                                  "assets/icons/price_tag.svg"),
                              const SizedBox(
                                width: 3,
                              ),
                              Text("${car.price} USD",
                                  style: textStyle.copyWith(
                                      color: textPinkColor,
                                      fontSize: 9.sp,
                                      fontWeight: FontWeight.w700))
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on_outlined,
                                color: textColor2.withAlpha(180),
                              ),
                              Text(
                                car.location,
                                style: textStyle.copyWith(
                                    color: textColor2.withAlpha(180),
                                    fontSize: 9.sp,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                          Icon(
                            Icons.favorite_border,
                            color: textColor2.withAlpha(180),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 20, left: 35, right: 35),
        child: Container(
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
          ),
          child: TextField(
            decoration: InputDecoration(
                suffixIcon: IconButton(
                  splashColor: Colors.transparent,
                  onPressed: () {
                    showModalBottomSheet(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        isScrollControlled: true,
                        context: context,
                        builder: (BuildContext ctx) =>
                            _createFilterButtomSheet());
                  },
                  icon: Icon(
                    Icons.filter_alt_outlined,
                    size: 30,
                    color: textColor2.withAlpha(200),
                  ),
                ),
                prefixIcon: Icon(
                  Icons.search,
                  color: textColor2.withAlpha(200),
                ),
                filled: true,
                fillColor: Colors.white,
                border: InputBorder.none,
                hintText: "Search",
                hintStyle: textStyle.copyWith(
                    color: textColor2.withAlpha(200), fontSize: 22)),
          ),
        ));
  }

  Container _createFilterButtomSheet() {
    return Container(
      padding: const EdgeInsets.all(25),
      height: 85.h,
      child: Stack(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "Filter Search",
              style: textStyle.copyWith(fontSize: 20.sp, color: textColor),
            ),
            Text(
              "You can use the following filter \noptions for advanced search.",
              style: textStyle.copyWith(fontSize: 10.sp, color: textColor2),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 2.h,
            ),
            Expanded(
              child: ListView(
                children: [
                  const CustomDropDownMenu(
                    hintText: "Date: Newest first",
                    title: "Sort by",
                  ),
                  const CustomDropDownMenu(
                    hintText: "All",
                    title: "Make",
                  ),
                  const CustomDropDownMenu(
                    hintText: "All",
                    title: "Model",
                  ),
                  const CustomFromToWidget(
                    title: "Model Year",
                  ),
                  const CustomDropDownMenu(
                    hintText: "All",
                    title: "Body Type",
                  ),
                  const CustomFromToWidget(
                    title: "Kilometers run",
                  ),
                  SizedBox(
                    height: 10.h,
                  )
                ],
              ),
            )
          ],
        ),
        Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
                height: 6.h,
                width: double.infinity,
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30),
                  child: DetailViewButton(text: "Apply Filters"),
                )))
      ]),
    );
  }
}

class CustomFromToWidget extends StatelessWidget {
  const CustomFromToWidget({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 50,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: textStyle.copyWith(
                  fontSize: 14.sp,
                  color: textColor,
                  fontWeight: FontWeight.bold)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 40.w,
                child: TextField(
                  decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              width: 3,
                              color: buttomBarIconColor.withAlpha(100))),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              width: 3,
                              color: buttomBarIconColor.withAlpha(100))),
                      hintText: "From",
                      hintStyle: textStyle.copyWith(
                          fontSize: 11.sp, color: textColor2.withAlpha(200))),
                ),
              ),
              SizedBox(
                width: 40.w,
                child: TextField(
                  decoration: InputDecoration(
                      focusedBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              width: 3,
                              color: buttomBarIconColor.withAlpha(100))),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                              width: 3,
                              color: buttomBarIconColor.withAlpha(100))),
                      hintText: "To",
                      hintStyle: textStyle.copyWith(
                          fontSize: 11.sp, color: textColor2.withAlpha(200))),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomDropDownMenu extends StatelessWidget {
  const CustomDropDownMenu({
    super.key,
    required this.hintText,
    required this.title,
  });
  final String hintText;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: textStyle.copyWith(
                  fontSize: 14.sp,
                  color: textColor,
                  fontWeight: FontWeight.bold)),
          DropdownMenu(
              inputDecorationTheme: InputDecorationTheme(
                  hintStyle: textStyle.copyWith(
                      fontSize: 11.sp, color: textColor2.withAlpha(200))),
              textStyle: textStyle.copyWith(fontSize: 11.sp, color: textColor2),
              width: 90.w,
              hintText: hintText,
              dropdownMenuEntries: const [
                DropdownMenuEntry(value: "", label: ""),
              ]),
        ],
      ),
    );
  }
}

class CarCardScroll extends StatelessWidget {
  const CarCardScroll({super.key, s});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 38.h,
        child: ListView.builder(
            itemCount: cars.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => CarCard(car: cars[index])));
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
