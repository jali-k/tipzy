import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sign_in_button/sign_in_button.dart';
import 'package:tipzy/firebase_options.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:tipzy/screens/notifications_screen.dart';
import 'package:tipzy/screens/projects_screen.dart';
import 'package:tipzy/widgets/project_card.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
  final FirebaseAuth _auth = FirebaseAuth.instance;

  User? _user;

  int currentIndex = 0;

  void _handleSignIn() {
    try {
      GoogleAuthProvider _googleAuthProvider = GoogleAuthProvider(
       
      );
      _auth.signInWithProvider(_googleAuthProvider);
    } catch (e) {
      print(e);
    }
  }

  void _handleSignOut() {
    try {
      _auth.signOut();
      
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _auth.authStateChanges().listen((event) {
      setState(() {
        _user = event;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        destinations: [
          NavigationDestination(icon: Icon(Icons.work), label: "Projects"),
          NavigationDestination(icon: Icon(Icons.aod), label: "Tips"),
        ],
        selectedIndex: currentIndex,
        onDestinationSelected: (value) => setState(() => currentIndex = value),
      ),
      appBar: AppBar(
        actions: [
          _user != null
              ? IconButton(
                  onPressed: _handleSignOut,
                  icon: Icon(Icons.logout),
                )
              : Container()
        ],
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: _user != null
          ? [ProjectsScreen(), NotificationsScreen()][currentIndex]
          : _googleSignInButton(),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  Widget _googleSignInButton() {
    return SizedBox(
        height: 100,
        child: SignInButton(Buttons.google, onPressed: _handleSignIn));
  }

  Widget userInfo() {
    return SizedBox(
      child: Column(
        children: [
          Text(_user?.displayName ?? "No user"),
          Text(_user?.email ?? "No email"),
          Text(_user?.phoneNumber ?? "No phone"),
          Text(_user?.photoURL ?? "No photo"),
        ],
      ),
    );
  }
}
