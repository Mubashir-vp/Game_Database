part of 'gamebloc_bloc.dart';

abstract class GameblocState extends Equatable {
  const GameblocState();

  @override
  List<Object> get props => [];
}

class DataLoading extends GameblocState {}

class DataLoaded extends GameblocState {
  final List<GameModel> gameModel;
  const DataLoaded({required this.gameModel});
  @override
  List<Object> get props => [gameModel];
}

class ErrorState extends GameblocState {
  final String errorMessage;
  const ErrorState({required this.errorMessage});
}
