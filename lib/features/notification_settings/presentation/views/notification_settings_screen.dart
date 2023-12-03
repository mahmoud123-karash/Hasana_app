import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quran_app/core/cache/shared_preference.dart';
import 'package:quran_app/features/notification_settings/presentation/manager/adhan_cubit/adhan_cubit.dart';
import 'package:quran_app/features/notification_settings/presentation/views/widgets/text_name_noti_widget.dart';
import 'widgets/adan_sound_widget.dart';
import 'widgets/azkar_masah_switch_widget.dart';
import 'widgets/azkar_sabah_switch_widget.dart';
import 'widgets/salwat_switch_widget.dart';

class NotificationSettingsScreen extends StatefulWidget {
  const NotificationSettingsScreen({
    super.key,
    required this.sal,
    required this.azk,
  });
  final bool sal;
  final bool azk;

  @override
  State<NotificationSettingsScreen> createState() =>
      _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState
    extends State<NotificationSettingsScreen> {
  double? latitude;
  @override
  void didChangeDependencies() {
    latitude = cache_helper.getData(key: 'latitude') ?? 0.0;
    setState(() {});
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('إعدادات  الإشعارات'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            if (widget.azk) const TextNameNotiWidget(text: 'الأذكار'),
            if (widget.azk) const AzkarSabahSwitchWidget(),
            if (widget.azk) const AzkarMasahSwitchWidget(),
            if (widget.azk) const SizedBox(height: 30),
            if (widget.sal)
              if (cache_helper.getData(key: 'latitude') != null)
                if (widget.sal) const SlawatSwitchWidget(),
            if (widget.sal) const SizedBox(height: 30),
            if (widget.sal)
              if (cache_helper.getData(key: 'latitude') != null)
                BlocProvider(
                  create: (context) => AdhanCubit(),
                  child: const AdanSoundWidget(),
                ),
          ],
        ),
      ),
    );
  }
}
