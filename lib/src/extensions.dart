import '../screentasia.dart';
import 'package:flutter/material.dart';

extension SizeExtension on num {
  ///Adaptive Width
  double get w => Screentasia().setWidth(this);

  ///Adaptive Height
  double get h => Screentasia().setHeight(this);

  ///Adaptive Radius
  double get r => Screentasia().radius(this);

  ///Adaptive Size (font,icon)
  double get sp => Screentasia().setSp(this);

  ///Width percentage :ex 50.wp is 50% of screen width
  double get wp {
    return Screentasia().setPercentage(Screentasia().screenWidth, this);
  }

  ///Height percentage :ex 50.hp is 50% of screen Height
  double get hp {
    return Screentasia().setPercentage(Screentasia().screenHeight, this);
  }

  ///Adaptive Percentage :ex al(50) is 50% from new adaptive value
  double ap({adaptivePercentage = const AdaptivePercentage()}) {
    return Screentasia().setAdaptivePercentage(this, adaptivePercentage);
  }
}

extension EdgeInsetsExtension on EdgeInsets {
  /// Creates adapt insets using r [SizeExtension].
  EdgeInsets get r => copyWith(
        top: top.r,
        bottom: bottom.r,
        right: right.r,
        left: left.r,
      );

  EdgeInsets get w => copyWith(
        top: top.w,
        bottom: bottom.w,
        right: right.w,
        left: left.w,
      );

  EdgeInsets get h => copyWith(
        top: top.h,
        bottom: bottom.h,
        right: right.h,
        left: left.h,
      );
}

extension BorderRaduisExtension on BorderRadius {
  /// Creates adapt BorderRadius using r [SizeExtension].
  BorderRadius get r => copyWith(
        bottomLeft: bottomLeft.r,
        bottomRight: bottomRight.r,
        topLeft: topLeft.r,
        topRight: topRight.r,
      );

  BorderRadius get w => copyWith(
        bottomLeft: bottomLeft.w,
        bottomRight: bottomRight.w,
        topLeft: topLeft.w,
        topRight: topRight.w,
      );

  BorderRadius get h => copyWith(
        bottomLeft: bottomLeft.h,
        bottomRight: bottomRight.h,
        topLeft: topLeft.h,
        topRight: topRight.h,
      );
}

extension RaduisExtension on Radius {
  /// Creates adapt Radius using r [SizeExtension].
  Radius get r => Radius.elliptical(x.r, y.r);

  Radius get w => Radius.elliptical(x.w, y.w);

  Radius get h => Radius.elliptical(x.h, y.h);
}
