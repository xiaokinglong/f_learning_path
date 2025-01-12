import 'package:f_learning_path/tools/screen.dart';
import 'package:flutter/material.dart';

class ScreenPage extends StatelessWidget {
  const ScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    // 初始工具函数
    ScreenHelper.init(context);
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            width: 100.0,
            height: 100,
            color: Colors.pink,
          ),
          Container(
            width: 100.px,
            height: 100.px,
            color: Colors.red,
          )
        ],
      ),
    );
  }
}
