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
  bool enteredMulti = false;
  List<int> selectedList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: ListView.builder(
        itemCount: 20,
        itemBuilder: (context, index) => InkWell(
          onLongPress: () => setState(() {
            enteredMulti = true;
            selectedList.add(index);
          }),
          onTap: () {
            if (selectedList.contains(index)) {
              selectedList.remove(index);
            } else {
              selectedList.add(index);
            }
            if (selectedList.isEmpty) {
              enteredMulti = false;
            }
            setState(() {});
          },
          child: ListTile(
            leading: (enteredMulti && selectedList.contains(index))
                ? const Icon(Icons.check_circle)
                : null,
            title: Text('Tile $index'),
          ),
        ),
      ),
    );
  }
}
