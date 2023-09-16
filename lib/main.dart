import 'package:flutter/material.dart';
import 'package:kooha_test/locator.dart';
import 'package:kooha_test/route.dart';
import 'package:kooha_test/views/login.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  initLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final MaterialColor primaryColor = MaterialColor(0xFF141414, {
      50: Color(0xFFF0F0F0),
      100: Color(0xFFE0E0E0),
      200: Color(0xFFC0C0C0),
      300: Color(0xFFA0A0A0),
      400: Color(0xFF808080),
      500: Color(0xFF141414), // The primary color
      600: Color(0xFF101010),
      700: Color(0xFF0C0C0C),
      800: Color(0xFF080808),
      900: Color(0xFF040404),
    });
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: Color(0xFF141414),
        primarySwatch: primaryColor,
      ),
      onGenerateRoute: (settings) => generateRoute(settings),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
