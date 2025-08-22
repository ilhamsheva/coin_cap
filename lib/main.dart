import 'dart:convert';
import 'package:coin_cap/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Load the configuration
  await loadConfig();
  runApp(const MyApp());
}

// Function for load config (future function)
Future<void> loadConfig() async {
  String _loadContent = await rootBundle.loadString("assets/config/main.json");
  Map _content = jsonDecode(_loadContent);
  print(_content);
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CoinCap',
      theme: ThemeData(
        scaffoldBackgroundColor: Color.fromRGBO(31, 122, 145, 1),
      ),
      home: const HomePage(),
    );
  }
}
