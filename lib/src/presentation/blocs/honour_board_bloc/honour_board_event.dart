part of 'honour_board_bloc.dart';

abstract class HonourBoardEvent extends Equatable {
  const HonourBoardEvent();

  @override
  List<Object> get props => [];
}

class LoadHonourBoardEvent extends HonourBoardEvent {}
