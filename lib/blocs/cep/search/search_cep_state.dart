part of 'search_cep_bloc.dart';

class SearchCepState extends Equatable {
  const SearchCepState({
    required this.status,
    this.address,
    this.errorMessage,
    this.isEmpty = false,
  });

  final BlocStatus status;
  final CepModel? address;
  final String? errorMessage;
  final bool isEmpty;

  SearchCepState copyWith({
    BlocStatus? status,
    CepModel? address,
    String? errorMessage,
    bool? isEmpty,
  }) {
    return SearchCepState(
      status: status ?? this.status,
      address: address ?? this.address,
      errorMessage: errorMessage ?? this.errorMessage,
      isEmpty: isEmpty ?? this.isEmpty,
    );
  }

  @override
  List<Object?> get props => [status, address, errorMessage, isEmpty];
}
