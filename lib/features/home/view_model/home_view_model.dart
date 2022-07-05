import 'dart:io';

import 'package:dio/dio.dart';
import 'package:store_app/core/constants/api_constants.dart';
import 'package:store_app/features/home/model/product_model.dart';

abstract class IHomeService {
  late final Dio _dio;

  IHomeService(Dio dio) {
    _dio = dio;
  }
  Future<List<Products>?> fetchUsers();
}

class HomeService extends IHomeService {
  HomeService(Dio dio) : super(dio);

  @override
  Future<List<Products>?> fetchUsers() async {
    final response = await _dio.get(ApiConstants.destiantionUrl);

    if (response.statusCode == HttpStatus.ok) {
      final responses = response.data;
      if (responses is List) {
        return responses.map((e) => Products.fromJson(e)).toList();
      }
    }

    return null;
  }
}
