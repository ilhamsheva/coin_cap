import 'dart:convert';
import 'package:coin_cap/models/app_config.dart';
import 'package:coin_cap/pages/home_page.dart';
import 'package:coin_cap/services/http_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Load the configuration
  await loadConfig();
  // Register the HttpServices with GetIt
  registerHttpServices();
  runApp(const MyApp());
}

// Function for load config (future function)
Future<void> loadConfig() async {
  String loadContent = await rootBundle.loadString("assets/config/main.json");
  Map content = jsonDecode(loadContent);

  // Making object from JSON
  final appConfig = AppConfig(baseURL: content["COIN_CAP_BASE_URL"]);
  // Register AppConfig with GetIt
  GetIt.instance.registerSingleton<AppConfig>(appConfig);
}

// Register AppConfig with GetIt
void registerHttpServices() {
  GetIt.instance.registerSingleton<HttpServices>(HttpServices());
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
