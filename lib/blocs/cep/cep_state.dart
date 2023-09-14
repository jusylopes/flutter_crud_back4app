part of 'cep_bloc.dart';

class CepState extends Equatable {
  const CepState({
    required this.status,
    this.address,
    this.errorMessage,
  });

  final BlocStatus status;
  final CepModel? address;
  final String? errorMessage;

  CepState copyWith({
    BlocStatus? status,
    CepModel? address,
    String? errorMessage,
  }) {
    return CepState(
      status: status ?? this.status,
      address: address ?? this.address,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, address, errorMessage];
}
