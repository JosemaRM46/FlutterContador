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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Flutter Demo Hola'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class ThreeFloatingActionButtons extends StatelessWidget {
  const ThreeFloatingActionButtons({
    super.key,
    required this.onPressedFAB1,
    required this.onPressedFAB2,
    required this.onPressedFAB3
  });

  final VoidCallback onPressedFAB1;
  final VoidCallback onPressedFAB2;
  final VoidCallback onPressedFAB3;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          bottom: 16.0,
          right: 16.0,
          child: FloatingActionButton(
            onPressed: onPressedFAB1,
            tooltip: 'FAB 1',
            child: const Icon(Icons.add),
          ),
        ),
        Positioned(
          bottom: 80.0, // Ajusta la posición vertical del segundo botón
          right: 16.0,
          child: FloatingActionButton(
            onPressed: onPressedFAB2,
            tooltip: 'FAB 2',
            child: const Icon(Icons.remove),
          ),
        ),
        Positioned(
          bottom: 144.0, // Ajusta la posición vertical del segundo botón
          right: 16.0,
          child: FloatingActionButton(
            onPressed: onPressedFAB3,
            tooltip: 'FAB 3',
            child: const Icon(Icons.restart_alt),
          ),
        ),
      ],
    );
  }
}



class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  void _decreaseCounter() {
    setState(() {
      _counter--;
    });
  }

  void _resetCounter() {
    setState(() {
      _counter=0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Contador:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: ThreeFloatingActionButtons(onPressedFAB1: _incrementCounter ,onPressedFAB2: _decreaseCounter, onPressedFAB3: _resetCounter)
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
