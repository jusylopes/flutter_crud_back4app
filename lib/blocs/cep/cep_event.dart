part of 'cep_bloc.dart';

abstract class CepEvent extends Equatable {
  const CepEvent();
}

class GetCep extends CepEvent {
  final String cep;
  const GetCep({
    required this.cep,
  });

  @override
  List<Object> get props => [cep];
}

class CreateCep extends CepEvent {
  final String cep;
  const CreateCep({
    required this.cep,
  });

  @override
  List<Object> get props => [cep];
}

class GetAllCeps extends CepEvent {
  final List<String> cep;
  const GetAllCeps({
    required this.cep,
  });

  @override
  List<Object> get props => [cep];
}

class UpdateCep extends CepEvent {
  final String cep;
  const UpdateCep({
    required this.cep,
  });

  @override
  List<Object> get props => [cep];
}

class DeleteCep extends CepEvent {
  final String cep;
  const DeleteCep({
    required this.cep,
  });

  @override
  List<Object> get props => [cep];
}
