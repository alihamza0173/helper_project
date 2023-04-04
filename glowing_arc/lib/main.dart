import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:math' as math;

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
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: 300,
          width: 300,
          child: CustomPaint(
            painter: ArcPainter(),
          ),
        ),
      ),
    );
  }
}

class ArcPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var backGreyPaint = Paint();
    backGreyPaint.color = Colors.grey;
    backGreyPaint.style = PaintingStyle.stroke;
    backGreyPaint.strokeCap = StrokeCap.round;
    backGreyPaint.strokeWidth = 10;
    canvas.drawArc(
      Rect.fromCenter(
        center: Offset(size.width / 2, size.height / 2),
        width: size.width,
        height: size.height,
      ),
      math.pi,
      math.pi,
      false,
      backGreyPaint,
    );

    var frontColoredPaint = Paint();
    var shadowPaint = Paint();
    frontColoredPaint.style = PaintingStyle.stroke;
    shadowPaint.style = PaintingStyle.stroke;
    frontColoredPaint.strokeCap = StrokeCap.round;
    shadowPaint.strokeCap = StrokeCap.round;
    frontColoredPaint.strokeWidth = 18;
    shadowPaint.strokeWidth = 18;
    shadowPaint.imageFilter = ImageFilter.blur(sigmaX: 10,sigmaY: 10);

    List<Color> color = [Colors.green, Colors.orange, Colors.purple];

    for (int i = 0; i < 3; i++) {
      shadowPaint.color = color[i];
      canvas.drawArc(
        Rect.fromCenter(
          center: Offset(size.width / 2, size.height / 2),
          width: size.width,
          height: size.height,
        ),
        math.pi + i * 0.7,
        math.pi / 6,
        false,
        shadowPaint,
      );
    }
    for (int i = 0; i < 3; i++) {
      frontColoredPaint.color = color[i];
      canvas.drawArc(
        Rect.fromCenter(
          center: Offset(size.width / 2, size.height / 2),
          width: size.width,
          height: size.height,
        ),
        math.pi + i * 0.7,
        math.pi / 6,
        false,
        frontColoredPaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
