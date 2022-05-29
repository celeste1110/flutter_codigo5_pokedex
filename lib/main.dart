import 'package:flutter/material.dart';
import 'package:flutter_codigo5_pokedex/pages/home_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PokedexApp',
      debugShowCheckedModeBanner: false,
        home: HomePage(),
    );
  }
}
