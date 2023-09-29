part of 'register_cep_bloc.dart';

abstract class RegisterCepEvent extends Equatable {
  const RegisterCepEvent();
}

class CreateCep extends RegisterCepEvent {
  final CepModel newCep;
  const CreateCep({
    required this.newCep,
  });

  @override
  List<Object> get props => [newCep];
}

class GetAllCeps extends RegisterCepEvent {
  const GetAllCeps();

  @override
  List<Object> get props => [];
}

class UpdateCep extends RegisterCepEvent {
  final UpdateCep updateCep;
  const UpdateCep({
    required this.updateCep,
  });

  @override
  List<Object> get props => [updateCep];
}

class DeleteCep extends RegisterCepEvent {
  const DeleteCep();

  @override
  List<Object> get props => [];
}
