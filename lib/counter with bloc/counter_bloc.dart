import 'package:broadway_example_ui/counter%20with%20bloc/counter_event.dart';
import 'package:broadway_example_ui/counter%20with%20bloc/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterState(0)) {
    on<Increament>((event, emit) {
      emit(CounterState(state.value + 1));
    });
    on<Decrement>((event, emit) {
      emit(CounterState(state.value - 1));
    });
  }
}
