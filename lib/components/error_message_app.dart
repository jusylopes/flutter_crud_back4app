import 'package:flutter/material.dart';

class ErrorMessageViaCep extends StatelessWidget {
  const ErrorMessageViaCep({super.key, required this.errorMessage});

  final String errorMessage;

  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.center,
      errorMessage,
      style: Theme.of(context).textTheme.titleMedium,
    );
  }
}
