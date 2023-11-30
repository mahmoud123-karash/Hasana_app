abstract class SalahStates {}

class InitialSalahState extends SalahStates {}

class GetPrayerTimesState extends SalahStates {
  final List<String> times;

  GetPrayerTimesState(this.times);
}

class LoadingGetPositionState extends SalahStates {}

class SuccessGetPositionState extends SalahStates {}

class ErrorGetPositionState extends SalahStates {
  final String message;

  ErrorGetPositionState(this.message);
}
