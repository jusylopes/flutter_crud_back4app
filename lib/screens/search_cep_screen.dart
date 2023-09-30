import 'package:flutter/material.dart';
import 'package:flutter_crud_back4app/blocs/enum/bloc_status.dart';
import 'package:flutter_crud_back4app/blocs/search/search_cep_blocs_exports.dart';
import 'package:flutter_crud_back4app/components/cep_information_card.dart';
import 'package:flutter_crud_back4app/components/error_message_app.dart';
import 'package:flutter_crud_back4app/screens/register_cep_screen.dart';
import 'package:flutter_crud_back4app/utils/assets_manager.dart';
import 'package:flutter_crud_back4app/utils/colors.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class SearchCepScreen extends StatefulWidget {
  const SearchCepScreen({super.key});

  @override
  State<SearchCepScreen> createState() => _SearchCepScreenState();
}

class _SearchCepScreenState extends State<SearchCepScreen> {
  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _cepController;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _cepController = TextEditingController();
  }

  _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
    }
  }

  _submitCep(String? value) {
    if (_formKey.currentState?.validate() ?? false) {
      FocusScope.of(context).unfocus();
      BlocProvider.of<SearchCepBloc>(context).add(GetCep(cep: value ?? ''));
    }
  }

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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(AssetsManager.imageLogo),
                      const SizedBox(width: 10),
                      Text(
                        'Busca CEP',
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 20),
                  child: Form(
                    key: _formKey,
                    child: TextFormField(
                      autofocus: false,
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.done,
                      controller: _cepController,
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12.0),
                          ),
                          hintText: 'Informe um cep*',
                          suffixIcon: IconButton(
                            iconSize: 35,
                            onPressed: _submitForm,
                            icon: const Icon(Icons.search),
                          ),
                          hintStyle: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w400)),
                      inputFormatters: [
                        MaskTextInputFormatter(
                          mask: '#####-###',
                          filter: {"#": RegExp(r'[0-9]')},
                        ),
                      ],
                      onSaved: (value) => _submitCep(value),
                      onFieldSubmitted: (value) => _submitCep(value),
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            value.length != 9) {
                          return 'Formato de CEP inválido';
                        }
                        return null;
                      },
                    ),
                  ),
                ),
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
            child: BlocBuilder<SearchCepBloc, SearchCepState>(
              builder: (context, state) {
                switch (state.status) {
                  case BlocStatus.initial:
                    return const Center();
                  case BlocStatus.loading:
                    return const CircularProgressIndicator();
                  case BlocStatus.success:
                    if (state.isEmpty) {
                      return AddressEmpty(cepController: _cepController);
                    } else {
                      return CepInformationCard(address: state.address!);
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

  @override
  void dispose() {
    _cepController.dispose();
    super.dispose();
  }
}

class AddressEmpty extends StatelessWidget {
  const AddressEmpty({
    super.key,
    required TextEditingController cepController,
  }) : _cepController = cepController;

  final TextEditingController _cepController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'CEP não encontrado',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        Container(
          width: 200,
          height: 50,
          margin: const EdgeInsets.all(15),
          child: ElevatedButton(
            child: const Text(
              'Cadastrar CEP',
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => RegisterCepScreen(
                          inicialCep: _cepController.text,
                        )),
              );
            },
          ),
        )
      ],
    );
  }
}
