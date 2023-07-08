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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const PaintApp(),
    );
  }
}

class PaintApp extends StatefulWidget {
  const PaintApp({super.key});

  @override
  State<PaintApp> createState() => _PaintAppState();
}

class _PaintAppState extends State<PaintApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Custom Paint'),
      ),
      body: Center(
        child: SizedBox(
          // color: Colors.black,
          height: 300,
          width: MediaQuery.sizeOf(context).width,
          child: CustomPaint(
            painter: ExamplePainter(),
          ),
        ),
      ),
    );
  }
}

class ExamplePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var path = Path();
    var paint = Paint()
      ..color = Colors.blue
      ..strokeWidth = 10;

    var tireRim = 100.0;

    path.moveTo(0, size.height / 2);
    path.lineTo(0, size.height);
    path.lineTo(size.width * 0.2, size.height);
    path.quadraticBezierTo(size.width * 0.2 + tireRim / 2, tireRim * 2,
        size.width * 0.2 + tireRim, size.height);
    path.lineTo(size.width * 0.2 + tireRim + 50, size.height);
    path.quadraticBezierTo(size.width * 0.2 + tireRim + 50 + tireRim / 2,
        tireRim * 2, size.width * 0.2 + tireRim + 50 + tireRim, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, size.height / 2);
    path.lineTo(size.width * 0.8, size.height / 2);
    path.lineTo(size.width * 0.2 + tireRim + 50, 0);
    path.lineTo(0, 0);

    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
