import 'package:flutter/material.dart';

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
        fontFamily: 'Wallpoet',
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late Animation<double> animation;
  late Animation<double> animation2;
  late AnimationController controller;
  late AnimationController controller2;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    controller2 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 12),
    );
    animation = Tween<double>(begin: 0, end: 10).animate(controller);
    animation2 = Tween<double>(begin: 0, end: 100).animate(controller2);
    controller.addListener(() => setState(() {}));
    controller2.addListener(() => setState(() {}));

    controller.repeat();
    controller2.repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const Gradient gradient = LinearGradient(
      colors: [
        Colors.blue,
        Colors.purple,
      ],
    );
    const EdgeInsets horizontalMargin = EdgeInsets.symmetric(horizontal: 5);
    const EdgeInsets verticalMargin = EdgeInsets.symmetric(vertical: 5);
    final width = MediaQuery.sizeOf(context).width * 0.6;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text(
          'Demo ',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Loading... Animation Text
            SizedBox(
              height: 50,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedText(
                    animation: animation,
                    text: 'L',
                    greaterThen: 0,
                    lessThen: 1,
                  ),
                  AnimatedText(
                    animation: animation,
                    text: 'o',
                    greaterThen: 0.1,
                    lessThen: 2,
                  ),
                  AnimatedText(
                    animation: animation,
                    text: 'a',
                    greaterThen: 1.1,
                    lessThen: 3,
                  ),
                  AnimatedText(
                    animation: animation,
                    text: 'd',
                    greaterThen: 2.1,
                    lessThen: 4,
                  ),
                  AnimatedText(
                    animation: animation,
                    text: 'i',
                    greaterThen: 3.1,
                    lessThen: 5,
                  ),
                  AnimatedText(
                    animation: animation,
                    text: 'n',
                    greaterThen: 4.1,
                    lessThen: 6,
                  ),
                  AnimatedText(
                    animation: animation,
                    text: 'g',
                    greaterThen: 5.1,
                    lessThen: 7,
                  ),
                  AnimatedText(
                    animation: animation,
                    text: '.',
                    greaterThen: 6.1,
                    lessThen: 8,
                  ),
                  AnimatedText(
                    animation: animation,
                    text: '.',
                    greaterThen: 7.1,
                    lessThen: 9,
                  ),
                  AnimatedText(
                    animation: animation,
                    text: '.',
                    greaterThen: 8.1,
                    lessThen: 10,
                  ),
                ],
              ),
            ),
            // Loading... Animation Bar
            SizedBox(
              height: 40,
              width: width * 0.6,
              child: Stack(
                children: [
                  // Container to fill the Bar
                  Container(
                    margin: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      gradient: gradient,
                    ),
                    width: ((width * 0.6) - 10) * animation2.value / 100,
                  ),
                  // Top Container Attached to the Bar
                  Container(
                    height: 5,
                    decoration: const BoxDecoration(
                      gradient: gradient,
                    ),
                    margin: horizontalMargin,
                  ),
                  // Vert Left Container Attached to the Bar
                  Container(
                    margin: verticalMargin,
                    color: Colors.purple,
                    width: 5,
                  ),
                  // Vert Right Container Attached to the Bar
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      margin: verticalMargin,
                      color: Colors.blue,
                      width: 5,
                    ),
                  ),
                  // Bottom Container Attached to the Bar
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      margin: horizontalMargin,
                      decoration: const BoxDecoration(
                        gradient: gradient,
                      ),
                      height: 5,
                    ),
                  ),
                ],
              ),
            ),
            ShaderMask(
              shaderCallback: (Rect bounds) {
                return gradient.createShader(bounds);
              },
              child: Text(
                '${animation2.value.toInt()} %',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AnimatedText extends StatelessWidget {
  const AnimatedText({
    super.key,
    required this.animation,
    required this.text,
    required this.greaterThen,
    required this.lessThen,
  });

  final Animation<double> animation;
  final String text;
  final double greaterThen;
  final double lessThen;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      alignment:
          animation.value.toInt() >= greaterThen && animation.value < lessThen
              ? Alignment.topCenter
              : Alignment.center,
      child: ShaderMask(
        shaderCallback: (Rect bounds) {
          return const SweepGradient(
            colors: [
              Colors.purple,
              Colors.blue,
            ],
          ).createShader(bounds);
        },
        child: Text(
          text,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w900,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
