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

class _HomePageState extends State<HomePage> {
  bool isPickedMode = false;
  List<int> pickedCards = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: (isPickedMode)
            ? IconButton(
                onPressed: () {
                  pickedCards.clear();
                  isPickedMode = false;
                  setState(() {});
                },
                icon: const Icon(
                  Icons.close,
                ),
              )
            : null,
        title: const Text('Multi Picker'),
        actions: [
          if (isPickedMode)
            IconButton(
              onPressed: () => debugPrint(
                'The Selected Items are $pickedCards',
              ),
              icon: const Icon(
                Icons.check,
              ),
            ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: 10,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemBuilder: (context, index) => InkWell(
          onLongPress: () => setState(() {
            if (!pickedCards.contains(index)) {
              pickedCards.add(index);
            }
            isPickedMode = true;
          }),
          onTap: () {
            if (isPickedMode) {
              if (!pickedCards.contains(index)) {
                pickedCards.add(index);
              } else {
                pickedCards.remove(index);
              }
            }
            if (pickedCards.isEmpty) {
              isPickedMode = false;
            }
            setState(() {});
          },
          child: Container(
            color: Colors.red,
            child: isPickedMode
                ? Align(
                    alignment: Alignment.topRight,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 15,
                        child: pickedCards.contains(index)
                            ? Text('${pickedCards.indexOf(index) + 1}')
                            : const Text(''),
                      ),
                    ),
                  )
                : null,
          ),
        ),
      ),
    );
  }
}
