import 'package:flutter/material.dart';
import 'package:flutter_crud_back4app/blocs/cep/blocs_exports.dart';
import 'package:flutter_crud_back4app/blocs/cep/enum/bloc_status.dart';
import 'package:flutter_crud_back4app/components/cep_form_field.dart';
import 'package:flutter_crud_back4app/components/cep_information_card.dart';
import 'package:flutter_crud_back4app/components/error_message_app.dart';
import 'package:flutter_crud_back4app/utils/assets_manager.dart';
import 'package:flutter_crud_back4app/utils/colors.dart';

class SearchCepScreen extends StatefulWidget {
  const SearchCepScreen({super.key});

  @override
  State<SearchCepScreen> createState() => _SearchCepScreenState();
}

class _SearchCepScreenState extends State<SearchCepScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
          appBar: AppBar(
            title: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Image.asset(AssetsManager.imageLogo),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 20),
                  child: CepFormField(),
                )
              ],
            ),
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(2),
              child: Container(
                color: AppColors.secondaryColor,
                height: 2,
              ),
            ),
            toolbarHeight: MediaQuery.of(context).size.height / 4,
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
                    if (state.isEmpty) {
                      return (const Text('NÃO CADASTRADO'));
                    } else {
                      return CepInformationCard(address: address!);
                    }

                  case BlocStatus.error:
                    return ErrorMessageViaCep(
                      errorMessage: state.errorMessage!,
                    );
                }
              },
            ),
          )),
    );
  }
}
