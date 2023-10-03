part of 'search_cep_bloc.dart';

class SearchCepState extends Equatable {
  const SearchCepState({
    required this.status,
    this.address,
    this.errorMessage,
    this.isRegisteredCep = false,
  });

  final BlocStatus status;
  final CepModel? address;
  final String? errorMessage;
  final bool isRegisteredCep;

  SearchCepState copyWith({
    BlocStatus? status,
    CepModel? address,
    String? errorMessage,
    bool? isRegistered,
  }) {
    return SearchCepState(
      status: status ?? this.status,
      address: address ?? this.address,
      errorMessage: errorMessage ?? this.errorMessage,
      isRegisteredCep: isRegistered ?? isRegisteredCep,
    );
  }

  @override
  List<Object?> get props => [status, address, errorMessage, isRegisteredCep];
}
