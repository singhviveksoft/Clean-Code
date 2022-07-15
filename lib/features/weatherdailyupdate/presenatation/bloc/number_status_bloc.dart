import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domain/entities/dailyweatherupdate.dart';
import '../../domain/usescase/dailyweatherupdateUsescase.dart';

part 'number_status_event.dart';
part 'number_status_state.dart';

class NumberStatusBloc extends Bloc<NumberStatusEvent, NumberStatusState> {
  NumberUsesCase usesCase;
  NumberStatusBloc({required this.usesCase})
      : super(NumberStatusLoadingState()) {
   
   
    on<NumberStatusEvent>((event, emit) async {
      if (event is GetNumberEvent) {
        emit(NumberStatusLoadingState());

        final result = await usesCase.execute();

        result.fold((failure) {
          emit(NumberStatusErrorSatate());
        }, (onData) {
          emit(NumberStatusLoadedState(entities: onData));
        });
      }
    });
  }
}
