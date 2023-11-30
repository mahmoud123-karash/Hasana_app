abstract class SwiperStates {}

class InitialSwiperState extends SwiperStates {}

class LoadingIncrementState extends SwiperStates {}

class SuccessIncrementState extends SwiperStates {}

class ErrorIncrementState extends SwiperStates {
  final String error;

  ErrorIncrementState(this.error);
}

class LoadingDecrementState extends SwiperStates {}

class SuccessDecrementState extends SwiperStates {}

class ErrorDecrementState extends SwiperStates {
  final String error;

  ErrorDecrementState(this.error);
}

class LoadingShareState extends SwiperStates {}

class SuccessShareState extends SwiperStates {}

class ErrorShareState extends SwiperStates {
  final String error;

  ErrorShareState(this.error);
}
