// ignore_for_file: non_constant_identifier_names, prefer_const_constructors, import_of_legacy_library_into_null_safe

import 'package:classic_cars_collection/constants/app_colors.dart';
import 'package:classic_cars_collection/constants/app_icons.dart';
import 'package:classic_cars_collection/constants/app_image.dart';
import 'package:classic_cars_collection/constants/app_typography.dart';
import 'package:classic_cars_collection/screens/home/widgets/navigation_clipper.dart';
import 'package:clip_shadow/clip_shadow.dart';
import 'package:flutter_lorem/flutter_lorem.dart' as lorem;
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 5;
  final List<String> _menus = ["Home", "Invoke", "Notification", "My Profile"];
  List<Widget> _navigations = [];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final typography = AppTypography(context);
    _navigations = [
      createNavigtionIcon(path: AppIcons.SHOPPING),
      ..._menus.map((menu) => createNavigationItem(item: menu)).toList(),
      createNavigtionIcon(
          path: AppImage.BADGE, navigationIconType: NavigationIconType.img),
      createNavigtionIcon(path: AppIcons.MENU),
    ];
    return Scaffold(
      backgroundColor: AppColors.PRIMARY_COLOR,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: typography.height * .02),
            Expanded(
              child: Row(
                children: [
                  Column(
                    children: [
                      Expanded(
                        child: ClipShadow(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(.6),
                                offset: Offset.zero,
                                blurRadius: 10,
                                spreadRadius: .2,
                                blurStyle: BlurStyle.outer),
                          ],
                          clipper: NavigationClipper(
                              elements_count: _navigations.length,
                              selected_index: _selectedIndex),
                          child: Container(
                            height: (typography.height),
                            width: (typography.width * .25),
                            decoration:
                                BoxDecoration(color: AppColors.ACTIVE_COLOR),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: _navigations.reversed
                                  .toList()
                                  .asMap()
                                  .entries
                                  .map(
                                    (e) => Expanded(
                                      child: GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            _selectedIndex = e.key;
                                          });
                                        },
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            _selectedIndex == e.key
                                                ? Positioned(
                                                    right:
                                                        typography.width * .12,
                                                    child: Container(
                                                      height: typography.width *
                                                          .015,
                                                      width: typography.width *
                                                          .015,
                                                      decoration: BoxDecoration(
                                                          color: AppColors
                                                              .SECONDARY_COLOR,
                                                          shape:
                                                              BoxShape.circle),
                                                    ),
                                                  )
                                                : const SizedBox(),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                  right: typography.width * .1),
                                              child: Center(child: e.value),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: typography.height * .01),
                    ],
                  ),
                  Expanded(
                    child: ListView(
                      children: [
                        Container(
                          // width: 30,
                          // height: 200,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(20)),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget createNavigtionIcon(
      {required String path,
      NavigationIconType navigationIconType = NavigationIconType.svg}) {
    return Builder(builder: (context) {
      final typography = AppTypography(context);
      if (navigationIconType == NavigationIconType.svg) {
        return SvgPicture.asset(
          path,
          height: typography.width * .06,
          color: AppColors.SECONDARY_COLOR,
        );
      }
      return Image.asset(
        path,
        height: typography.width * .08,
      );
    });
  }

  Widget createNavigationItem({required String item}) {
    return Builder(builder: (context) {
      final typography = AppTypography(context);
      return RotatedBox(
        quarterTurns: 3,
        child: Text(
          item,
          style:
              TextStyle(fontSize: typography.h2, fontWeight: FontWeight.bold),
        ),
      );
    });
  }
}

enum NavigationIconType { svg, img }
