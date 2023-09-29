import 'package:flutter/material.dart';
import 'package:flutter_crud_back4app/blocs/cep/blocs_exports.dart';
import 'package:flutter_crud_back4app/blocs/cep/enum/bloc_status.dart';
import 'package:flutter_crud_back4app/components/error_message_app.dart';
import 'package:flutter_crud_back4app/models/cep_model.dart';
import 'package:flutter_crud_back4app/utils/colors.dart';

class HistoryScreen extends StatefulWidget {
  const HistoryScreen({super.key});

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<CepBloc>(context).add(const GetAllCeps());
  }

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
              switch (state.status) {
                case BlocStatus.initial:
                  return const Center();
                case BlocStatus.loading:
                  return const CircularProgressIndicator();
                case BlocStatus.success:
                  final List<CepModel> addressList = state.data;

                  return ListView.builder(
                      itemCount: state.data.length,
                      itemBuilder: (context, index) {
                        final CepModel address = addressList[index];

                        Text(
                          address.bairro,
                          style: Theme.of(context).textTheme.titleMedium,
                        );
                        return null;
                      });
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
