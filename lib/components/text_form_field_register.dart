import 'package:flutter/material.dart';

class TextFormFieldRegister extends StatelessWidget {
  const TextFormFieldRegister({
    super.key,
    required this.label,
    required this.textFormController,
    required this.textInputType,
  });

  final TextEditingController textFormController;
  final String label;
  final TextInputType textInputType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      child: TextFormField(
        controller: textFormController,
        keyboardType: textInputType,
        textInputAction: TextInputAction.next,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          labelText: label,
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
      ),
    );
  }
}
