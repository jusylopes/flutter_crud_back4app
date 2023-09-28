import 'package:flutter/material.dart';
import 'package:flutter_crud_back4app/blocs/cep/enum/bloc_status.dart';
import 'package:flutter_crud_back4app/components/cep_form_field_register.dart';
import 'package:flutter_crud_back4app/components/text_form_field_register.dart';
import 'package:flutter_crud_back4app/models/cep_model.dart';
import 'package:flutter_crud_back4app/utils/colors.dart';
import '../blocs/cep/blocs_exports.dart';

class RegisterCepScreen extends StatefulWidget {
  const RegisterCepScreen({super.key});

  @override
  State<RegisterCepScreen> createState() => _RegisterCepScreenState();
}

class _RegisterCepScreenState extends State<RegisterCepScreen> {
  late final GlobalKey<FormState> _formKey;
  late final TextEditingController _cepController;
  late final TextEditingController _logradouroController;
  late final TextEditingController _complementoController;
  late final TextEditingController _bairroController;
  late final TextEditingController _localidadeController;
  late final TextEditingController _ufController;
  late final TextEditingController _ibgeController;
  late final TextEditingController _giaController;
  late final TextEditingController _dddController;
  late final TextEditingController _siafiController;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
    _cepController = TextEditingController();
    _logradouroController = TextEditingController();
    _complementoController = TextEditingController();
    _bairroController = TextEditingController();
    _localidadeController = TextEditingController();
    _ufController = TextEditingController();
    _ibgeController = TextEditingController();
    _giaController = TextEditingController();
    _dddController = TextEditingController();
    _siafiController = TextEditingController();
  }

  void _addAdress() {
    BlocProvider.of<CepBloc>(context).add(CreateCep(
        newCep: CepModel(
      cep: _cepController.text,
      logradouro: _logradouroController.text,
      complemento: _complementoController.text,
      bairro: _bairroController.text,
      localidade: _localidadeController.text,
      uf: _ufController.text,
      ibge: _ibgeController.text,
      gia: _giaController.text,
      ddd: _dddController.text,
      siafi: _siafiController.text,
    )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de CEP'),
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
                    child: TextFormFieldRegister(
                      textFormController: _ufController,
                      label: 'UF',
                      textInputType: TextInputType.text,
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
              BlocListener<CepBloc, CepState>(
                listener: (context, state) {
                  switch (state.status) {
                    case BlocStatus.initial:
                    case BlocStatus.loading:
                    case BlocStatus.success:
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Cadastro realizado com sucesso!'),
                        ),
                      );
                      _clearControllers();

                    case BlocStatus.error:
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                              'Erro ao realizar cadastro! ${state.errorMessage}'),
                        ),
                      );
                  }
                },
                child: Container(
                  width: double.infinity,
                  height: 50,
                  margin: const EdgeInsets.all(15),
                  child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _addAdress();
                        }
                      },
                      child: const Text('Cadastrar CEP')),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _clearControllers() {
    _cepController.clear();
    _logradouroController.clear();
    _complementoController.clear();
    _bairroController.clear();
    _localidadeController.clear();
    _ufController.clear();
    _ibgeController.clear();
    _giaController.clear();
    _dddController.clear();
    _siafiController.clear();
  }

  @override
  void dispose() {
    _cepController.dispose();
    _logradouroController.dispose();
    _complementoController.dispose();
    _bairroController.dispose();
    _localidadeController.dispose();
    _ufController.dispose();
    _ibgeController.dispose();
    _giaController.dispose();
    _dddController.dispose();
    _siafiController.dispose();
    super.dispose();
  }
}
