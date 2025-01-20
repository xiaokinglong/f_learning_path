import 'package:f_learning_path/pages/http_page/index.dart';
import 'package:f_learning_path/pages/map_page/index.dart';
import 'package:f_learning_path/pages/screen_page/index.dart';
import 'package:f_learning_path/widget/Counter/index.dart';
import 'package:flutter/material.dart';

// 定义一个 类
class Math {
  int start;

  Math(
    this.start,
  );

  void cnsoleStart(value) {
    print(start);
    print(value);
  }

  // 使用get 来设置一个获取 value 的方法
  int get value {
    return start + 1;
  }

  // 使用set 来设置一个修改 start 的方法
  set add(int name) {
    print('name: $name');
    start = name;
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      // home: ScreenPage(),
      home: MapPage(),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>
    with SingleTickerProviderStateMixin {
  int _counter = 0;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
    _controller?.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Counter(
              count: _counter,
              height: 30,
              duration: Duration(
                seconds: 2,
              ),
              style: const TextStyle(
                fontSize: 20,
                color: Colors.red,
              ),
            ),
            AnimatedBuilder(
              animation: _controller,
              builder: (context, child) {
                final val = Tween(
                  begin: 0.0,
                  end: 1.0,
                ).animate(_controller);
                return Container(
                  width: 100,
                  height: _controller.value * 100,
                  color: Colors.red,
                );
              },
              // child: Container(
              //   width: 100,
              //   height: 100,
              //   color: Colors.red,
              // ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class Demo extends StatefulWidget {
  const Demo({super.key});

  @override
  State<Demo> createState() => _DemoState();
}

class _DemoState extends State<Demo> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AnimatedBuilder(
        animation: _controller,
        builder: (context, child) {
          return Container(
            width: 100,
            height: 100,
            color: Colors.red,
          );
        },
      ),
    );
  }
}
