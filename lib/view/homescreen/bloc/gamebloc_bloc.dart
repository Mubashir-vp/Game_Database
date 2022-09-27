import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../core/data/services/httpservices.dart';
import '../../../core/models/game_model.dart';

part 'gamebloc_event.dart';
part 'gamebloc_state.dart';

class GameblocBloc extends Bloc<GameblocEvent, GameblocState> {
  GameblocBloc() : super(DataLoading()) {
      on<LoadData>(_loadData);
  }
  _loadData(
    LoadData event,
    Emitter<GameblocState> emit,
  ) async {
    try {
      var data = await HttpServices().loadData();
      emit(DataLoaded(gameModel: data));
    } on SocketException {
      emit(const ErrorState(errorMessage: "Network Error"));
    } catch (e) {
      emit(ErrorState(errorMessage: e.toString()));
    }
  }
}
