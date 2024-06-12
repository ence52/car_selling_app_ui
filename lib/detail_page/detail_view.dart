import 'package:car_app/product_list.dart';
import 'package:car_app/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sizer/sizer.dart';

class DetailView extends StatelessWidget {
  const DetailView({super.key, required this.car});
  final Car car;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back_ios,
            size: 30,
            color: Color.fromARGB(255, 54, 54, 54),
          ),
        ),
      ),
      body: Stack(children: [
        SizedBox(
          height: 100.h,
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.only(left: 6.w, right: 6.w),
                child: Text(
                  "Details",
                  style: textStyle.copyWith(fontSize: 45, color: textColor),
                ),
              ),
              Container(
                width: double.infinity,
                height: 28.h,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(car.image), fit: BoxFit.cover),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30)),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, left: 6.w, right: 6.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      car.title,
                      style: textStyle.copyWith(
                          fontSize: 12.sp,
                          color: textColor,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    PriceAndLocation(
                      location: car.location,
                      price: car.price,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Specs(car: car),
                    const SizedBox(
                      height: 20,
                    ),
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Description",
                            style: textStyle.copyWith(
                                fontSize: 14.sp,
                                color: textColor,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            car.description,
                            style: textStyle.copyWith(
                                fontSize: 9.sp, color: textColor2),
                          )
                        ]),
                    Container(
                      height: 13.h,
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            height: 10.h,
            child: const Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DetailViewButton(text: "Call"),
                  DetailViewButton(text: "Message"),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

class DetailViewButton extends StatelessWidget {
  const DetailViewButton({
    super.key,
    required this.text,
  });
  final String text;
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3,
      child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
              gradient: const LinearGradient(colors: [
                Color.fromARGB(255, 247, 2, 76),
                Color.fromARGB(255, 247, 119, 119)
              ]),
              borderRadius: BorderRadius.circular(30)),
          child: Text(
            text,
            style: textStyle.copyWith(fontSize: 14.sp, color: Colors.white),
          )),
    );
  }
}

class Specs extends StatelessWidget {
  const Specs({
    super.key,
    required this.car,
  });

  final Car car;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Wrap(
          direction: Axis.vertical,
          spacing: 10,
          crossAxisAlignment: WrapCrossAlignment.start,
          children: [
            SpecWidget(title: "Type", value: car.type),
            SpecWidget(title: "Make", value: car.make),
            SpecWidget(title: "Model", value: car.model),
            SpecWidget(title: "Variant", value: car.variant),
          ],
        ),
        Wrap(
          direction: Axis.vertical,
          spacing: 12,
          crossAxisAlignment: WrapCrossAlignment.start,
          children: [
            SpecWidget(title: "Capacity", value: "${car.capacity} cc"),
            SpecWidget(title: "Transmission", value: car.transmission),
            SpecWidget(
                title: "Seat Capacitty", value: car.seatCapacity.toString()),
            SpecWidget(title: "Km", value: car.km.toString()),
          ],
        ),
      ],
    );
  }
}

class SpecWidget extends StatelessWidget {
  const SpecWidget({
    super.key,
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "$title: ",
          style:
              textStyle.copyWith(fontSize: 10.sp, fontWeight: FontWeight.bold),
        ),
        Text(
          value,
          style:
              textStyle.copyWith(fontSize: 10.sp, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }
}

class PriceAndLocation extends StatelessWidget {
  const PriceAndLocation({
    super.key,
    required this.price,
    required this.location,
  });

  final int price;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            SvgPicture.asset(
                colorFilter: ColorFilter.mode(textPinkColor, BlendMode.srcIn),
                fit: BoxFit.cover,
                height: 25,
                "assets/icons/price_tag.svg"),
            const SizedBox(
              width: 3,
            ),
            Text("$price USD",
                style: textStyle.copyWith(
                    color: textPinkColor,
                    fontSize: 12.sp,
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
              location,
              style: textStyle.copyWith(
                  color: textColor2.withAlpha(180),
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ],
    );
  }
}
