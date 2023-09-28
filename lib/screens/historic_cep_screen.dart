import 'package:flutter/material.dart';
import 'package:flutter_crud_back4app/blocs/cep/blocs_exports.dart';
import 'package:flutter_crud_back4app/blocs/cep/enum/bloc_status.dart';
import 'package:flutter_crud_back4app/components/error_message_app.dart';
import 'package:flutter_crud_back4app/utils/colors.dart';

class HistoricScreen extends StatelessWidget {
  const HistoricScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Endereços Cadastrados'),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(2),
            child: Container(
              color: AppColors.secondaryColor,
              height: 2,
            ),
          ),
          toolbarHeight: 80,
        ),
        body: Center(
          child: BlocBuilder<CepBloc, CepState>(
            builder: (context, state) {
              final address = state.address;

              switch (state.status) {
                case BlocStatus.initial:
                  return const Center();
                case BlocStatus.loading:
                  return const CircularProgressIndicator();
                case BlocStatus.success:
                  return ListView.builder(itemBuilder: itemBuilder);
                case BlocStatus.error:
                  return ErrorMessageViaCep(
                    errorMessage: state.errorMessage!,
                  );
              }
            },
          ),
        ));
  }
}
