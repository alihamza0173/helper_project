import 'package:flutter/material.dart';

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
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
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
      duration: const Duration(seconds: 5),
    );
    animation = Tween<double>(begin: 0, end: 10).animate(controller);
    animation2 = Tween<double>(begin: 0, end: 10).animate(controller2);
    controller.addListener(() => setState(() {}));
    controller2.addListener(() => setState(() {}));

    controller.repeat();
    controller2.repeat();
  }

  @override
  Widget build(BuildContext context) {
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
            SizedBox(
              height: 50,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    alignment:
                        animation.value.toInt() >= 0 && animation.value < 1
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
                      child: const Text(
                        'L',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    alignment:
                        animation.value.toInt() >= 0.1 && animation.value < 2
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
                      child: const Text(
                        'o',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    alignment:
                        animation.value.toInt() >= 1.1 && animation.value < 3
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
                      child: const Text(
                        'a',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    alignment:
                        animation.value.toInt() >= 2.1 && animation.value < 4
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
                      child: const Text(
                        'd',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    alignment:
                        animation.value.toInt() >= 3.1 && animation.value < 5
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
                      child: const Text(
                        'i',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    alignment:
                        animation.value.toInt() >= 4.1 && animation.value < 6
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
                      child: const Text(
                        'n',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    alignment:
                        animation.value.toInt() >= 5.1 && animation.value < 7
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
                      child: const Text(
                        'g',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    alignment:
                        animation.value.toInt() >= 6.1 && animation.value < 8
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
                      child: const Text(
                        '.',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    alignment:
                        animation.value.toInt() >= 7.1 && animation.value < 9
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
                      child: const Text(
                        '.',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    alignment:
                        animation.value.toInt() >= 8.1 && animation.value < 10
                            ? Alignment.topCenter
                            : Alignment.center,
                    child: ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return const LinearGradient(
                          colors: [
                            Colors.purple,
                            Colors.blue,
                          ],
                        ).createShader(bounds);
                      },
                      child: const Text(
                        '.',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w900,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
              width: MediaQuery.sizeOf(context).width * 0.6,
              child: Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.all(5),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.blue,
                          Colors.purple,
                        ],
                      ),
                    ),
                    width: ((MediaQuery.sizeOf(context).width * 0.6) - 10) *
                        animation2.value /
                        10,
                  ),
                  Container(
                    height: 5,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.purple,
                          Colors.blue,
                        ],
                      ),
                    ),
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    color: Colors.purple,
                    width: 5,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      color: Colors.blue,
                      width: 5,
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Container(
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.purple,
                            Colors.blue,
                          ],
                        ),
                      ),
                      height: 5,
                    ),
                  ),
                ],
              ),
            ),
            ShaderMask(
              shaderCallback: (Rect bounds) {
                return const LinearGradient(
                  colors: [
                    Colors.purple,
                    Colors.blue,
                  ],
                ).createShader(bounds);
              },
              child: Text(
                '${(animation2.value.toInt() + 1) * 10} %',
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
