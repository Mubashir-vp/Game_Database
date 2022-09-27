part of 'gamebloc_bloc.dart';

abstract class GameblocEvent extends Equatable {
  const GameblocEvent();

  @override
  List<Object> get props => [];
}
class LoadData extends GameblocEvent {
   final GameModel? game;
 const LoadData({this.game} );

 @override
  List<Object> get props => [game!];
}