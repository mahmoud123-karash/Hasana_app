import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/cache/save_data.dart';
import 'package:quran_app/features/settings/presentation/manager/theme_states.dart';

class ThemeCubit extends Cubit<ThemeStates> {
  ThemeCubit() : super(InitialThemeState());
  static ThemeCubit get(context) => BlocProvider.of(context);

  bool isDark = false;
  void changeAppTheme({bool? fromSP}) {
    if (fromSP != null) {
      saveApptheme(fromSP);
      isDark = fromSP;
    } else {
      isDark = !isDark;
      saveApptheme(isDark);
    }
    emit(ChangeApThemeState());
  }
}
