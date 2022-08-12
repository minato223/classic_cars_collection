// ignore_for_file: non_constant_identifier_names

import 'package:classic_cars_collection/constants/app_cars.dart';
import 'package:classic_cars_collection/constants/app_colors.dart';
import 'package:classic_cars_collection/constants/app_image.dart';
import 'package:classic_cars_collection/constants/app_typography.dart';
import 'package:classic_cars_collection/screens/home/widgets/car_item_builder.dart';
import 'package:classic_cars_collection/screens/home/widgets/categories.dart';
import 'package:classic_cars_collection/screens/home/widgets/news_paper.dart';
import 'package:classic_cars_collection/screens/home/widgets/view_all_button.dart';
import 'package:classic_cars_collection/screens/menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool _show_all = false;
  final GlobalKey<AnimatedListState> _key = GlobalKey<AnimatedListState>();
  List<Widget> _items = [];
  List<Widget> _elements = [];
  Tween<Offset> _tween = Tween<Offset>(begin: Offset(0, 1), end: Offset(0, 0));
  @override
  void initState() {
    super.initState();
    SchedulerBinding.instance?.addPostFrameCallback((timeStamp) {
      final typography = AppTypography(context);
      _elements = [
        SizedBox(height: typography.height * .05),
        Center(
          child: Image.asset(
            AppImage.BANNER,
            width: typography.width * .3,
          ),
        ),
        SizedBox(height: typography.height * .01),
        const Categories(),
        SizedBox(height: typography.height * .02),
        Text(
          "Near You".toUpperCase(),
          style:
              TextStyle(fontSize: typography.h1, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: typography.height * .02),
        ...List.generate(
                2, (index) => CarItemBuilder(car: AppCars().getCars()[index]))
            .toList(),
        SizedBox(height: typography.height * .02),
        viewAllButton(onClickCallback: () {
          if (!_show_all) {
            viewAll();
          }
        }),
        SizedBox(height: typography.padding * 2),
        newsPaper(),
        SizedBox(height: typography.padding * 2)
      ];
      addToList();
    });
  }

  addToList() {
    var future = Future(() {});
    for (var element in _elements) {
      future = future.then((_) {
        addItem(element);
        return Future.delayed(const Duration(milliseconds: 50));
      });
    }
  }

  addItem(Widget item) {
    int index = _items.length;
    _items.insert(index, item);
    _key.currentState?.insertItem(index);
  }

  viewAll() {
    var future = Future(() {});
    setState(() {
      _tween =
          Tween<Offset>(begin: const Offset(1, 0), end: const Offset(0, 0));
      _show_all = true;
    });
    for (var i = 2; i < AppCars().getCars().length; i++) {
      future = future.then((_) {
        Widget element = CarItemBuilder(car: AppCars().getCars()[i]);
        inserAt(6, element);
        return Future.delayed(const Duration(milliseconds: 400));
      });
    }
  }

  inserAt(index, item) {
    _items.insert(index, item);
    _key.currentState?.insertItem(index);
  }

  @override
  Widget build(BuildContext context) {
    return Menu(
        child: AnimatedList(
            physics: const BouncingScrollPhysics(),
            key: _key,
            initialItemCount: _items.length,
            itemBuilder: (context, index, animation) {
              return SlideTransition(
                child: _items[index],
                position: animation.drive(_tween),
              );
            }));
  }
}
