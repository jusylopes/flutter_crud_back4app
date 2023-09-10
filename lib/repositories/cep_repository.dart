import 'package:dio/dio.dart';
import 'package:flutter_crud_back4app/models/cep_model.dart';

class CepRepository {
  final Dio dio;

  CepRepository({required this.dio});

  Future<CepModel> fetchCep({required String cep}) async {
    try {
      Response response = await dio.get('https://viacep.com.br/ws/$cep/json');
      final data = response.data;

      return CepModel.fromJson(data);
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception('${e.response?.statusCode}');
      } else {
        throw Exception('${e.message}');
      }
    }
  }
}
