import 'dart:async';

import 'package:bloc/bloc.dart';

import '../../constants/enums.dart';
import 'internet_cubit.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  final InternetCubit internetCubit;

  StreamSubscription? internetStreamSubscription;

  CounterCubit({required this.internetCubit})
      : super(CounterState(counterValue: 0, isIncrement: false)) {
    internetStreamSubscription = internetCubit.stream.listen((internetState) {
      if (internetState is InternetConnected &&
          internetState.connectionType == ConnectionType.Wifi) {
        increment();
      } else if (internetState is InternetConnected &&
          internetState.connectionType == ConnectionType.Mobile) {
        decrement();
      }
    });
  }

  void increment() => emit(
      CounterState(counterValue: state.counterValue + 1, isIncrement: true));

  void decrement() => emit(
      CounterState(counterValue: state.counterValue - 1, isIncrement: false));

  @override
  Future<void> close() {
    internetStreamSubscription!.cancel();
    return super.close();
  }
}
