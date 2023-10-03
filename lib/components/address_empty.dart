import 'package:flutter/material.dart';
import 'package:flutter_crud_back4app/utils/colors.dart';

class AddressEmpty extends StatelessWidget {
  const AddressEmpty({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.error,
          size: 40.0,
          color: AppColors.secondaryColor,
        ),
        Text(
          'Cep não encontrado...',
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ],
    );
  }
}
