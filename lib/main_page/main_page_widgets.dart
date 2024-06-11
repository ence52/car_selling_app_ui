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
}
