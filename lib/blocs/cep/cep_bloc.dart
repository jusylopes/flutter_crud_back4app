import 'package:equatable/equatable.dart';
import 'package:flutter_crud_back4app/blocs/cep/blocs_exports.dart';
import 'package:flutter_crud_back4app/models/cep_model.dart';
import 'package:flutter_crud_back4app/blocs/cep/enum/bloc_status.dart';
import 'package:flutter_crud_back4app/repositories/cep_repository.dart';

part 'cep_event.dart';
part 'cep_state.dart';

class CepBloc extends Bloc<CepEvent, CepState> {
  CepBloc({required this.repository})
      : super(const CepState(status: BlocStatus.initial)) {
    on<GetCep>(_onGetCep);
    on<GetAllCeps>(_onGetAllCeps);
    on<CreateCep>(_onAddCep);
    on<UpdateCep>(_onUpdateCep);
    on<DeleteCep>(_onDeleteCep);
  }

  final CepRepository repository;
  void _onGetCep(GetCep event, Emitter<CepState> emit) async {
    emit(state.copyWith(status: BlocStatus.loading));

    try {
      final CepModel address = await repository.fetchCep(cep: event.cep);
      if (isEmptyAddress(address)) {
        emit(state.copyWith(
          status: BlocStatus.success,
          address: address,
          isEmpty: true,
        ));
      } else {
        emit(state.copyWith(
          status: BlocStatus.success,
          isEmpty: false,
        ));
      }
    } catch (error) {
      emit(state.copyWith(
          status: BlocStatus.error,
          errorMessage: 'Error loading data ViaCep...'));
    }
  }

  void _onGetAllCeps(GetAllCeps event, Emitter<CepState> emit) {}

  void _onAddCep(CreateCep event, Emitter<CepState> emit) async {
    emit(state.copyWith(status: BlocStatus.loading));

    try {
      await repository.addCep(event.newCep);

      emit(state.copyWith(status: BlocStatus.success));
    } catch (error) {
      emit(state.copyWith(
        status: BlocStatus.error,
        errorMessage: '$error',
      ));
    }
  }

  void _onUpdateCep(UpdateCep event, Emitter<CepState> emit) {}
  void _onDeleteCep(DeleteCep event, Emitter<CepState> emit) {}

  bool isEmptyAddress(CepModel address) {
    return address.bairro.isEmpty || address.cep.isEmpty;
  }
}
