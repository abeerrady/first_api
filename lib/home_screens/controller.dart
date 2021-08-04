
import 'package:dio/dio.dart';

import 'model.dart';

class Controller {
  Dio dio = Dio();

  Future<List<ResponseData>> getData() async {
    final response =
    await dio.get('https://www.breakingbadapi.com/api/characters');
    final app = response.data as List;
    List<ResponseData> data = [];
    app.forEach((value) {
      ResponseData name = ResponseData.fromJson(value);
      data.add(name);
    });
    return data;
  }
}
