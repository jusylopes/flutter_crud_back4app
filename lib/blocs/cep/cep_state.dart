part of 'cep_bloc.dart';

class CepState extends Equatable {
  const CepState({
    required this.status,
    this.address,
    this.errorMessage,
    this.isEmpty = false,
  });

  final BlocStatus status;
  final CepModel? address;
  final String? errorMessage;
  final bool isEmpty;

  CepState copyWith({
    BlocStatus? status,
    CepModel? address,
    String? errorMessage,
    final bool? isEmpty,
  }) {
    return CepState(
      status: status ?? this.status,
      address: address ?? this.address,
      errorMessage: errorMessage ?? this.errorMessage,
      isEmpty: isEmpty ?? this.isEmpty,
    );
  }

  @override
  List<Object?> get props => [status, address, errorMessage, isEmpty];
}
