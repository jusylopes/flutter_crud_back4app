import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_crud_back4app/blocs/register/register_blocs_exports.dart';
import 'package:flutter_crud_back4app/blocs/search/search_cep_blocs_exports.dart';
import 'package:flutter_crud_back4app/repositories/cep_repository.dart';
import 'package:flutter_crud_back4app/screens/home_screen.dart';
import 'package:flutter_crud_back4app/utils/theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RegisterCepBloc>(
          create: (_) => RegisterCepBloc(
            repository: CepRepository(
              dio: Dio(),
            ),
          ),
        ),
        BlocProvider<SearchCepBloc>(
          create: (_) => SearchCepBloc(
            repository: CepRepository(
              dio: Dio(),
            ),
          ),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Search Cep',
        theme: AppTheme.light,
        home: const HomeScreen(),
      ),
    );
  }
}
