abstract class DownloadStates {}

class InitialDownloadState extends DownloadStates {}

class LoadingDownloadState extends DownloadStates {
  final int count;

  LoadingDownloadState(this.count);
}

class SuccessDownloadState extends DownloadStates {
  final List<String> paths;

  SuccessDownloadState(this.paths);
}

class ErrorDownloadState extends DownloadStates {
  final String message;

  ErrorDownloadState(this.message);
}
