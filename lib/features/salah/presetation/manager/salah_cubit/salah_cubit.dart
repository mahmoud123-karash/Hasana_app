import 'package:adhan/adhan.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:quran_app/core/cache/save_data.dart';
import 'package:quran_app/core/cache/shared_preference.dart';
import 'package:quran_app/core/utils/utils.dart';
import 'package:quran_app/features/salah/domain/use_cases/location_use_case.dart';
import 'package:quran_app/features/salah/presetation/manager/salah_cubit/salah_states.dart';

import '../../../../../core/services/services.dart';

class SalahCubit extends Cubit<SalahStates> {
  SalahCubit(this.locationUseCase) : super(InitialSalahState());
  static SalahCubit get(context) => BlocProvider.of(context, listen: false);
  final LocationUseCase locationUseCase;

  double cachedLatitude = cache_helper.getData(key: 'latitude') ?? 0.0;
  double cachedLongitude = cache_helper.getData(key: 'longitude') ?? 0.0;

  void getMyPosition() async {
    if (cachedLatitude != 0.0) {
      getSalahTimes();
    } else {
      emit(LoadingGetPositionState());
      var result = await locationUseCase.locate();
      result.fold((warning) {
        emit(ErrorGetPositionState(warning.message));
      }, (position) async {
        saveLatitude(position.latitude);
        saveLongitude(position.longitude);
        getSalahTimes();
      });
    }
  }

  PrayerTimes getMyCoordinate() {
    final myCoordinates = Coordinates(cachedLatitude, cachedLongitude);
    final params = CalculationMethod.egyptian.getParameters();
    final prayerTimes = PrayerTimes.today(myCoordinates, params);
    return prayerTimes;
  }

  void getSalahTimes() async {
    PrayerTimes prayer = getMyCoordinate();
    setSalwatNotifications();
    final sunnahTimes = SunnahTimes(prayer);
    int hours = duration(prayer).inHours;
    int minutes = duration(prayer).inMinutes - (60 * hours);
    List<String> salahTimes = [
      DateFormat.jm().format(prayer.fajr),
      DateFormat.jm().format(prayer.sunrise),
      DateFormat.jm().format(prayer.dhuhr),
      DateFormat.jm().format(prayer.asr),
      DateFormat.jm().format(prayer.maghrib),
      DateFormat.jm().format(prayer.isha),
      DateFormat.jm().format(sunnahTimes.lastThirdOfTheNight),
      nextSalah(prayer),
      prayer.nextPrayer().index.toString(),
      hours.toString(),
      minutes.toString(),
    ];
    emit(GetPrayerTimesState(salahTimes));
  }

  void updatePosition(context) async {
    emit(LoadingGetPositionState());
    var result = await locationUseCase.locate();
    result.fold((warning) {
      emit(ErrorGetPositionState(warning.message));
    }, (position) async {
      saveLatitude(position.latitude);
      saveLongitude(position.longitude);
      //mysnackbar(context: context, text: S.of(context).updated);
      getSalahTimes();
    });
  }
}
