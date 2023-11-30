abstract class AudioStates {}

class InitialAudioState extends AudioStates {}

class LoadingDownloadAudioState extends AudioStates {}

class SuccessDownloadAudioState extends AudioStates {
  final String filePath;

  SuccessDownloadAudioState(this.filePath);
}

class ErrorDownloadAudioState extends AudioStates {
  final String error;
  ErrorDownloadAudioState(this.error);
}

class LoadingGetpathAudioState extends AudioStates {}

class CancelDownloadingState extends AudioStates {}
