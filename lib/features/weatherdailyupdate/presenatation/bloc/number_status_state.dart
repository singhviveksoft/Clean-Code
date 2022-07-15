part of 'number_status_bloc.dart';

abstract class NumberStatusState extends Equatable {
  const NumberStatusState();

  @override
  List<Object> get props => [];
}

class NumberStatusLoadingState extends NumberStatusState {}

class NumberStatusLoadedState extends NumberStatusState {
  NumberEntities entities;
  NumberStatusLoadedState({required this.entities});
}

class NumberStatusErrorSatate extends NumberStatusState {}
