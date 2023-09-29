import 'package:equatable/equatable.dart';
import 'package:flutter_crud_back4app/blocs/cep/register/register_blocs_exports.dart';
import 'package:flutter_crud_back4app/models/cep_model.dart';
import 'package:flutter_crud_back4app/blocs/cep/enum/bloc_status.dart';
import 'package:flutter_crud_back4app/repositories/cep_repository.dart';

part 'register_cep_event.dart';
part 'register_cep_state.dart';

class RegisterCepBloc extends Bloc<RegisterCepEvent, RegisterCepState> {
  RegisterCepBloc({required this.repository})
      : super(const RegisterCepState(status: BlocStatus.initial)) {
    on<GetAllCeps>(_onGetAllCeps);
    on<CreateCep>(_onAddCep);
    on<UpdateCep>(_onUpdateCep);
    on<DeleteCep>(_onDeleteCep);
  }

  final CepRepository repository;

  void _onGetAllCeps(GetAllCeps event, Emitter<RegisterCepState> emit) async {
    emit(state.copyWith(status: BlocStatus.loading));

    try {
      final List<CepModel> allCeps = await repository.fetchAllCeps();
      emit(state.copyWith(status: BlocStatus.success, data: allCeps));
    } catch (error) {
      emit(state.copyWith(
          status: BlocStatus.error,
          errorMessage: 'Error loading data Back4App...'));
    }
  }

  void _onAddCep(CreateCep event, Emitter<RegisterCepState> emit) async {
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

  void _onUpdateCep(UpdateCep event, Emitter<RegisterCepState> emit) async {
    emit(state.copyWith(status: BlocStatus.loading));

    try {
       await repository.updateCep(event.updatedCep);

       emit(state.copyWith(status: BlocStatus.success));

    } catch (error) {
      emit(state.copyWith(
        status: BlocStatus.error,
        errorMessage: '$error',
      ));
    }
  }

  void _onDeleteCep(DeleteCep event, Emitter<RegisterCepState> emit) async {
    emit(state.copyWith(status: BlocStatus.loading));

    try {
      await repository.deleteCep(event.objectId); 

      emit(state.copyWith(status: BlocStatus.success));
    } catch (error) {
      emit(state.copyWith(
        status: BlocStatus.error,
        errorMessage: '$error',
      ));
    }
  }
}
