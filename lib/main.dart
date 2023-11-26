
import 'package:bloc/bloc.dart';

// class CounterCubit extends Cubit<int> {
//   CounterCubit():super(0);
//
//   void increment() => emit(state +1);
//   void decrement() => emit(state -1);
// }

enum CounterEvent {increment, decrement}

class CounterBloc extends Bloc<CounterEvent, int>{
  CounterBloc() : super(0);

  @override
  Stream<int> mapEventToState(CounterEvent event) async*{
    switch(event){
      case CounterEvent.increment:
        yield state +1;
        break;
      case CounterEvent.decrement:
        yield state -1;
        break;
    }
  }


}

Future<void> main(List<String> args) async {
  /** Cubit Testing section
  final cubit = CounterCubit();
  // print(cubit.state);
  // cubit.increment();
  // print(cubit.state);
  // cubit.increment();
  // cubit.increment();
  // cubit.increment();
  // print(cubit.state);
  // cubit.decrement();
  // print(cubit.state);

  final streamSubscription = cubit.listen(print);

  cubit.increment();
  cubit.increment();
  cubit.increment();
  cubit.increment();
  cubit.decrement(); **/

  final bloc = CounterBloc();
  final streamSubscription = bloc.listen(print);

  bloc.add(CounterEvent.increment);
  bloc.add(CounterEvent.increment);
  bloc.add(CounterEvent.decrement);

  await Future.delayed(Duration.zero);
  streamSubscription.cancel();
  bloc.close();
}
