import 'package:flutter/material.dart';
import '/pages/home_page.dart';
import '/util/fade_page_transition.dart';

const double tileSize = 16;

const double defaultZoom = 2.5;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        pageTransitionsTheme: PageTransitionsTheme(
          builders: {
            TargetPlatform.macOS: FadePageTransition(),
          },
        ),
      ),
      home: const HomePage(),
    );
  }
}
