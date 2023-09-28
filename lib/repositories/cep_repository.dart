import 'package:dio/dio.dart';
import 'package:flutter_crud_back4app/models/cep_model.dart';

class CepRepository {
  final Dio dio;

  CepRepository({required this.dio}) {
    dio.options.baseUrl = 'https://parseapi.back4app.com/classes/ceps';
    dio.options.headers['X-Parse-Application-Id'] =
        'ERhH6AhhVuC3E6GQUdfJyhKPGkix1tUn2za6Aphi';
    dio.options.headers['X-Parse-REST-API-Key'] =
        'WKfHT2wViz4eoMpY3w3bGZgs76s6dwO7ROhDxB8L';
    dio.options.headers['Content-Type'] = 'application/json';
  }

  Future<CepModel> fetchCep({required String cep}) async {
    try {
      Response response = await dio.get('https://viacep.com.br/ws/$cep/json');
      final data = response.data;

      return CepModel.fromMap(data);
    } on DioException catch (e) {
      if (e.response != null) {
        throw Exception('${e.response?.statusCode}');
      } else {
        throw Exception('${e.message}');
      }
    }
  }

  Future<void> addCep(CepModel newCep) async {
    try {
      await dio.post(
        '/',
        data: newCep.toJson(),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<List<CepModel>> getListCep() async {
    try {
      Response response = await dio.get('/');
      final data = response.data;
      final List<CepModel> ceps =
          data.map((item) => CepModel.fromJson(item)).toList();

      return ceps;
    } catch (e) {
      rethrow;
    }
  }
}
