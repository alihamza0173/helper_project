import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme o
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<Color> color;
  late ScrollController controller;
  double height = 80;

  List<Color> getRandomColors(int count) {
    List<Color> colors = [];
    Random random = Random();

    for (int i = 0; i < count; i++) {
      int r = random.nextInt(255);
      int g = random.nextInt(255);
      int b = random.nextInt(255);
      colors.add(Color.fromRGBO(r, g, b, 1.0));
    }

    return colors;
  }

  @override
  void initState() {
    super.initState();

    color = getRandomColors(10);
    controller = ScrollController()
      ..addListener(() {
        if (controller.position.userScrollDirection ==
            ScrollDirection.reverse) {
          // User is scrolling down
          height = 0;
        } else if (controller.position.userScrollDirection ==
            ScrollDirection.forward) {
          // User is scrolling up
          height = 80;
        }
        // Save the last scroll offset
        setState(() {});
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: PageView.builder(
          itemCount: 3,
          pageSnapping: true,
          itemBuilder: (context, index) {
            return SingleChildScrollView(
              controller: controller,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: color
                    .map((e) => Container(
                          height: 200,
                          width: double.maxFinite,
                          color: e,
                          alignment: Alignment.center,
                          child: Text(
                            index.toString(),
                          ),
                        ))
                    .toList(),
              ),
            );
          }),
      bottomNavigationBar: AnimatedContainer(
        duration: const Duration(seconds: 1),
        height: height,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: const [
            Icon(
              Icons.home,
              size: 30,
            ),
            Icon(
              Icons.wallet,
              size: 30,
            ),
            Icon(
              Icons.settings,
              size: 30,
            ),
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
