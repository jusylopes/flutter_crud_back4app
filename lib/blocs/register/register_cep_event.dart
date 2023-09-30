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
  final CepModel updatedCep;
  const UpdateCep({
    required this.updatedCep,
  });

  @override
  List<Object> get props => [updatedCep];
}

class DeleteCep extends RegisterCepEvent {
  final String objectId;
  const DeleteCep(this.objectId);

  @override
  List<Object> get props => [objectId];
}
