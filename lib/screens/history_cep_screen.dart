import 'package:flutter/material.dart';
import 'package:flutter_crud_back4app/blocs/enum/bloc_status.dart';
import 'package:flutter_crud_back4app/blocs/register/register_blocs_exports.dart';
import 'package:flutter_crud_back4app/components/error_message_app.dart';
import 'package:flutter_crud_back4app/models/cep_model.dart';
import 'package:flutter_crud_back4app/screens/update_cep_screen.dart';
import 'package:flutter_crud_back4app/utils/assets_manager.dart';
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
    BlocProvider.of<RegisterCepBloc>(context).add(const GetAllCeps());
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
          child: BlocBuilder<RegisterCepBloc, RegisterCepState>(
            builder: (context, state) {
              switch (state.status) {
                case BlocStatus.initial:
                case BlocStatus.loading:
                  return const CircularProgressIndicator();
                case BlocStatus.success:
                  if (state.data == null || state.data.isEmpty) {
                    return Text(
                      'Nenhum endereço cadastrado.',
                      style: Theme.of(context).textTheme.titleMedium,
                    );
                  }

                  return ListView.builder(
                    itemCount: state.data.length,
                    itemBuilder: (context, index) {
                      final CepModel address = state.data[index];

                      return ListTile(
                        contentPadding: const EdgeInsets.all(10),
                        leading: Image.asset(AssetsManager.imageIconSearch),
                        title: Text(
                          address.cep,
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        subtitle: Text(
                          address.bairro,
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                        trailing: Wrap(
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => UpdateCepScreen(
                                              address: address,
                                            )),
                                  );
                                },
                                icon: const Icon(Icons.edit)),
                            IconButton(
                                onPressed: () {
                                  _confirmDismissDialog(
                                      context: context,
                                      objectId: address.objectId!);
                                },
                                icon: const Icon(Icons.delete))
                          ],
                        ),
                      );
                    },
                  );
                case BlocStatus.error:
                  return ErrorMessageViaCep(
                    errorMessage: state.errorMessage!,
                  );
              }
            },
          ),
        ));
  }

  Future<bool?> _confirmDismissDialog(
      {required BuildContext context, required String objectId}) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmar'),
          content:
              const Text('Tem certeza de que deseja remover este endereço?'),
          actions: <Widget>[
            TextButton(
                onPressed: () {
                  BlocProvider.of<RegisterCepBloc>(context)
                      .add(DeleteCep(objectId));
                  Navigator.of(context).pop(true);
                },
                child: const Text('REMOVER')),
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: const Text('CANCELAR'),
            ),
          ],
        );
      },
    );
  }
}
