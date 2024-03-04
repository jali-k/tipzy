import 'package:flutter/material.dart';
import 'package:tipzy/screens/notifications_screen.dart';
import 'package:tipzy/screens/projects_screen.dart';
import 'package:tipzy/widgets/project_card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tipzy',
      theme: ThemeData(
        colorScheme:
            ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 21, 42, 136)),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Welcome to Tipzy!'),
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
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: NavigationBar(
          destinations: [
            NavigationDestination(icon: Icon(Icons.work), label: "Projects"),
            NavigationDestination(icon: Icon(Icons.aod), label: "Tips"),
          ],
          selectedIndex: currentIndex,
          onDestinationSelected: (value) =>
              setState(() => currentIndex = value),
        ),
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: [ProjectsScreen(), NotificationsScreen()][currentIndex]
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
