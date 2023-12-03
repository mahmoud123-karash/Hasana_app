import 'package:flutter/material.dart';
import 'package:quran_app/core/cache/shared_preference.dart';
import 'package:quran_app/features/home/presentation/views/widgets/app_bar_title_widget.dart';
import 'package:quran_app/features/home/presentation/views/widgets/ayat_day_widget.dart';
import 'package:quran_app/features/home/presentation/views/widgets/content_item_listview_widget.dart';
import 'package:quran_app/features/home/presentation/views/widgets/content_text_widget.dart';
import 'package:quran_app/features/home/presentation/views/widgets/home_text_widget.dart';
import 'package:quran_app/features/home/presentation/views/widgets/badge_notification_icon_widget.dart';
import 'package:quran_app/features/listen/presentation/manager/player_cubit/player_cubit.dart';
import '../../../../core/contants/constants.dart';
import '../../../../core/utils/firebase_messging.dart';
import '../../../../generated/l10n.dart';
import '../../../notification/presentation/manager/notification_cubit.dart';
import 'widgets/home_audio_builder_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with WidgetsBindingObserver {
  @override
  void initState() {
    NotificationCubit.get(context).getNotification();
    onMessage();
    bool isSub = cache_helper.getData(key: 'issub') ?? true;
    if (isSub) {
      subscribeToTopic();
    }
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        print("app in resumed");
        break;
      case AppLifecycleState.inactive:
        print("app in inactive");
        break;
      case AppLifecycleState.paused:
        PlayerCubit.get(context).player.dispose();
        print("app in paused");
        break;
      case AppLifecycleState.detached:
        print("app in detached");
        break;
      case AppLifecycleState.hidden:
      // TODO: Handle this case.
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    String address = cache_helper.getData(key: 'address') ?? '';
    return Scaffold(
      appBar: AppBar(
        title: const AppBarTitleWidget(),
        actions: const [
          BadgeNotificationIconWidget(),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          children: [
            if (address != '')
              HomeTextWidget(
                icon: Icons.location_on_outlined,
                text: address,
              ),
            const SizedBox(
              height: 8,
            ),
            HomeTextWidget(
              icon: Icons.calendar_month_outlined,
              text: jHijriDate,
            ),
            const SizedBox(
              height: 25,
            ),
            const HomeAudioBuilderWidget(),
            const SizedBox(
              height: 25,
            ),
            ContentTextWidget(text: S.of(context).content),
            const SizedBox(
              height: 5,
            ),
            const ContentItemListviewWidget(),
            const SizedBox(
              height: 30,
            ),
            const AyatDayWidget()
          ],
        ),
      ),
    );
  }
}
