// ignore_for_file: prefer_final_fields, non_constant_identifier_names

import 'package:classic_cars_collection/constants/app_colors.dart';
import 'package:classic_cars_collection/constants/app_typography.dart';
import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  int _selected_index = 0;
  final List<String> _categories = [
    "Hot",
    "American",
    "French",
    "Mexico",
    "Malian"
  ];
  @override
  Widget build(BuildContext context) {
    final typography = AppTypography(context);
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: _categories.asMap().entries.map((entry) {
          return InkWell(
            onTap: () {
              setState(() {
                _selected_index = entry.key;
              });
            },
            child: Container(
              padding: EdgeInsets.symmetric(
                  vertical: typography.padding,
                  horizontal: 2 * typography.padding),
              margin: EdgeInsets.only(right: typography.padding),
              decoration: BoxDecoration(
                  color: _selected_index == entry.key
                      ? AppColors.SECONDARY_COLOR_DARK
                      : null,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(typography.padding),
                      bottomLeft: Radius.circular(typography.padding))),
              child: Text(
                entry.value.toUpperCase(),
                style: TextStyle(
                    fontSize: typography.h2,
                    color: _selected_index == entry.key ? Colors.white : null,
                    fontWeight: FontWeight.bold),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
