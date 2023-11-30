abstract class AzkarStates {}

class InitialAzkarState extends AzkarStates {}

class LoadingReadAzkarState extends AzkarStates {}

class SuccessReadAzkarState extends AzkarStates {
  final Map azkar;

  SuccessReadAzkarState(this.azkar);
}

class ErrorReadAzkarState extends AzkarStates {
  final String error;

  ErrorReadAzkarState(this.error);
}
