import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:quran_app/core/contants/hive_boxes_name.dart';
import 'package:quran_app/core/services/get_it.dart';
import 'package:quran_app/core/services/services.dart';
import 'package:quran_app/features/listen/domain/entites/reciter_entity.dart';
import 'package:quran_app/features/mosaf/domain/repo/tafsser_repo.dart';
import 'package:quran_app/features/mosaf/presentation/manager/page_cubit/page_cubit.dart';
import 'package:quran_app/features/mosaf/presentation/manager/tafsser_cubit/tafsser_cubit.dart';
import 'package:quran_app/features/navbar/presentation/views/navbar_screen.dart';
import 'package:quran_app/core/services/notification_service.dart';
import 'package:quran_app/core/cache/shared_preference.dart';
import 'package:quran_app/core/styles/themes.dart';
import 'package:quran_app/features/listen/presentation/manager/player_cubit/player_cubit.dart';
import 'package:quran_app/features/notification/data/repo/notification_repo_imol.dart';
import 'package:quran_app/features/notification/presentation/manager/notification_cubit.dart';
import 'package:quran_app/features/search/presentation/manager/search_cubit.dart';
import 'package:quran_app/features/settings/presentation/manager/theme_cubit.dart';
import 'package:quran_app/features/settings/presentation/manager/theme_states.dart';
import 'package:quran_app/features/tasbih/data/models/tasbih_model.dart';
import 'package:quran_app/features/tasbih/data/repo/tasbih_repo_impl.dart';
import 'package:quran_app/features/tasbih/domain/use_cases/update_tasbih_use_case.dart';
import 'package:quran_app/features/tasbih/domain/use_cases/zero_count_tasabih_use_case.dart';
import 'package:quran_app/features/tasbih/presentation/manager/tasbih_cubit/tasbih_cubit.dart';
import 'core/utils/utils.dart';
import 'features/tasbih/domain/use_cases/add_new_tasbih_use_case.dart';
import 'features/tasbih/domain/use_cases/delete_tasbih_use_case.dart';
import 'generated/l10n.dart';
import 'core/shared/bloc_observer.dart';
import 'package:timezone/data/latest_all.dart' as tz;
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(ReciterEntityAdapter());
  await Hive.openBox<ReciterEntity>(reciterBox);
  Hive.registerAdapter(TasbihModelAdapter());
  await Hive.openBox<TasbihModel>(tasbihBox);
  tz.initializeTimeZones();
  NotificationService().initiNotification();
  Bloc.observer = MyBlocObserver();
  await cache_helper.init();
  setLocator();
  generateVerseOfDay();
  mainNotification();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => NotificationCubit(
            getIt.get<NotificationRepoImpl>(),
          ),
        ),
        BlocProvider(
          create: (context) => PageCubit(),
        ),
        BlocProvider(
          create: (context) => TafsserCubit(
            TafsserRepo(),
          ),
        ),
        BlocProvider(
          create: (context) => SearchCubit(),
        ),
        BlocProvider(
          create: (context) => PlayerCubit(),
        ),
        BlocProvider(
          create: (context) => TasbihCubit(
            getIt.get<TasbihRepoImpl>(),
            getIt.get<AddNewTasbihUseCase>(),
            getIt.get<DeleteTasbihUseCase>(),
            getIt.get<UpdateTasbihUseCase>(),
            getIt.get<ZeroCountTasabihUseCase>(),
          )..addDeaultTasabih(),
        ),
        BlocProvider(
          create: (context) => ThemeCubit()
            ..changeAppTheme(
              fromSP: cache_helper.getData(key: 'isdark') ?? false,
            ),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeStates>(
        builder: (context, state) {
          bool isDark = ThemeCubit.get(context).isDark;
          return MaterialApp(
            locale: const Locale('ar'),
            localizationsDelegates: const [
              S.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: S.delegate.supportedLocales,
            debugShowCheckedModeBanner: false,
            theme: isDark ? darkmode : lightmode,
            home: const NavBarScreen(),
          );
        },
      ),
    );
  }
}
