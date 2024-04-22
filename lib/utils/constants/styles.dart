import 'package:flutter/cupertino.dart';
import 'package:recipe_app/utils/constants/sizes.dart';

class CustomSpacingStyle {
  static const EdgeInsetsGeometry paddingWithAppBarHeight = EdgeInsets.only(
    top: CustomSize.appBarHeight,
    left: CustomSize.defaultSpace,
    bottom: CustomSize.defaultSpace,
    right: CustomSize.defaultSpace,
  );
}