import 'package:equatable/equatable.dart';
import 'package:flutter_crud_back4app/blocs/search/search_cep_blocs_exports.dart';
import 'package:flutter_crud_back4app/models/cep_model.dart';
import 'package:flutter_crud_back4app/blocs/enum/bloc_status.dart';
import 'package:flutter_crud_back4app/repositories/cep_repository.dart';

part 'search_cep_event.dart';
part 'search_cep_state.dart';

class SearchCepBloc extends Bloc<SearchCepEvent, SearchCepState> {
  SearchCepBloc({required this.repository})
      : super(const SearchCepState(status: BlocStatus.initial)) {
    on<GetCep>(_onGetCep);
  }

  final CepRepository repository;

  void _onGetCep(GetCep event, Emitter<SearchCepState> emit) async {
    emit(state.copyWith(status: BlocStatus.loading));

    try {
      final CepModel address = await repository.fetchCep(cep: event.cep);

      if (isEmptyAddress(address)) {
        emit(state.copyWith(
          status: BlocStatus.success,
          isEmpty: true,
        ));
      } else {
        emit(state.copyWith(
          status: BlocStatus.success,
          address: address,
          isEmpty: false,
        ));
      }
    } catch (error) {
      emit(state.copyWith(
          status: BlocStatus.error,
          errorMessage: 'Error loading data ViaCep...'));
    }
  }

  bool isEmptyAddress(CepModel address) {
    return address.bairro.isEmpty || address.cep.isEmpty;
  }
}
