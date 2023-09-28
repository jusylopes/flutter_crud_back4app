import 'package:flutter/material.dart';
import 'package:flutter_crud_back4app/blocs/cep/blocs_exports.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CepFormField extends StatefulWidget {
  const CepFormField({super.key});

  @override
  State<CepFormField> createState() => _CepFormFieldState();
}

class _CepFormFieldState extends State<CepFormField> {
  late final GlobalKey<FormState> _formKey;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
  }

  _submitForm() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
    }
  }

  _submitCep(String? value) {
    if (_formKey.currentState?.validate() ?? false) {
      BlocProvider.of<CepBloc>(context).add(GetCep(cep: value ?? ''));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: TextFormField(
        autofocus: false,
        keyboardType: TextInputType.number,
        textInputAction: TextInputAction.done,
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
            hintStyle:
                const TextStyle(fontSize: 18, fontWeight: FontWeight.w400)),
        inputFormatters: [
          MaskTextInputFormatter(
            mask: '#####-###',
            filter: {"#": RegExp(r'[0-9]')},
          ),
        ],
        onSaved: (value) => _submitCep(value),
        onFieldSubmitted: (value) => _submitCep(value),
        validator: (value) {
          if (value == null || value.isEmpty || value.length != 9) {
            return 'Formato de CEP inválido';
          }
          return null;
        },
      ),
    );
  }
}
