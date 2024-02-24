part of 'counter_bloc.dart';

@freezed
class CounterEvent with _$CounterEvent {
  const factory CounterEvent.start() = CounterStartEvent;
  const factory CounterEvent.Reset() = CounterResetEvent;
  const factory CounterEvent.Increment() = CounterIncrementEvent;
}
// abstract class CounterEvent extends Equatable {
//   const CounterEvent();

//   @override
//   List<Object?> get props => [];
// }

// class CounterStartEvent extends CounterEvent {}

// class CounterResetEvent extends CounterEvent {}

// class CounterIncrementEvent extends CounterEvent {}
