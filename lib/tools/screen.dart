import 'package:flutter/material.dart';

// 拓展init 方便使用
extension IntFix on int {
  double get px {
    return ScreenHelper.getSize(toDouble());
  }
}

extension DoubleFix on double {
  double get px {
    return ScreenHelper.getSize(toDouble());
  }
}

class ScreenHelper {
  static late MediaQueryData _mediaQueryData;

  // 屏幕的宽度 高度
  static late double screenWidth;
  static late double screenHeight;
  // 屏幕的像素比率
  static late double pixelRatio;

  // 根据设计稿的宽度  计算当前屏幕的宽度
  static init(BuildContext context, {double baseWidth = 375}) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    // pixelRatio = _mediaQueryData.devicePixelRatio;
    pixelRatio = screenWidth / baseWidth;
  }

  // 获取设计稿对应的大小
  static double getSize(double size) {
    return ScreenHelper.pixelRatio * size;
  }
}
