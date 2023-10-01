import 'package:flutter/material.dart';
import 'package:flutter_crud_back4app/blocs/enum/bloc_status.dart';
import 'package:flutter_crud_back4app/blocs/register/register_blocs_exports.dart';
import 'package:flutter_crud_back4app/components/cep_form_field_register.dart';
import 'package:flutter_crud_back4app/components/custom_dropdown_button.dart';
import 'package:flutter_crud_back4app/components/text_form_field_register.dart';
import 'package:flutter_crud_back4app/models/cep_model.dart';
import 'package:flutter_crud_back4app/utils/colors.dart';

class UpdateCepScreen extends StatefulWidget {
  final CepModel address;

  const UpdateCepScreen({
    Key? key,
    required this.address,
  }) : super(key: key);

  @override
  State<UpdateCepScreen> createState() => _UpdateCepScreenState();
}

class _UpdateCepScreenState extends State<UpdateCepScreen> {
  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _cepController;
  late final TextEditingController _logradouroController;
  late final TextEditingController _complementoController;
  late final TextEditingController _bairroController;
  late final TextEditingController _localidadeController;
  late final TextEditingController _ibgeController;
  late final TextEditingController _giaController;
  late final TextEditingController _dddController;
  late final TextEditingController _siafiController;
  String? _selectedStateAbbreviations;

  @override
  void initState() {
    super.initState();
    final CepModel address = widget.address;

    _formKey = GlobalKey<FormState>();
    _cepController = TextEditingController(text: address.cep);
    _logradouroController = TextEditingController(text: address.logradouro);
    _complementoController = TextEditingController(text: address.complemento);
    _bairroController = TextEditingController(text: address.bairro);
    _localidadeController = TextEditingController(text: address.localidade);
    _selectedStateAbbreviations = address.uf;
    _ibgeController = TextEditingController(text: address.ibge);
    _giaController = TextEditingController(text: address.gia);
    _dddController = TextEditingController(text: address.ddd);
    _siafiController = TextEditingController(text: address.siafi);
  }

  void _updateAdress() {
    BlocProvider.of<RegisterCepBloc>(context).add(UpdateCep(
        updatedCep: CepModel(
      objectId: widget.address.objectId,
      cep: _cepController.text,
      logradouro: _logradouroController.text,
      complemento: _complementoController.text,
      bairro: _bairroController.text,
      localidade: _localidadeController.text,
      uf: _selectedStateAbbreviations ?? '',
      ibge: _ibgeController.text,
      gia: _giaController.text,
      ddd: _dddController.text,
      siafi: _siafiController.text,
    )));
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Atualização de CEP'),
          leading: BackButton(
            onPressed: () => Navigator.of(context).pop(),
            color: AppColors.primaryColor,
          ),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(2),
            child: Container(
              color: AppColors.secondaryColor,
              height: 2,
            ),
          ),
          toolbarHeight: 80,
        ),
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                CepFormFieldRegister(formController: _cepController),
                TextFormFieldRegister(
                  textFormController: _logradouroController,
                  label: 'Logradouro',
                  textInputType: TextInputType.text,
                ),
                TextFormFieldRegister(
                  textFormController: _complementoController,
                  label: 'Complemento',
                  textInputType: TextInputType.text,
                ),
                TextFormFieldRegister(
                  textFormController: _bairroController,
                  label: 'Bairro',
                  textInputType: TextInputType.text,
                ),
                TextFormFieldRegister(
                  textFormController: _localidadeController,
                  label: 'Localidade',
                  textInputType: TextInputType.text,
                ),
                Row(
                  children: [
                    Expanded(
                      child: CustomDropdownButton(
                        value: _selectedStateAbbreviations,
                        onChanged: (newValue) {
                          setState(() {
                            _selectedStateAbbreviations = newValue;
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: TextFormFieldRegister(
                        textFormController: _dddController,
                        label: 'DDD',
                        textInputType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                TextFormFieldRegister(
                  textFormController: _ibgeController,
                  label: 'IBGE',
                  textInputType: TextInputType.number,
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextFormFieldRegister(
                        textFormController: _giaController,
                        label: 'GIA',
                        textInputType: TextInputType.number,
                      ),
                    ),
                    Expanded(
                      child: TextFormFieldRegister(
                        textFormController: _siafiController,
                        label: 'SIAFI',
                        textInputType: TextInputType.number,
                      ),
                    ),
                  ],
                ),
                BlocListener<RegisterCepBloc, RegisterCepState>(
                  listener: (context, state) {
                    switch (state.status) {
                      case BlocStatus.initial:
                      case BlocStatus.loading:
                      case BlocStatus.success:
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Atualização realizada com sucesso!'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                        return;
                      case BlocStatus.error:
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                'Erro ao realizar atualização! ${state.errorMessage}'),
                          ),
                        );
                        break;
                    }
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    margin: const EdgeInsets.all(15),
                    child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _updateAdress();
                            FocusScope.of(context).unfocus();
                          }
                        },
                        child: const Text('Atualizar endereço')),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _cepController.dispose();
    _logradouroController.dispose();
    _complementoController.dispose();
    _bairroController.dispose();
    _localidadeController.dispose();

    _ibgeController.dispose();
    _giaController.dispose();
    _dddController.dispose();
    _siafiController.dispose();
    super.dispose();
  }
}
