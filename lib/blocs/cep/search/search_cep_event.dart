part of 'search_cep_bloc.dart';

abstract class SearchCepEvent extends Equatable {
  const SearchCepEvent();
}

class GetCep extends SearchCepEvent {
  final String cep;
  const GetCep({
    required this.cep,
  });

  @override
  List<Object> get props => [cep];
}
