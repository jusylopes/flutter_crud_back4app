part of 'register_cep_bloc.dart';

class RegisterCepState<T> extends Equatable {
  const RegisterCepState({
    required this.status,
    this.data,
    this.errorMessage,
    this.isEmpty = false,
  });

  final BlocStatus status;
  final T? data;
  final String? errorMessage;
  final bool isEmpty;

  RegisterCepState copyWith({
    BlocStatus? status,
    T? data,
    String? errorMessage,
    final bool? isEmpty,
  }) {
    return RegisterCepState(
      status: status ?? this.status,
      data: data ?? this.data,
      errorMessage: errorMessage ?? this.errorMessage,
      isEmpty: isEmpty ?? this.isEmpty,
    );
  }

  @override
  List<Object?> get props => [status, data, errorMessage, isEmpty];
}
