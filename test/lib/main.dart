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
  late FocusNode focusNode;

  @override
  void initState() {
    super.initState();
    focusNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              context: context,
              builder: (_) => SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: AnimatedSize(
                  duration: const Duration(milliseconds: 300),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      TextField(
                        focusNode: focusNode,
                      ),
                      const Text(
                        'Hello World',
                        style: TextStyle(fontSize: 20),
                      ),
                      const Text(
                        'Hello World',
                        style: TextStyle(fontSize: 20),
                      ),
                      const Text(
                        'Hello World',
                        style: TextStyle(fontSize: 20),
                      ),
                      SizedBox(
                        height: focusNode.hasFocus
                            ? MediaQuery.of(context).size.height * 0.5
                            : kBottomNavigationBarHeight,
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
          child: const Text('Open'),
        ),
      ),
    );
  }
}
