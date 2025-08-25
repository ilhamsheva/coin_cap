import 'package:coin_cap/models/app_config.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

class HttpServices {
  final Dio dio = Dio();

  String? _baseURL;
  AppConfig? appConfig;

  HttpServices() {
    appConfig = GetIt.instance.get<AppConfig>();
    _baseURL = appConfig!.baseURL;
  }

  // Future respons from dio
  Future<Response?> get(String _path) async {
    try {
      String url = "$_baseURL$_path";
      Response response = await dio.get(url);
      return response;
    } catch (e) {
      print(e);
    }
  }
}
