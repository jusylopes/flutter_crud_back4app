// import 'package:dio/dio.dart';
// import 'package:flutter_crud_back4app/models/cep_model.dart';
// import 'package:flutter_crud_back4app/repositories/cep_repository.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';

// class MockDio extends Mock implements Dio {}

// void main() {
//   group('Cep Repository', () {
//     late MockDio dio;
//     late CepRepository repository;

//     final response = Response(
//       statusCode: 200,
//       data: {
//         'cep': '42809382',
//         'logradouro': 'Rua Exemplo',
//         'bairro': 'Bairro Teste',
//       },
//       requestOptions: RequestOptions(path: '/'),
//     );

//     setUp(() {
//       dio = MockDio();
//       repository = CepRepository(dio: dio);
//       when(() => dio.get(any())).thenAnswer((_) async => response);
//     });

//     test('fetchCep should return CepModel on successful request', () async {
//       final response = await repository.fetchCep(cep: '42809382');

//       expect(response, isA<String>());
//     });
//   });
// }
