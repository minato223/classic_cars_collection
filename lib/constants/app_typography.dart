import 'package:flutter/widgets.dart';

class AppTypography {
  BuildContext context;
  late double _width;
  late double _height;
  AppTypography(this.context) {
    _width = MediaQuery.of(context).size.width;
    _height = MediaQuery.of(context).size.height;
  }
  double get width => _width;
  double get height => _height;
  double get padding => _width * .02;
  double get h1 => 20;
  double get h2 => 16;
  double get h3 => 12;
}
