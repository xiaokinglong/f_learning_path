import 'package:flutter/material.dart';

// 一个基础的数字滚动 widget
class Counter extends StatelessWidget {
  final int count; // 要滚动的数字
  final TextStyle? style; // 数字的样式的样式
  final Duration duration; // 滚动的时间
  final double height; // 滚动的高度
  const Counter({
    super.key,
    required this.count,
    required this.duration,
    this.style,
    required this.height,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: height,
      child: TweenAnimationBuilder(
        duration: duration,
        tween: Tween(end: count.toDouble()),
        builder: (context, value, child) {
          final whole = value ~/ 1; // 取整
          final process = value - whole; // 取小数部分
          return Stack(
            children: [
              Positioned(
                top: -height * process, // 0 ----> 100
                child: Text(
                  '$whole',
                  style: style,
                ),
              ),
              Positioned(
                top: height - process * height, // -100 ---> 0
                child: Text(
                  (whole + 1).toString(),
                  style: style,
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
