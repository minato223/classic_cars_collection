// ignore_for_file: non_constant_identifier_names

import 'package:classic_cars_collection/constants/app_cars.dart';
import 'package:classic_cars_collection/constants/app_colors.dart';
import 'package:classic_cars_collection/constants/app_image.dart';
import 'package:classic_cars_collection/constants/app_typography.dart';
import 'package:classic_cars_collection/screens/home/widgets/car_item_builder.dart';
import 'package:classic_cars_collection/screens/home/widgets/categories.dart';
import 'package:classic_cars_collection/screens/menu.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _show_all = false;
  @override
  Widget build(BuildContext context) {
    final typography = AppTypography(context);
    Radius border_radius = Radius.circular(typography.padding * 3);
    return Menu(
        child: ListView(
      physics: const BouncingScrollPhysics(),
      children: [
        Center(
          child: Image.asset(
            AppImage.BANNER,
            width: typography.width * .3,
          ),
        ),
        SizedBox(height: typography.padding),
        const Categories(),
        SizedBox(height: typography.padding * 3),
        Text(
          "Near You".toUpperCase(),
          style:
              TextStyle(fontSize: typography.h1, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: typography.padding),
        ...List.generate(!_show_all ? 2 : AppCars().getCars().length,
                (index) => CarItemBuilder(car: AppCars().getCars()[index]))
            .toList(),
        SizedBox(height: typography.padding * 2),
        Align(
          alignment: Alignment.centerRight,
          child: InkWell(
            onTap: () {
              setState(() {
                _show_all = !_show_all;
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                  vertical: typography.padding,
                  horizontal: 2 * typography.padding),
              margin: EdgeInsets.only(right: typography.width * .1),
              decoration: BoxDecoration(
                  color: AppColors.SECONDARY_COLOR_DARK,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(typography.padding),
                      bottomLeft: Radius.circular(typography.padding))),
              child: Text(
                "View All".toUpperCase(),
                style: TextStyle(
                    fontSize: typography.h2,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ),
        SizedBox(height: typography.padding * 2),
        Align(
            alignment: Alignment.centerLeft,
            child: Container(
              height: 300,
              width: typography.width * .65,
              decoration: BoxDecoration(
                // ignore: prefer_const_literals_to_create_immutables
                boxShadow: [
                  const BoxShadow(
                      offset: Offset(3, 0),
                      color: Colors.black12,
                      spreadRadius: 5,
                      blurRadius: 10)
                ],
                image: const DecorationImage(
                    image: AssetImage(AppImage.NEWS_PAPER), fit: BoxFit.fill),
                borderRadius: BorderRadius.only(
                    topRight: border_radius,
                    topLeft: Radius.elliptical(
                        typography.width * .15, typography.width * .15)),
              ),
            )),
        SizedBox(height: typography.padding * 2),
      ],
    ));
  }
}
