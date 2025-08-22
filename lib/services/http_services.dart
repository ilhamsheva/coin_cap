import 'package:coin_cap/models/app_config.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class HttpServices {
  final Dio dio = Dio();

  String? baseURL;
  AppConfig? appConfig;

  HttpServices() {
    baseURL = appConfig!.baseURL;
    appConfig = GetIt.instance.get<AppConfig>();
  }
}
