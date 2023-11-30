import 'package:quran_app/features/urls/data/models/url_model.dart';

abstract class UrlStates {}

class InitialUrlState extends UrlStates {}

class LoadingGetUrlState extends UrlStates {}

class SuccessGetUrlState extends UrlStates {
  final List<UrlModel> urls;

  SuccessGetUrlState(this.urls);
}

class ErrorGetUrlState extends UrlStates {
  final String error;

  ErrorGetUrlState(this.error);
}
