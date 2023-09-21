import 'package:flutter/material.dart';
import 'package:flutter_crud_back4app/components/animated_icon_search.dart';
import 'package:flutter_crud_back4app/models/cep_model.dart';

class CepInformationCard extends StatelessWidget {
  const CepInformationCard({
    super.key,
    required this.address,
  });

  final CepModel address;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedIconSearch(
            sizeIcon: MediaQuery.of(context).size.height / 8,
          ),
          Text(
            address.cep,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Text(
            address.bairro,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            address.logradouro,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            '${address.localidade} - ${address.uf}',
            style: Theme.of(context).textTheme.titleMedium,
          ),
          Text(
            'DDD ${address.ddd}',
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}
