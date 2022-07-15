part of 'number_status_bloc.dart';

abstract class NumberStatusEvent extends Equatable {
  const NumberStatusEvent();

  @override
  List<Object> get props => [];
}

class GetNumberEvent extends NumberStatusEvent{}
