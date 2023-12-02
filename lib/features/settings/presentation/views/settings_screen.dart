import 'package:flutter/material.dart';
import 'package:quran_app/core/contants/constants.dart';
import 'package:quran_app/core/shared/components.dart';
import 'package:quran_app/features/about_app/presentation/views/about_app_screen.dart';
import 'package:quran_app/features/settings/presentation/views/widgets/firebase_notification_switch_widget.dart';
import 'package:quran_app/features/settings/presentation/views/widgets/item_settings_widget.dart';
import 'package:quran_app/features/settings/presentation/views/widgets/theme_item_widget.dart';
import '../../../../core/services/services.dart';
import '../../../../generated/l10n.dart';
import 'widgets/soon_list_tile_widget.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          S.of(context).settings,
        ),
      ),
      body: ListView(
        children: [
          const FirebaseNotificationSwitchWIdget(),
          const ThemeItemWidget(),
          const SoonListTileWidget(
            text: 'لغة التطبيق',
            icon: Icons.language_outlined,
          ),
          ItemSettingsWidget(
            ontap: () {
              share(
                title: 'تطبيق حسنة',
                text: 'إستمتع بتجربة دينية متكاملة',
              );
            },
            text: 'شارك تؤجر',
            icon: Icons.share_outlined,
          ),
          ItemSettingsWidget(
            ontap: () {
              openUrl(url: appLink);
            },
            text: 'تقييم التطبيق',
            icon: Icons.star_border,
          ),
          ItemSettingsWidget(
            ontap: () {
              navigatorTo(context, const AboutAppScreen());
            },
            text: 'حول التطبيق',
            icon: Icons.info_outline_rounded,
          ),
          ItemSettingsWidget(
            ontap: () {
              openEmail();
            },
            text: 'تواصل معانا',
            icon: Icons.email_outlined,
          ),
          ItemSettingsWidget(
            ontap: () {
              openUrl(url: appPrivacy);
            },
            text: 'السياسة والخصوصية',
            icon: Icons.privacy_tip_outlined,
          ),
        ],
      ),
    );
  }
}
